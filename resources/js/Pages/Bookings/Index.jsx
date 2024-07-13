import React, { useEffect, useState } from "react";
import Layout from "../../components/Layout";
import Box from "@mui/material/Box";
import { DataGrid } from "@mui/x-data-grid";
import { Row, Col, Form, Button, Modal } from "react-bootstrap";

function Index({ bookings, users }) {
	const [data, setData] = useState([]);
	const [show, setShow] = useState(false);

	const handleClose = () => setShow(false);
	const handleShow = () => setShow(true);

	useEffect(() => {
		setData(bookings);
	}, [bookings]);

	const columns = [
		{ field: "id", headerName: "ID", width: 90 },
		{
			field: "id_user",
			headerName: "Người đặt",
			width: 150,
			editable: true,
		},
		{
			field: "id_customer",
			headerName: "Người nhận",
			width: 150,
			editable: true,
		},
		{
			field: "id_service",
			headerName: "Dịch vụ",
			width: 110,
			editable: true,
		},
		{
			field: "time",
			headerName: "Thời gian đặt",
			width: 200,
			editable: true,
		},
		{
			field: "end_time",
			headerName: "Thời hạn chời lịch",
			width: 200,
			editable: true,
		},
		{
			field: "created_at",
			headerName: "Ngày tạo",
			width: 200,
			editable: true,
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
						<Form>
							<Modal.Header closeButton>
								<Modal.Title>Đặt lịch mới</Modal.Title>
							</Modal.Header>
							<Modal.Body>
								<Row>
									<Col>
										<Form.Group className="mb-3" controlId="formCustomer">
											<Form.Label>Chọn customer</Form.Label>
											<Form.Select>
												<option>Chọn 1 người nhận lịch</option>
												<option value="1">One</option>
												<option value="2">Two</option>
												<option value="3">Three</option>
											</Form.Select>
										</Form.Group>
									</Col>
								</Row>
							</Modal.Body>
							<Modal.Footer>
								<Button variant="secondary" onClick={handleClose}>
									Thoát ra
								</Button>
								<Button variant="primary" onClick={handleClose}>
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
