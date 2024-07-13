import React, { useEffect, useState } from "react";
import Layout from "../../components/Layout";
import Box from "@mui/material/Box";
import { DataGrid } from "@mui/x-data-grid";
import { Button, Modal } from "react-bootstrap";

function Index({ bookings }) {
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
			valueGetter: (params) => (params.row.user ? params.row.user.name : ""),
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
			headerName: "Thời hạn",
			width: 200,
			editable: true,
		},
		// {
		// 	field: "fullName",
		// 	headerName: "Full name",
		// 	description: "This column has a value getter and is not sortable.",
		// 	sortable: false,
		// 	width: 160,
		// 	valueGetter: (value, row) => `${row.firstName || ""} ${row.lastName || ""}`,
		// },
	];

	return (
		<Layout>
			<>
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
			</>
		</Layout>
	);
}

export default Index;
