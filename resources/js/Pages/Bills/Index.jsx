import React, { useEffect, useState } from "react";
import Layout from "../../components/Layout";
import Button from "react-bootstrap/Button";
import Modal from "react-bootstrap/Modal";
import { Notyf } from "notyf";
import { Box, Container, Switch, Typography } from "@mui/material";
import { DataGrid } from "@mui/x-data-grid";
import "notyf/notyf.min.css";
import Swal from "sweetalert2";
import axios from "axios";

function Index({ bills }) {
    const [data, setData] = useState(bills);

    const renderStatus = (params) => {
        switch (params.value) {
            case 0:
                return 'Đặt hàng';
            case 1:
                return 'Gửi hàng';
            case 2:
                return 'Thành công';
            default:
                return '';
        }
    };

    const columns = [
        { field: 'id', headerName: 'ID', width: 70 },
        { field: 'name', headerName: 'Name', width: 200 },
        { field: 'phone', headerName: 'Phone', width: 150 },
        { field: 'address', headerName: 'Address', width: 250 },
        { field: 'email', headerName: 'Email', width: 250 },
        { field: 'total', headerName: 'Total', width: 130, type: 'number' },
        {
          field: 'status',
          headerName: 'Status',
          width: 150,
          renderCell: renderStatus, // Use the custom renderer
        },
        {
            headerName: "Chi tiết",
            width: 70,
            renderCell: (params) => (
                <a href={'/bills/'+params.id} className="btn btn-sm btn-warning">Edit</a>
            ),
        },
      ];


    return (
        <Layout>
            <>
                <Box sx={{ height: 400, width: "100%" }}>
                    <DataGrid
                        rows={data}
                        columns={columns}
                        pageSize={5}
                        checkboxSelection
                        editMode="cell"
                        initialState={{
                            pagination: {
                                paginationModel: {
                                    pageSize: 5,
                                },
                            },
                        }}
                        pageSizeOptions={[5]}
                        disableRowSelectionOnClick
                    />
                </Box>
            </>
        </Layout>
    );
}

export default Index;
