import JoditEditor from 'jodit-react';
import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import Layout from '../../components/Layout';
import axios from 'axios';
import { Notyf } from 'notyf';
import { Dropzone, FileMosaic } from "@dropzone-ui/react";
import Modal from 'react-bootstrap/Modal';
import 'notyf/notyf.min.css';
import CKEditor from "../../components/CKEditor";

function Edit({dataId,dataBrand,dataCate,dataproduct,datagallery,dataimage}) {
    const [id,setId]= useState(dataId)
    const [show, setShow] = useState(false);
    const [categories, setCategories] = useState(dataCate);
    const [brands, setBrands] = useState(dataBrand);
    const [gallery, setGallery] = useState(datagallery);
    const [image,setImage]= useState(dataimage);
    const [product, setProduct] = useState(dataproduct);
    const [files, setFiles] = React.useState([]);
    const REACT_APP_API_IMG_URL= ''
    const updateFiles = (incommingFiles) => {

        setFiles(incommingFiles);
    };

    const config = {
        height: '400px',

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
    const handleRemoveImage = (index) => {
       const path=gallery[index].split('/');
       const imageName = path[3]; 
       const check = window.confirm('Delete this image');
       if(check){
            axios.delete('/products/drop-image/'+id+'/'+imageName,{
                headers: {
                    Authorization: `Bearer ${localStorage.getItem("token")}`,
                    Accept: "application/json",
                },
            }).then((res)=>{
                if(res.data.check==true){
                    setGallery(res.data.gallery)
                    notyf.open({
                        type: "success",
                        message: "Drop image successfully",
                    });
                }
            })
       }
    };
    const uploadImage= ()=>{
        var formData = new FormData();
        files.forEach(file => {
            formData.append('files[]', file.file);
        });
        axios.post('/products/upload-images/' + id, formData,{
            headers: {
                Authorization: `Bearer ${localStorage.getItem("token")}`,
                Accept: "application/json",
            },
        })
        .then((res) => {
            if(res.data.check==true){
                notyf.open({
                    type: "success",
                    message: "Upload image successfully",
                });
                setGallery(res.data.result);
                window.location.reload();
            }else if(res.data.check==false){
                if(res.data.msg){
                    notyf.open({
                        type: "error",
                        message: res.data.msg,
                    });
                
                }
            }
        })
        .catch((error) => {

        });
    }
    const handleSetProductImage = (index)=>{
        const path=gallery[index].split('/');
        const imageName = path[3]; 
        axios.post('/products/set-image/' + id + '/' + imageName, {}, {
            headers: {
              Authorization: `Bearer ${localStorage.getItem("token")}`,
              Accept: "application/json",
            },
          }).then((res) => {
            if (res.data.check === true) {
              setImage(res.data.result);
              notyf.open({
                type: "success",
                message: "Set image successfully",
              });
            }
          }).catch((error) => {
            console.error("Error setting image:", error);
            notyf.open({
              type: "error",
              message: "Failed to drop image",
            });
          });
    }
    const handleInputChange = (e) => {
        const { name, value } = e.target;
        setProduct({ [name]: value });
        
    };

    const handleSubmit = () => {
        axios.put(`/products/${id}`, product,{
            headers: {
                Authorization: `Bearer ${localStorage.getItem("token")}`,
                Accept: "application/json",
            },
        }).then((res)=>{
            if(res.data.check==true){
                window.location.replace('/products');
            }else if(res.data.check==false){
                if(res.data.msg){
                    notyf.open({
                        type: "error",
                        message: res.data.msg,
                    });
                }
            }
        })
    };

    return (
        <Layout>

            <Modal show={show} fullscreen={true} onHide={() => setShow(false)}>
                <Modal.Header closeButton>
                    <Modal.Title>Gallery</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <div className="row">
                        <div className="col-md" style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(100px, 1fr))', gap: '10px' }}>
                            {gallery.map((item, index) => (
                                <div key={index} style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', marginTop: '10px' }}>
                                    <img src={REACT_APP_API_IMG_URL + item} alt={`Preview ${index}`} style={{ width: '100px', height: '100px', marginBottom: '5px' }} />
                                    <button className="btn btn-danger btn-sm w-100" onClick={() => handleRemoveImage(index)}>Remove</button>
                                    <button className="btn btn-success btn-sm w-100 mt-2" onClick={() => handleSetProductImage(index)}>Set default</button>
                                </div>
                            ))}
                        </div>

                    </div>

                </Modal.Body>
            </Modal>
            {/* ===================================================== */}
            <div className="row">
                <div className="col-md-9">
                    <div className="row">
                        <div className="col-md-3">
                            <label>Name:</label>
                            <input type="text" className="form-control" name="name" value={product.name} onChange={handleInputChange} />
                        </div>
                        <div className="col-md-3">
                            <label>Price:</label>
                            <input type="number" className="form-control" name="price" value={product.price} onChange={handleInputChange} />
                        </div>
                        <div className="col-md-3">
                            <label>Discount:</label>
                            <input type="number" className="form-control" name="discount" value={product.discount} onChange={handleInputChange} />
                        </div>
                    </div>
                    <div className="row mt-2">
                        <div className="col-md-3">
                            <label>Category:</label>
                            <select name="categoryId" className="form-control" value={product.idCate} onChange={handleInputChange}>
                                <option value="0" disabled>Choose a category</option>
                                {categories.map((category) => (
                                    <option key={category.id} value={category.id}>{category.name}</option>
                                ))}
                            </select>
                        </div>
                        <div className="col-md-3">
                            <label>Brands:</label>
                            <select name="brandId" className="form-control" value={product.idBrand} onChange={handleInputChange}>
                                <option value="0" disabled>Choose a Brand</option>
                                {brands.map((brand) => (
                                    <option key={brand.id} value={brand.id}>{brand.name}</option>
                                ))}
                            </select>
                        </div>
                        <div className="col-md-3">
                            <br />
                            <button className='btn btn-sm btn-warning' onClick={(e) => setShow(true)}>Show images</button>
                        </div>
                    </div>
                    <div className="row mb-2 mt-2">
                        <div className="col-md-7">
                            <Dropzone onChange={updateFiles} accept="image/*" value={files}>
                                {files.map((file) => (
                                    <FileMosaic {...file} preview />
                                ))}
                            </Dropzone>
                                <button onClick={(e)=>uploadImage()} className='btn btn-sm btn-primary'>Upload</button>
                        </div>
                        <div className="col-md">
                                <img style={{height:'200px',width:'auto'}} src={REACT_APP_API_IMG_URL+image} className='img-fluid' alt="" />
                        </div>
                    </div>
                    <div className="row mt-3">
                    <CKEditor
                                        value={product.content}
                                        onBlur={(newContent) => setProduct({ ...product, content: newContent })}
                                    />
                    </div>
                    <div className="row mt-3">
                        <div className="col-md-3">
                            <button className="btn btn-primary" onClick={handleSubmit}>Save Changes</button>
                        </div>
                    </div>
                </div>
            </div>
        </Layout>
    );
}

export default Edit;