import React, { useEffect, useState } from "react";
import Layout from "../../components/Layout";
import Button from "react-bootstrap/Button";
import Modal from "react-bootstrap/Modal";
import { Notyf } from "notyf";
import { Box, InputLabel, MenuItem, Switch, Typography } from "@mui/material";
import { DataGrid } from "@mui/x-data-grid";
import "notyf/notyf.min.css";
import Swal from "sweetalert2";
import FormControl from "@mui/material/FormControl";
import Select from "@mui/material/Select";
import axios from "axios";
function Index({ permissions, roles }) {
    const [permission, setPermission] = useState("");
    const [data, setData] = useState(permissions);
    const [dataRole, setDataRole] = useState(roles);
    const [idRole,setIdRole]= useState(0);
    const [show, setShow] = useState(false);
    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);
    const [selectedPermissions, setSelectedPermissions] = useState([]);
    const handleChange = (event) => {
      setSelectedPermissions(event.target.value);
    };
    const api = "http://localhost:8000/api/";
    const app = "http://localhost:8000/";
    const formatCreatedAt = (dateString) => {
        const date = new Date(dateString);
        return date.toLocaleString();
    };
    const submitRolePermission = ()=>{
      axios.post('/permissions/add-role-permision',{
        role:idRole,
        permissions:selectedPermissions
      }).then((res)=>{
        console.log(res.data.check);
        if(res.data.check==true){
          notyf.open({
            type: "success",
            message: "Set quyền thành công",
        });
          setSelectedPermissions(res.data.permissions);
        }
      })
    }
    useEffect(() => {
        console.log(roles);
    }, []);
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
    const columns = [
        {
            field: "id",
            headerName: "#",
            width: 100,
            renderCell: (params) => params.rowIndex,
        },
        {
            field: "name",
            headerName: "Quyền tài khoản",
            width: 200,
            editable: true,
        },
        {
            field: "created_at",
            headerName: "Created at",
            width: 200,
            valueGetter: (params) => formatCreatedAt(params),
        },
    ];
    const submitpermission = () => {
        axios
            .post("/permissions", {
                name: permission,
            })
            .then((res) => {
                if (res.data.check == true) {
                    notyf.open({
                        type: "success",
                        message: "Đã thêm thành công",
                    });
                    setData(res.data.data);
                    setShow(false);
                } else if (res.data.check == true) {
                    notyf.open({
                        type: "success",
                        message: res.data.msg,
                    });
                }
            });
    };
    useEffect(()=>{
      fetch('/permissions/roles/'+idRole)
      .then((res)=>res.json())
      .then((res)=>{
        setSelectedPermissions(res.permissions);
      })
    },[idRole])
    const resetCreate = () => {
        setPermission("");
        setShow(true);
    };
    const handleCellEditStop = (id, field, value) => {
        if (value != "") {
            axios
                .put(
                    `/permissions/${id}`,
                    {
                        name: value,
                    }
                )
                .then((res) => {
                    if (res.data.check == true) {
                        notyf.open({
                            type: "success",
                            message: "Chỉnh sửa quyền tài khoản thành công",
                        });
                        setData(res.data.data);
                    } else if (res.data.check == false) {
                        notyf.open({
                            type: "error",
                            message: res.data.msg,
                        });
                    }
                });
        } else {
            Swal.fire({
                icon: "question",
                text: "Xoá quyền này ?",
                showDenyButton: true,
                showCancelButton: false,
                confirmButtonText: "Đúng",
                denyButtonText: `Không`,
            }).then((result) => {
                if (result.isConfirmed) {
                    axios
                        .delete(
                            `/permissions/${id}`
                        )
                        .then((res) => {
                            if (res.data.check == true) {
                                notyf.open({
                                    type: "success",
                                    message: "Xoá quyền tài khoản thành công",
                                });
                                setData(res.data.data);
                            } else if (res.data.check == false) {
                                notyf.open({
                                    type: "error",
                                    message: res.data.msg,
                                });
                            }
                        });
                } else if (result.isDenied) {
                }
            });
        }
    };
    return (
        <Layout>
            <>
                <Modal show={show} onHide={handleClose}>
                    <Modal.Header closeButton>
                        <Modal.Title>Tạo quyền tài khoản</Modal.Title>
                    </Modal.Header>
                    <Modal.Body>
                        <input
                            type="text"
                            className="form-control"
                            onChange={(e) => setPermission(e.target.value)}
                        />
                    </Modal.Body>
                    <Modal.Footer>
                        <Button variant="secondary" onClick={handleClose}>
                            Đóng
                        </Button>
                        <Button
                            variant="primary"
                            disabled={permission == "" ? true : false}
                            onClick={(e) => submitpermission()}
                        >
                            Tạo mới
                        </Button>
                    </Modal.Footer>
                </Modal>
                <nav className="navbar navbar-expand-lg navbar-light bg-light">
                    <div className="container-fluid">
                        <button
                            className="navbar-toggler"
                            type="button"
                            data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent"
                            aria-expanded="false"
                            aria-label="Toggle navigation"
                        >
                            <span className="navbar-toggler-icon" />
                        </button>
                        <div
                            className="collapse navbar-collapse"
                            id="navbarSupportedContent"
                        >
                            <ul className="navbar-nav me-auto mb-2 mb-lg-0">
                                <li className="nav-item">
                                    <a
                                        className="btn btn-primary"
                                        onClick={(e) => resetCreate()}
                                        aria-current="page"
                                        href="#"
                                    >
                                        Tạo mới
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <div className="row">
                    <div className="col-md-6">
                        {data && data.length > 0 && (
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
                                    onCellEditStop={(params, e) =>
                                        handleCellEditStop(
                                            params.row.id,
                                            params.field,
                                            e.target.value
                                        )
                                    }
                                />
                            </Box>
                        )}
                    </div>
                    <div className="col-md">
                        <div className="row pt-2">
                            <div className="col-md-4">
                                <FormControl sx={{ m: 1, minWidth: "100%" }}>
                                    <InputLabel id="permissions-select-label">
                                        Loại tài khoản
                                    </InputLabel>
                                    <Select
                                        labelId="permissions-select-label"
                                        id="permissions-select"
                                        autoWidth
                                        value={idRole}
                                        onChange={(e)=>setIdRole(e.target.value)}
                                        label="Permissions"
                                    >
                                        {roles &&
                                            roles.length > 0 &&
                                            roles.map((item) => (
                                                <MenuItem
                                                    key={item.id}
                                                    value={item.id}
                                                >
                                                    {item.name}
                                                </MenuItem>
                                            ))}
                                    </Select>
                                </FormControl>
                            </div>
                            <div className="col-md-4">
                                <FormControl sx={{ m: 1, minWidth: 300 }}>
                                    <InputLabel id="permissions-select-label">
                                        Permissions
                                    </InputLabel>
                                    <Select
                                        labelId="permissions-select-label"
                                        id="permissions-select"
                                        multiple
                                        autoWidth
                                        value={selectedPermissions}
                                        onChange={handleChange}
                                        label="Permissions"
                                    >
                                        {permissions &&
                                            permissions.length > 0 &&
                                            permissions.map((item) => (
                                                <MenuItem
                                                    key={item.id}
                                                    value={item.id}
                                                >
                                                    {item.name}
                                                </MenuItem>
                                            ))}
                                    </Select>
                                </FormControl>
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-md-3">
                          <button className="ms-2 btn btn-sm btn-primary" onClick={(e)=>submitRolePermission()}>Thêm</button>

                            </div>
                        </div>
                    </div>
                </div>
            </>
        </Layout>
    );
}

export default Index;
