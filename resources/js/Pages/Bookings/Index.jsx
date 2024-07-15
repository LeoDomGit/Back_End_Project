import React, { useEffect, useState } from "react";
import Layout from "../../components/Layout";
import Box from "@mui/material/Box";
import { DataGrid } from "@mui/x-data-grid";
import { Row, Col, Form, Button, Modal } from "react-bootstrap";
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import axios from "axios";
import { Notyf } from "notyf";
import "notyf/notyf.min.css";

function Index({ bookings, services, customer }) {
	const [data, setData] = useState([]);
	const [servicesData, setServicesData] = useState([]);
	const [customerData, setCustomerData] = useState(customer);
	const [show, setShow] = useState(false);

	const handleClose = () => {
		setShow(false);
		setSelectedCustomer(null);
		setSelectedService(null);
		setSelectedDate(null);
		setSelectedTime(null);
		setEndTime(null);
	};
	const handleShow = () => setShow(true);

	useEffect(() => {
		setData(bookings);
		setServicesData(services);
		setCustomerData(customer);
	}, [bookings, services, customer]);

	const notyf = new Notyf({
		duration: 1000,
		position: {
			x: "right",
			y: "top",
		},
		types: [
			{
				type: "warning",
				background: "orange",
				icon: {
					className: "material-icons",
					tagName: "i",
					text: "warning",
				},
			},
			{
				type: "error",
				background: "indianred",
				duration: 2000,
				dismissible: true,
			},
			{
				type: "success",
				background: "green",
				color: "white",
				duration: 2000,
				dismissible: true,
			},
			{
				type: "info",
				background: "#24b3f0",
				color: "white",
				duration: 1500,
				dismissible: false,
				icon: '<i class="bi bi-bag-check"></i>',
			},
		],
	});

	// Add new booking
	const [selectedCustomer, setSelectedCustomer] = useState(null);
	const [selectedService, setSelectedService] = useState(null);
	const [selectedDate, setSelectedDate] = useState(null);
	const [selectedTime, setSelectedTime] = useState(null);
	const [endTime, setEndTime] = useState(null);

	const handleTimeChange = (time) => {
		setSelectedTime(time);
		if (time) {
			calculateEndTime(time);
		}
	};

	const calculateEndTime = (startTime) => {
		if (!startTime) return;
		const endTimes = new Date(startTime);
		endTimes.setHours(endTimes.getHours() + 1); // Add 1 hour
		setEndTime(endTimes);
	};

	const onSubmit = (e) => {
		e.preventDefault();

		if (!selectedCustomer || !selectedService || !selectedDate || !selectedTime) {
			notyf.open({
				type: "error",
				message: "Vui loại điền đầy đủ thông tin đặt lịch",
			});
			return;
		}

		const formData = new FormData();
		formData.append("customer", Number(selectedCustomer));
		formData.append("service", Number(selectedService));
		formData.append("date", selectedDate.toLocaleDateString("en-CA"));
		formData.append("time", selectedTime.toLocaleTimeString("en-US", { hour12: false }));
		formData.append("end_time", endTime.toLocaleTimeString("en-US", { hour12: false }));

		console.log(...formData);
		axios.post("/api/booking", formData).then((res) => {
			if (res.data.check) {
				setData(res.data.data);
				notyf.open({
					type: "success",
					message: res.data.msg,
				});
				handleClose();
			} else {
				notyf.open({
					type: "error",
					message: res.data.msg,
				});
			}
		});
	};

	// Delete booking
	const handleDelete = (id) => {
		axios.delete(`/api/booking/${id}`).then((res) => {
			if (res.data.check) {
				setData(res.data.data);
				notyf.open({
					type: "success",
					message: res.data.msg,
				});
			} else {
				notyf.open({
					type: "error",
					message: res.data.msg,
				});
			}
		});
	};

	const columns = [
		{ field: "id", headerName: "ID", width: 90 },
		{
			field: "id_user",
			headerName: "Người đặt",
			width: 150,
			renderCell: (params) => {
				return params.row.user.name;
			},
		},
		{
			field: "id_customer",
			headerName: "Nhân viên",
			width: 150,
			editable: true,
			renderCell: (params) => {
				return params.row.customer.name;
			},
		},
		{
			field: "id_service",
			headerName: "Dịch vụ",
			width: 240,
			editable: true,
			renderCell: (params) => {
				return params.row.service.name;
			},
		},
		{
			field: "time",
			headerName: "Thời gian đặt",
			width: 200,
			editable: true,
		},
		{
			field: "end_time",
			headerName: "Thời hạn hết lịch",
			width: 200,
		},
		{
			field: "created_at",
			headerName: "Ngày tạo",
			width: 160,
		},
		{
			field: "updated_at",
			headerName: "Ngày thay đổi",
			width: 160,
		},
		{
			field: "action",
			headerName: "Thao tác",
			width: 150,
			renderCell: (params) => {
				return (
					<Button variant="danger" onClick={() => handleDelete(params.row.id)}>
						Xóa lịch
					</Button>
				);
			},
		},
	];

	return (
		<Layout>
			<>
				<Row>
					<Col>
						<Button variant="primary" className="mb-3" onClick={handleShow}>
							Đặt lịch ngay
						</Button>
					</Col>

					<Modal show={show} onHide={handleClose}>
						<Form onSubmit={onSubmit}>
							<Modal.Header closeButton>
								<Modal.Title>Đặt lịch mới</Modal.Title>
							</Modal.Header>
							<Modal.Body>
								<Row>
									<Col md={6}>
										<Form.Group className="mb-3" controlId="formCustomer">
											<Form.Label aria-disabled="true">Chọn Loại dịch vụ</Form.Label>
											<Form.Select onChange={(e) => setSelectedService(e.target.value)}>
												<option>Chọn 1 loại dịch vụ</option>
												{servicesData &&
													servicesData.length > 0 &&
													servicesData.map((service, index) => (
														<option key={index} value={service.id}>
															{service.name}
														</option>
													))}
											</Form.Select>
										</Form.Group>
									</Col>
									<Col>
										<Form.Group className="mb-3" controlId="formCustomer">
											<Form.Label>Chọn nhân viên</Form.Label>
											<Form.Select onChange={(e) => setSelectedCustomer(e.target.value)}>
												<option>Chọn 1 nhân viên</option>
												{customerData &&
													customerData.length > 0 &&
													customerData.map((user, index) => (
														<option key={index} value={user.id}>
															{user.name}
														</option>
													))}
											</Form.Select>
										</Form.Group>
									</Col>
									<Col md={12}>
										<Form.Group className="mb-3" controlId="formBookingTime">
											<Form.Label>Thời gian đặt</Form.Label>
											<Row>
												<Col>
													<DatePicker selected={selectedDate} onChange={(e) => setSelectedDate(e)} dateFormat="yyyy-MM-dd" placeholderText="Chọn ngày" />
												</Col>
												<Col>
													<DatePicker
														selected={selectedTime}
														onChange={handleTimeChange}
														showTimeSelect
														showTimeSelectOnly
														timeIntervals={15}
														timeCaption="Thời gian"
														dateFormat="h:mm aa"
														placeholderText="Chọn giờ"
													/>
												</Col>
											</Row>
										</Form.Group>
									</Col>
									<Col>
										{selectedTime && endTime && (
											<p>
												Lịch hẹn từ: {selectedTime.toLocaleTimeString([], { hour: "2-digit", minute: "2-digit" })} đến {endTime.toLocaleTimeString([], { hour: "2-digit", minute: "2-digit" })}
											</p>
										)}
									</Col>
								</Row>
							</Modal.Body>
							<Modal.Footer>
								<Button variant="secondary" onClick={handleClose}>
									Thoát ra
								</Button>
								<Button variant="primary" type="submit">
									Đặt Ngay
								</Button>
							</Modal.Footer>
						</Form>
					</Modal>
				</Row>
				<Row>
					<Col>
						<Box sx={{ height: 400, width: "100%" }}>
							<DataGrid
								rows={data}
								columns={columns}
								initialState={{
									pagination: {
										paginationModel: {
											pageSize: 5,
										},
									},
								}}
								pageSizeOptions={[5]}
								checkboxSelection
								disableRowSelectionOnClick
							/>
						</Box>
					</Col>
				</Row>
			</>
		</Layout>
	);
}

export default Index;
