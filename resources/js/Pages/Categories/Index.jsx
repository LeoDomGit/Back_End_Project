import React, { useEffect, useState } from 'react'
import Layout from '../../components/Layout'
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import { Notyf } from 'notyf';
import { Box, Switch, Typography } from "@mui/material";
import { DataGrid } from '@mui/x-data-grid';
import 'notyf/notyf.min.css';
import Swal from 'sweetalert2'
import axios from 'axios';
function Index({ categories }) {
  const [category, setCategory] = useState('');
  const [id_parent, setIdParent] = useState(null);
  const [data, setData] = useState(categories)
  const [show, setShow] = useState(false);
  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);
  const api = 'http://localhost:8000/api/';
  const app = 'http://localhost:8000/';
  const formatCreatedAt = (dateString) => {
    const date = new Date(dateString);
    return date.toLocaleString(); 
};

const renderParentSelect = (params) => {
  return (
    <select
      value={params.value || ''}
      className='form-control mt-2'
      onChange={(e) => handleCellEditStop(params.id, 'id_parent', e.target.value)}
    >
      <option value=''>None</option>
      {categories.map(category => (
        <option key={category.id} value={category.id}>{category.name}</option>
      ))}
    </select>
  );
};
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
        background: 'green',
        color: 'white',
        duration: 2000,
        dismissible: true
      },
      {

        type: 'info',
        background: '#24b3f0',
        color: 'white',
        duration: 1500,
        dismissible: false,
        icon: '<i class="bi bi-bag-check"></i>'
      }
    ]
  });
  const columns = [
    { field: "id", headerName: "#", width: 100, renderCell: (params) => params.rowIndex },
    { field: 'name', headerName: "Loại tài sản phẩm", width: 200, editable: true },
    { field: 'slug', headerName: "Slug", width: 200, editable: false },
    {
      field: 'id_parent', headerName: "Parent", width: 200, renderCell: renderParentSelect
    },
    {
      field: "status",
      headerName: "Status",
      width: 70,
      renderCell: (params) => (
        <Switch
          checked={params.value == 1}
          onChange={(e) => switchCate(params, e.target.checked ? 1 : 0)}
          inputProps={{ "aria-label": "controlled" }}
        />
      ),
    },
    {
      field: 'created_at', headerName: 'Created at', width: 200, valueGetter: (params) => formatCreatedAt(params)
    }
  ];
  const switchCate = (params, value) => {
    var id = params.id;
    var field = params.field;
    axios
      .put(
        `/categories/${id}`,
        {
          [field]: value,
        }

      )
      .then((res) => {
        if (res.data.check == true) {
          notyf.open({
            type: "success",
            message: "Chỉnh sửa thương hiệu sản phẩm thành công",
          });
          setData(res.data.data);
        } else if (res.data.check == false) {
          notyf.open({
            type: "error",
            message: res.data.msg,
          });
        }
      });
  };
  const submitCategory = () => {
    axios.post('/categories', {
      id_parent:id_parent,
      name: category
    }).then((res) => {
      if (res.data.check == true) {
        notyf.open({
          type: "success",
          message: "Đã thêm thành công",
        });
        setData(res.data.data);
        setShow(false);
        setRole('')
      }else if(res.data.check==true){
        notyf.open({
          type: "success",
          message: res.data.msg,
        });
      }
    })
  }
  const resetCreate = () => {
    setCategory('');
    setShow(true)
  }
  const handleCellEditStop = (id, field, value) => {
    if(value!=''){
        axios
        .put(
          `/categories/${id}`,
          { [field]: value },
          // {
          //     headers: {
          //         Authorization: `Bearer ${localStorage.getItem("token")}`,
          //         Accept: "application/json",
          //     },
          // }
        )
        .then((res) => {
          if (res.data.check == true) {
            notyf.open({
              type: "success",
              message: "Chỉnh sửa loại sản phẩm thành công",
            });
            setData(res.data.data);
  
          } else if (res.data.check == false) {
            notyf.open({
              type: "error",
              message: res.data.msg,
            });
          }
        });
    }else{
      if(field!="id_parent"){
        Swal.fire({
          icon:'question',
          text: "Xoá loại sản phẩm này ?",
          showDenyButton: true,
          showCancelButton: false,
          confirmButtonText: "Đúng",
          denyButtonText: `Không`
        }).then((result) => {
          /* Read more about isConfirmed, isDenied below */
          if (result.isConfirmed) {
              axios
              .delete(
                `/categories/${id}`,
                // {
                //     headers: {
                //         Authorization: `Bearer ${localStorage.getItem("token")}`,
                //         Accept: "application/json",
                //     },
                // }
              )
              .then((res) => {
                if (res.data.check == true) {
                  notyf.open({
                    type: "success",
                    message: "Xoá loại sản phẩm thành công",
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
      }else{
        axios
        .put(
          `/categories/${id}`,
          { [field]: value },
          // {
          //     headers: {
          //         Authorization: `Bearer ${localStorage.getItem("token")}`,
          //         Accept: "application/json",
          //     },
          // }
        )
        .then((res) => {
          if (res.data.check == true) {
            notyf.open({
              type: "success",
              message: "Chỉnh sửa loại sản phẩm thành công",
            });
            setData(res.data.data);
  
          } else if (res.data.check == false) {
            notyf.open({
              type: "error",
              message: res.data.msg,
            });
          }
        });
      }

    }
   
  };
  return (

    <Layout>
      <>
        <Modal show={show} onHide={handleClose}>
          <Modal.Header closeButton>
            <Modal.Title>Tạo loại sản phẩm</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <input type="text" className='form-control' onChange={(e) => setCategory(e.target.value)} />
            <label htmlFor="">Parents</label>
            <select name="" id="" onChange={(e)=>setIdParent(e.target.value)} defaultValue={0} className="form-control">
                <option value="0" disabled>Chọn một loại sản phẩm phụ thuộc </option>
                {categories.length>0 && categories.map((item,index)=>(
                  <option value={item.id}>{item.name}</option>
                ))}
            </select>
          </Modal.Body>
          <Modal.Footer>
            <Button variant="secondary" onClick={handleClose}>
              Đóng
            </Button>
            <Button variant="primary" disabled={category == '' ? true : false} onClick={(e) => submitCategory()}>
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
            <div className="collapse navbar-collapse" id="navbarSupportedContent">
              <ul className="navbar-nav me-auto mb-2 mb-lg-0">
                <li className="nav-item">
                  <a className="btn btn-primary" onClick={(e) => resetCreate()} aria-current="page" href="#">
                    Tạo mới
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
        <div className="row">
          <div className="col-md-8">
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
                    handleCellEditStop(params.row.id, params.field, e.target.value)
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