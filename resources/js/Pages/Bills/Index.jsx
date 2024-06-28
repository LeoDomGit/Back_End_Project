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
          renderEditCell: (params) => <EditStatus {...params} />,
        },
      ];
    //   useEffect(() => {
    //     axios.get('https://your-backend-url.com/api/bills')
    //       .then(response => {
    //         setBills(response.data);
    //         setLoading(false);
    //       })
    //       .catch(error => {
    //         console.error('There was an error fetching the bills!', error);
    //         setLoading(false);
    //       });
    //   }, []);

    return (
        <Layout>
            <>
            <Box sx={{ height: 400, width: "100%" }}>
            <DataGrid
            rows={bills}
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
