import React, { useEffect, useState } from 'react'
import Layout from '../../components/Layout'
import Modal from 'react-bootstrap/Modal';
import Button from 'react-bootstrap/Button';
import { Box, Select, Switch, Typography } from "@mui/material";
import { Notyf } from 'notyf';
import 'notyf/notyf.min.css';
import axios from 'axios';
import { DataGrid } from '@mui/x-data-grid';
function Index({roles,users}) {
    const [show1, setShow1] = useState(false);
    const [show, setShow] = useState(false);
    const handleClose = () => setShow(false);
    const handleClose1 = () => setShow1(false);
    const style = {
        position: 'absolute',
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        width: 400,
        bgcolor: 'background.paper',
        border: '2px solid #000',
        boxShadow: 24,
        p: 4,
      };
    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [idRole, setIdRole] = useState(0);
    const [data,setData]= useState(users);
    const handleShow = () => setShow(true);
    const resetCreate = () => {
        setName('');
        setEmail('');
        setIdRole(0);
        handleClose()
    }
    const notyf = new Notyf({
        duration: 1000,
        position: {
            x: 'right',
            y: 'top',
        },
        types: [
            {
                type: 'warning',
                background: 'orange',
                icon: {
                    className: 'material-icons',
                    tagName: 'i',
                    text: 'warning'
                }
            },
            {
                type: 'error',
                background: 'indianred',
                duration: 2000,
                dismissible: true
            },
            {
                type: 'success',
                background: '#7dd3e8',
                duration: 2000,
                dismissible: true
            }
        ]
    });
    const [idUser,setIdUser]= useState(0);

    const setEditRole = (idUser)=>{
        setIdUser(idUser);
        setShow1(true);
    }
    const formatCreatedAt = (dateString) => {
        const date = new Date(dateString);
        return date.toLocaleString();
    };
    const submitCreate = () => {
        if (name == '') {
            notyf.open({
                type: 'error',
                message: 'Username is required'
            });
        } else if (email == '') {
            notyf.open({
                type: 'error',
                message: 'Email is required'
            });
        } else if (idRole == 0) {
            notyf.open({
                type: 'error',
                message: 'Please choose a role'
            });
        } else {
            axios.post('/users', {
                name: name,
                email: email,
                idRole: idRole
            },
            // {
            //     headers: {
            //         Authorization: `Bearer ${localStorage.getItem("token")}`,
            //         Accept: "application/json",
            //     },
            // }
        ).then((res) => {
                if (res.data.check == false) {
                    if (res.data.msg) {
                        notyf.open({
                            type: 'error',
                            message: res.data.msg
                        });
                    }
                } else if (res.data.check == true) {
                    notyf.open({
                        type: 'success',
                        message: 'Create successfully'
                    });
                    resetCreate();
                    if (res.data.data) {
                        setUsers(res.data.data);
                        resetCreate()
                    } else {
                        setUsers([]);
                    }
                }
            })
        }
    }
    function switchUser(params,value) {
        const newStatus = value == 'on' ? 1 : 0;
        axios.put('/users/switch/'+params.id,{
        },
        ).then((res) => {
            if (res.data.check == false) {
                if (res.data.msg) {
                    notyf.open({
                        type: 'error',
                        message: res.data.msg
                    });
                }
            } else if (res.data.check == true) {
                notyf.open({
                    type: 'success',
                    message: 'Switch successfully'
                });
                if (res.data.data) {
                    setData(res.data.data);
                } else {
                    setUsers([]);
                }
            }
        })
    }
    const submitEdit = ()=>{

        if(idRole==0 || idUser==0){
            notyf.open({
                type: 'error',
                message: 'Data is missing'
            });
            console.log(idRole, idUser);
        }else{
            axios.put('/users/'+idUser, {
               idRole:idRole,
            },
        ).then((res) => {
                if (res.data.check == false) {
                    if (res.data.msg) {
                        notyf.open({
                            type: 'error',
                            message: res.data.msg
                        });
                    }
                } else if (res.data.check == true) {
                    notyf.open({
                        type: 'success',
                        message: 'Create successfully'
                    });
                    const updatedUsers =  res.data.data.map(user => {
                        return {
                            ...user,
                            rolename: user.roles.name
                        };
                    });
                    setData(updatedUsers);
                    setIdRole(0);
                    setShow1(false);
                    
                }
            })
        }
    }

    const columns = [
        { field: "id", headerName: "#", width: 100, renderCell: (params) => params.rowIndex },
        { field: 'name', headerName: "Username", width: 100, editable: true },
        { field: 'email', headerName: "Email", width: 200, editable: true },
        {
            field: 'status',
            headerName: "Status",
            width: 70,
            renderCell: (params) => (
                <Switch
                    checked={params.value == 1}
                    onChange={(e) => switchUser(params,e.target.value)}
                    inputProps={{ 'aria-label': 'controlled' }}
                />
            )
        },
        {
            field: 'roleName',
            headerName: 'Role Name',
            width: 130,
            renderCell: (params) => (
                params.row.roles.name
            ),
        },
        {
            field: 'created_at', headerName: 'Created at', width: 200, valueGetter: (params) => formatCreatedAt(params)
        },
        {
            headerName: 'Roles',
            width: 70,
            renderCell: (params) => (
                <button className="btn btn-sm btn-primary" onClick={() => setEditRole(params.id)}>
                    Roles
                </button>
            )
        }
    ];
    const handleCellEditStop = (id, field,params, value) => {
        let data={};
        console.log(params);
        if (field == 'email') {
            data ={
                id:id,
                name:params.row.name,
                email:value 
            }
        } else if (field == 'name') {
            data ={
                id:id,
                name:value,
                email:params.row.email
            }
        }
        axios
            .put(
                `/users/${id}`,
                data,
                {
                    headers: {
                        Authorization: `Bearer ${localStorage.getItem("token")}`,
                        Accept: "application/json",
                    },
                }
            )
            .then((res) => {
                if (res.data.check == true) {
                    notyf.open({
                        type: "success",
                        message: "User is updated successfully",
                    });
                    setUsers(res.data.data);
                } else if (res.data.check == false) {
                    notyf.open({
                        type: "error",
                        message: res.data.msg,
                    });
                }
            });
    };
    useEffect(()=>{
    },[])
    return (
        <Layout>
            <>
            <Modal show={show1} onHide={handleClose1}>
                    <Modal.Header closeButton>
                        <Modal.Title>Roles Modal</Modal.Title>
                    </Modal.Header>
                    <Modal.Body>
                    <select name="" onChange={(e)=>setIdRole(e.target.value)} defaultValue={idRole} className='form-control'>
                        <option value="0" disabled >Choose a role</option>
                        {roles && roles.length>0 && roles.map((item,index)=>(
                            <option key={index} value={item.id}>{item.name}</option>
                        ))}
                    </select>

                    </Modal.Body>
                    <Modal.Footer>
                        <Button variant="secondary" size="sm" onClick={handleClose}>
                            Close
                        </Button>
                        <Button variant="primary" size="sm" onClick={() => submitEdit()}>
                            Save
                        </Button>
                    </Modal.Footer>
                </Modal>

                <Modal show={show} onHide={handleClose}>
                    <Modal.Header closeButton>
                        <Modal.Title>User Modal</Modal.Title>
                    </Modal.Header>
                    <Modal.Body>
                        <input type="text" placeholder={name == '' ? 'Please input username' : ''} value={name} className="form-control mb-2" onChange={(e) => setName(e.target.value)} />
                        <input type="text" placeholder={email == '' ? 'Please input email ' : ''} value={email} onChange={(e) => setEmail(e.target.value)} className="form-control mb-2" />
                        <select defaultValue={idRole} onChange={(e) => setIdRole(e.target.value)} className='form-control' >
                            <option value={0} disabled>Choose a role</option>
                            {roles && roles.length > 0 && roles.map((item, index) => (
                                <option key={index} value={item.id}>{item.name}</option>
                            ))}
                        </select>

                    </Modal.Body>
                    <Modal.Footer>
                        <Button variant="secondary" size="sm" onClick={handleClose}>
                            Close
                        </Button>
                        <Button variant="primary" size="sm" onClick={() => submitCreate()}>
                            Save
                        </Button>
                    </Modal.Footer>
                </Modal>
                <div className="row mb-2">
                    <div className="col-md-2">
                        <button className='btn btn-sm btn-primary' onClick={handleShow}>Create</button>
                    </div>
                </div>
                <div className="row">
                    <div className="col-md-7">
                    {data && data.length > 0 && (
                            <Box sx={{ height: 400, width: '100%' }}>
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
                                        handleCellEditStop(params.row.id, params.field,params, e.target.value)
                                      }
                                />
                            </Box>
                        )}
                    </div>
                </div>
            </>
        </Layout>
  )
}

export default Index