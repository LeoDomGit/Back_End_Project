import React, { useState } from 'react';
import Layout from '../../components/Layout';
import axios from 'axios';
import 'notyf/notyf.min.css';
import { Notyf } from 'notyf';
import { DataGrid } from '@mui/x-data-grid';
import { Box, Select, MenuItem } from "@mui/material";
function Index({ dataSlides }) {
  const [slideName, setSlideName] = useState('');
  const [desktopFile, setDesktopFile] = useState(null);
  const [desktopPreview, setDesktopPreview] = useState(null);
  const [mobileFile, setMobileFile] = useState(null);
  const [mobilePreview, setMobilePreview] = useState(null);
  const [url, setUrl] = useState('');
  const [editMode, setEditMode] = useState(false);
  const [currentSlideId, setCurrentSlideId] = useState(null);
  const [data, setData] = useState(dataSlides);

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

  const handleDesktopChange = (e) => {
    const file = e.target.files[0];
    setDesktopFile(file);
    setDesktopPreview(URL.createObjectURL(file));
  };

  const handleMobileChange = (e) => {
    const file = e.target.files[0];
    setMobileFile(file);
    setMobilePreview(URL.createObjectURL(file));
  };

  const handleCellEditStop = (id, field, value) => {
    axios.put(`/slides/` + id, { [field]: value })
      .then((res) => {
        if (res.data.check) {
          notyf.open({ type: "success", message: "Data is updated successfully" });
          setData(res.data.data);
        } else {
          notyf.open({ type: "error", message: res.data.msg });
        }
      })
      .catch((error) => {
        console.error("Error updating product:", error);
        notyf.open({ type: "error", message: "An error occurred while updating the product." });
      });
  };

  const handleUpdate = async () => {
    const formData = new FormData();
    formData.append('name', slideName);
    if (desktopFile) {
      formData.append('desktop', desktopFile);
    }
    if (mobileFile) {
      formData.append('mobile', mobileFile);
    }
    formData.append('url', url);

    try {
      const response = await axios.post(`/edit-slide/${currentSlideId}`, formData, {
        headers: { 'Content-Type': 'multipart/form-data' }
      });
      if (response.data.check) {
        notyf.open({ type: "success", message: "Slide updated successfully" });
        setData(response.data.data);
        setTimeout(() => {
          window.location.reload();
        }, 2000);
        setEditMode(false);
      } else {
        notyf.open({ type: "error", message: response.data.msg });
      }
    } catch (error) {
      console.error('Error updating slide', error);
    }
  };

  const handleSubmit = async () => {
    const formData = new FormData();
    formData.append('name', slideName);
    formData.append('desktop', desktopFile);
    formData.append('mobile', mobileFile);
    formData.append('url', url);

    try {
      const response = await axios.post('/slides', formData, {
        headers: { 'Content-Type': 'multipart/form-data' }
      });
      if (response.data.check) {
        notyf.open({ type: "success", message: "Đã thêm thành công" });
        setData(response.data.data);
        setTimeout(() => {
          window.location.reload()
        }, 2000);
      } else {
        notyf.open({ type: "error", message: response.data.msg });
      }
    } catch (error) {
      console.error('Error adding slide', error);
    }
  };
  const formatCreatedAt = (dateString) => {
    const date = new Date(dateString);
    return date.toLocaleString();
};
  const handleDelete = async (id) => {
    try {
      const response = await axios.delete(`/slides/${id}`);
      if (response.data.check) {
        notyf.open({ type: "success", message: "Slide deleted successfully" });
        setData(response.data.data);
      } else {
        notyf.open({ type: "error", message: response.data.msg });
      }
    } catch (error) {
      console.error('Error deleting slide', error);
      notyf.open({ type: "error", message: "An error occurred while deleting the slide." });
    }
  };

  const handleEditClick = (id) => {
    axios.get(`/slides/${id}`)
      .then((res) => {
        const slide = res.data.slide;
        setSlideName(slide.name);
        setDesktopPreview(`/storage/slides/${slide.desktop}`);
        setMobilePreview(`/storage/slides/${slide.mobile}`);
        setUrl(slide.url);
        setCurrentSlideId(slide.id);
        setEditMode(true);
      })
      .catch((error) => {
        console.error("Error fetching slide:", error);
      });
  };
  const handleStatusChange = (id, newValue) => {
    axios.put(`/slides/` + id, { status: newValue })
      .then((res) => {
        if (res.data.check) {
          notyf.open({ type: "success", message: "Status updated successfully" });
          setData(res.data.data);
        } else {
          notyf.open({ type: "error", message: res.data.msg });
        }
      })
      .catch((error) => {
        console.error("Error updating status:", error);
        notyf.open({ type: "error", message: "An error occurred while updating the status." });
      });
  };
  const columns = [
    { field: "id", headerName: "#", width: 100 },
    { field: "name", headerName: "Name", width: 200, editable: true },
    { field: "slug", headerName: "Slug", width: 200, editable: false },
    {
      field: "status",
      headerName: "Status",
      width: 150,
      renderCell: (params) => (
        <Select
          value={params.row.status}
          className=''
          onChange={(e) => handleStatusChange(params.row.id, e.target.value)}
          style={{ width: '100%' }}
        >
          <MenuItem value={0}>Khóa</MenuItem>
          <MenuItem value={1}>Mở</MenuItem>
        </Select>
      ),
    },
    {
      field: "created_at",
      headerName: "Created at",
      width: 200,
      valueGetter: (params) => formatCreatedAt(params),

    },
    {
      field: "edit",
      headerName: "Edit",
      width: 150,
      renderCell: (params) => (
        <>
          <button className="btn btn-sm btn-warning" onClick={() => handleEditClick(params.row.id)}>Edit</button>
          <button className="btn btn-sm ms-3 btn-danger" onClick={() => handleDelete(params.row.id)}>Delete</button>
        </>
      ),
    },
  ];

  return (
    <Layout>
      <div className="row">
        <div className="card text-start">
          <div className="card-body">
            <div className="row">
              <div className="col-md-3">
                <div className="input-group mb-3">
                  <input
                    type="text"
                    className="form-control"
                    placeholder="Slide name"
                    value={slideName}
                    onChange={(e) => setSlideName(e.target.value)}
                  />
                   <button
                  className="btn btn-primary"
                  type="button"
                  onClick={editMode ? handleUpdate : handleSubmit}
                >
                  {editMode ? "Update" : "Add"}
                </button>

                </div>
                <label htmlFor="desktop">Desktop </label>
                <div className="input-group mb-2">
                  <input
                    type="file"
                    className="form-control"
                    onChange={handleDesktopChange}
                  />
                </div>
                {desktopPreview && (
                  <div className="mb-2">
                    <img src={desktopPreview} alt="Desktop Preview" style={{ width: '100%', maxHeight: '200px' }} />
                  </div>
                )}
                <label htmlFor="mobile">Mobile </label>
                <div className="input-group mb-2">
                  <input
                    type="file"
                    className="form-control"
                    onChange={handleMobileChange}
                  />
                </div>
                {mobilePreview && (
                  <div className="mb-2">
                    <img src={mobilePreview} alt="Mobile Preview" style={{ width: '100%', maxHeight: '200px' }} />
                  </div>
                )}
                <label htmlFor="url">URL liên kết </label>
                <div className="input-group mb-2">
                  <input
                    type="text"
                    className="form-control"
                    placeholder="URL Liên kết"
                    value={url}
                    onChange={(e) => setUrl(e.target.value)}
                  />
                </div>
              </div>
              <div className="col-md">
                {data && data.length > 0 && (
                  <Box sx={{ height: 400, width: '100%' }}>
                    <DataGrid
                      rows={data}
                      columns={columns}
                      initialState={{
                        pagination: {
                          paginationModel: { pageSize: 5 },
                        },
                      }}
                      pageSizeOptions={[5]}
                      checkboxSelection
                      disableRowSelectionOnClick
                      onCellEditStop={(params, e) => handleCellEditStop(params.row.id, params.field, e.target.value)}
                    />
                  </Box>
                )}
              </div>
            </div>
          </div>
        </div>
      </div>
    </Layout>
  );
}

export default Index;
