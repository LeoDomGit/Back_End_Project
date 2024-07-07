import React, { useEffect, useState } from "react";
import Layout from "../../components/Layout";
import Button from "react-bootstrap/Button";
import Modal from "react-bootstrap/Modal";
import { Notyf } from "notyf";
import { Box, Switch, Typography } from "@mui/material";
import { DataGrid } from "@mui/x-data-grid";
import "notyf/notyf.min.css";
import Swal from "sweetalert2";
import axios from "axios";
function Index({ brands }) {
  const [brand, setBrand] = useState("");
  const [data, setData] = useState(brands);
  const [show, setShow] = useState(false);
  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);
  const api = "http://localhost:8000/api/";
  const app = "http://localhost:8000/";
  const formatCreatedAt = (dateString) => {
    const date = new Date(dateString);
    return date.toLocaleString();
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
  const columns = [
    {
      field: "id",
      headerName: "#",
      width: 100,
      renderCell: (params) => params.rowIndex,
    },
    { field: "name", headerName: "Thương hiệu", width: 200, editable: true },
    { field: "slug", headerName: "Slug", width: 200, editable: false },
    ,
    {
      field: "status",
      headerName: "Status",
      width: 70,
      renderCell: (params) => (
        <Switch
          checked={params.value == 1}
          onChange={(e) => switchBrand(params, e.target.checked ? 1 : 0)}
          inputProps={{ "aria-label": "controlled" }}
        />
      ),
    },
    {
      field: "created_at",
      headerName: "Created at",
      width: 200,
      valueGetter: (params) => formatCreatedAt(params),
    },
  ];
  const submitBrand = () => {
    axios
      .post("/brands", {
        name: brand,
      })
      .then((res) => {
        if (res.data.check == true) {
          notyf.open({
            type: "success",
            message: "Đã thêm thành công",
          });
          setData(res.data.data);
          setShow(false);
          setRole("");
        } else if (res.data.check == true) {
          notyf.open({
            type: "success",
            message: res.data.msg,
          });
        }
      });
  };
  const resetCreate = () => {
    setBrand("");
    setShow(true);
  };
  const switchBrand = (params, value) => {
    var id = params.id;
    var field = params.field;
    axios
      .put(
        `/brands/${id}`,
        {
          [field]: value,
        }
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
  const handleCellEditStop = (id, field, value) => {
    if (value != "") {
      axios
        .put(
          `/brands/${id}`,
          {
            name: value,
          }
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
    } else {
      Swal.fire({
        icon: "question",
        text: "Xoá thương hiệu này ?",
        showDenyButton: true,
        showCancelButton: false,
        confirmButtonText: "Đúng",
        denyButtonText: `Không`,
      }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
          axios
            .delete(
              `/brands/${id}`
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
                  message: "Xoá thương hiệu thành công",
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
            <Modal.Title>Tạo thương hiệu sản phẩm</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <input
              type="text"
              className="form-control"
              onChange={(e) => setBrand(e.target.value)}
            />
          </Modal.Body>
          <Modal.Footer>
            <Button variant="secondary" onClick={handleClose}>
              Đóng
            </Button>
            <Button
              variant="primary"
              disabled={brand == "" ? true : false}
              onClick={(e) => submitBrand()}
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
        </div>
      </>
    </Layout>
  );
}

export default Index;
