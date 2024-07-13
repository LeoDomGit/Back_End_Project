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
import { Dropzone, FileMosaic } from "@dropzone-ui/react";
function Index({ service,services,collections }) {
  const [data, setData] = useState(services);
  const [name, setName] = useState(service.name);
  const [price, setPrice] = useState(service.price);
  const [discount, setDiscount] = useState(service.discount);
  const [compare_price, setComparePrice] = useState(service.compare_price);
  const [summary, setSummary] = useState(service.summary);
  const [idCollection, setIdCollection] = useState(service.id_collections);
  const [files, setFiles] = React.useState([]);
  const [edit, setEdit] = useState(true);

  function switchService(params, value) {
    if (params.row.status == 1) {
        var newStatus = 0;
    } else {
        var newStatus = 1;
    }
    axios
        .put("/services/" + params.id, {
            status: newStatus,
        })
        .then((res) => {
            if (res.data.check == false) {
                if (res.data.msg) {
                    notyf.open({
                        type: "error",
                        message: res.data.msg,
                    });
                }
            } else if (res.data.check == true) {
                notyf.open({
                    type: "success",
                    message: "Chuyển trạng thái thành công",
                });
                if (res.data.data) {
                    setData(res.data.data);
                } else {
                    setData([]);
                }
            }
        });
}
  const options = {
    filebrowserImageBrowseUrl: "/laravel-filemanager?type=Images",
    filebrowserImageUploadUrl:
      "/laravel-filemanager/upload?type=Images&_token=",
    filebrowserBrowseUrl: "/laravel-filemanager?type=Files",
    filebrowserUploadUrl: "/laravel-filemanager/upload?type=Files&_token=",
  };
  const resetCreate = () => {
    setName("");
    setPrice(0);
    setDiscount(0);
    setComparePrice(0);
    setSummary("");
    setFiles([]);
    setEdit(true);
  };
  
  window.CKEDITOR.replace("editor", options);
  const updateFiles = (incommingFiles) => {
    setFiles(incommingFiles);
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
        color: "black",
        duration: 2000,
        dismissible: true,
      },
      {
        type: "info",
        background: "#24b3f0",
        color: "black",
        duration: 1500,
        dismissible: false,
        icon: '<i class="bi bi-bag-check"></i>',
      },
    ],
  });
  const handleSubmit = (e) => {
    var content = CKEDITOR.instances["editor"].getData();
    if (name == "") {
      notyf.open({
        type: "error",
        message: "Tên dịch vụ không được bỏ trống",
      });
    } else if (price == 0) {
      notyf.open({
        type: "error",
        message: "Vui lòng nhập giá khuyến mãi dịch vụ",
      });
    } else if (compare_price == 0) {
      notyf.open({
        type: "error",
        message: "Vui lòng nhập giá dịch vụ",
      });
    } else if (summary == "") {
      notyf.open({
        type: "error",
        message: "Vui lòng tóm tắt dịch vụ",
      });
    } else if (content == "") {
      notyf.open({
        type: "error",
        message: "Vui lòng nhập content dịch vụ",
      });
    } else {
      var formData = new FormData();
      if (files.length > 0) {
        formData.append("image", files[0].file);
      }
      formData.append("name", name);
      formData.append("price", price);
      formData.append("compare_price", compare_price);
      formData.append("discount", discount);
      formData.append("id_collections", idCollection);
      formData.append("summary", summary);
      formData.append("content", content);
      axios
        .post("/update-services/"+service.id, formData, {
          headers: {
            "Content-Type": "multipart/form-data",
          },
        })
        .then((res) => {
          if (res.data.check == true) {
            notyf.open({
              type: "success",
              message: "Đã sửa thành công",
            });
            setTimeout(() => {
              window.location.replace('/services');
            }, 2000);
          }
        });
    }
  };
  const handleCellEditStop = (id, field, value) => {
    if(value!=''){
        axios
        .put(
          `/services/${id}`,
          { [field]: value },
        )
        .then((res) => {
          if (res.data.check == true) {
            notyf.open({
              type: "success",
              message: "Chỉnh sửa dịch vụ thành công",
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
   
  };
  const columns = [
    { field: 'id', headerName: 'ID', width: 70 },
    { field: 'name', headerName: 'Tên dịch vụ', width: 200,editable:true },
    { field: 'summary', headerName: 'Tóm tắt', width: 300,editable:true },
    {
      field: 'status',
      headerName: 'Status',
      width: 200,
      renderCell: (params) => (
        <Switch
          checked={params.value == 1}
          onChange={(e) => switchService(params, e.target.value)}
          inputProps={{ "aria-label": "controlled" }}
        />
      ),
    },
    {
        headerName: "Chi tiết",
        width: 70,
        renderCell: (params) => (
            <a href={'/services/'+params.id} className="btn btn-sm btn-warning">Edit</a>
        ),
    },
  ];
  return (
    <Layout>
      <>
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
 <a
                    className="btn btn-primary"
                    onClick={(e) => resetCreate()}
                    aria-current="page"
                    href="#"
                  >
                    Tạo mới
                  </a>
              <div className="d-flex">
              <a
                    className="btn btn-outline-success ms-3"
                    onClick={(e) => setEdit(false)}
                    aria-current="page"
                    href="#"
                  >
                    Đóng
                  </a>
              </div>
            </div>
          </div>
        </nav>

        <div className="row mt-3">
          <div className="container">
            {edit && (
              <div className="card text-start shadow-sm p-3 mb-5 bg-body rounded">
                <div className="card-body">
                  <div>
                    <div className="row">
                      <div className="col-md-6 mb-3">
                        <div className="input-group">
                          <span className="input-group-text">Tên dịch vụ</span>
                          <input
                            type="text"
                            className="form-control"
                            name="name"
                            value={name}
                            onChange={(e) => setName(e.target.value)}
                            required
                          />
                        </div>
                      </div>
                      <div className="col-md-6 mb-3">
                        <div className="input-group">
                          <span className="input-group-text">Tóm tắt</span>
                          <input
                            type="text"
                            className="form-control"
                            name="summary"
                            value={summary}
                            onChange={(e) => setSummary(e.target.value)}
                            required
                          />
                        </div>
                      </div>
                      <div className="col-md-4 mb-3">
                        <div className="input-group">
                          <span className="input-group-text">Nhóm dịch vụ</span>
                          <select name="" defaultValue={idCollection} onChange={(e)=>setIdCollection(e.target.value)} className="form-control" id="">
                            <option value={0} disabled>Chọn nhóm dịch vụ</option>
                            {collections.map((item,index)=>(
                              <option value={item.id}>{item.name}</option>
                            ))}
                          </select>
                        </div>
                      </div>
                    </div>
                    <div className="row">
                      <div className="col-md-4 mb-3">
                        <div className="input-group">
                          <span className="input-group-text">Giá</span>
                          <input
                            type="number"
                            value={price}
                            className="form-control"
                            onChange={(e) => setPrice(e.target.value)}
                          />
                        </div>
                      </div>
                      <div className="col-md-4 mb-3">
                        <div className="input-group">
                          <span className="input-group-text">Giá so sánh</span>
                          <input
                            type="number"
                            value={compare_price}
                            className="form-control"
                            onChange={(e) => setComparePrice(e.target.value)}
                            required
                          />
                        </div>
                      </div>
                      <div className="col-md-4 mb-3">
                        <div className="input-group">
                          <span className="input-group-text">Tỷ lệ</span>
                          <input
                            type="number"
                            className="form-control"
                            value={discount}
                            onChange={(e) => setDiscount(e.target.value)}
                            required
                          />
                        </div>
                      </div>
                    </div>
                    <div className="row">
                      <div className="col-md-8 mb-3">
                        <div className="input-group">
                          <span className="input-group-text">Content</span>
                          <textarea
                            className="form-control"
                            name="content"
                            value={service.content}
                            id="editor"
                            required
                          />
                        </div>
                      </div>
                      <div className="col-md mb-3">
                        <div className="input-group">
                          <span className="input-group-text">Hình ảnh</span>
                          <Dropzone
                            onChange={updateFiles}
                            className="form-control"
                            accept="image/*"
                            value={files}
                          >
                            {files && files.length>0 && files.map((file) => (
                              <FileMosaic {...file} preview />
                            ))}
                          </Dropzone>
                        </div>
                      </div>
                    </div>
                    <button
                      type="button"
                      onClick={(e) => handleSubmit()}
                      className="btn btn-warning"
                    >
                      Sửa
                    </button>
                  </div>
                </div>
              </div>
            )}
            {!edit && (
              <>
              <div className="row">
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
              </div>
              </>
            )}
          </div>
        </div>
      </>
    </Layout>
  );
}

export default Index;
