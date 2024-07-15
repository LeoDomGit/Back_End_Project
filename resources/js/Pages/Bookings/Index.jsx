import React, { useEffect, useState } from "react";
import Layout from "../../components/Layout";
import Box from "@mui/material/Box";
import { DataGrid } from "@mui/x-data-grid";
import { Row, Col, Table, Form, Button, Modal, InputGroup } from "react-bootstrap";
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import axios from "axios";
import { Notyf } from "notyf";
import "notyf/notyf.min.css";

function Index({ bookings }) {
	const [data, setData] = useState([]);

	useEffect(() => {
		setData(bookings);
	}, [bookings]);

	const [price, setPrice] = useState("");
	const [price1, setPrice1] = useState("");
	const [date, setDate] = useState("");
	const [date1, setDate1] = useState("");

	const handlePriceFilter = () => {
		const filtered = bookings.filter((item) => {
			const price = item.service.price;
			return (!price || price >= price) && (!price1 || price <= price1);
		});

		setData(filtered);
	};

	const handleDateFilter = () => {
		const filteredData = bookings.filter((item) => {
			const time = new Date(item.time);
			const fromTime = date ? new Date(date) : null;
			const toTime = date1 ? new Date(date1) : null;

			if (fromTime && !toTime) {
				return time >= fromTime;
			}

			if (!fromTime && toTime) {
				return time <= toTime;
			}

			if (fromTime && toTime) {
				return time >= fromTime && time <= toTime;
			}

			return true;
		});

		setData(filteredData);
	};

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

	return (
		<Layout>
			<>
				<Row>
					<Col md={6}>
						<h3>Danh sách lịch</h3>
					</Col>
					<Col md={12} className="d-flex justify-content-between">
						<Row className="mb-3">
							<Col>
								<Form.Group controlId="formBasic1">
									<Form.Label>
										<strong>Tìm kiếm theo giá:</strong>
									</Form.Label>
									<InputGroup>
										<Form.Control type="number" placeholder="Giá từ..." value={price} onChange={(e) => setPrice(e.target.value)} />
										<Form.Control type="number" placeholder="Đến..." value={price1} onChange={(e) => setPrice1(e.target.value)} />
										<Button className="btn btn-light btn-outline-success" onClick={handlePriceFilter}>
											Áp dụng
										</Button>
									</InputGroup>
								</Form.Group>
							</Col>
						</Row>
						<Row className="mb-3">
							<Col>
								<Form.Group controlId="formBasic2">
									<Form.Label>
										<strong>Tìm kiếm theo thời gian:</strong>
									</Form.Label>
									<InputGroup>
										<Form.Control type="date" value={date} onChange={(e) => setDate(e.target.value)} />
										<Form.Control type="date" value={date1} onChange={(e) => setDate1(e.target.value)} />
										<Button className="btn btn-light btn-outline-success" onClick={handleDateFilter}>
											Áp dụng
										</Button>
									</InputGroup>
								</Form.Group>
							</Col>
						</Row>
					</Col>
					<Col md={12}>
						<Table striped bordered hover responsive>
							<thead>
								<tr>
									<th>#</th>
									<th>Người đặt lịch</th>
									<th>Thợ nhận lịch</th>
									<th>Loại dịch vụ</th>
									<th>Đơn giá dịch vụ</th>
									<th>Thời gian đặt</th>
								</tr>
							</thead>
							<tbody>
								{data.length > 0 ? (
									data.map((booking, index) => (
										<tr key={index}>
											<td>{index + 1}</td>
											<td>{booking.user.name}</td>
											<td>{booking.customer.name}</td>
											<td>{booking.service.name}</td>
											<td>{Number(booking.service.price)}.VNĐ</td>
											<td>{booking.time}</td>
										</tr>
									))
								) : (
									<tr>
										<td colSpan={6} className="text-center">
											Không có dữ liệu{" "}
										</td>
									</tr>
								)}
							</tbody>
						</Table>
					</Col>
				</Row>
			</>
		</Layout>
	);
}

export default Index;
