import React, { useEffect, useState } from 'react'
import Layout from '../../components/Layout'
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import { Notyf } from 'notyf';
import 'notyf/notyf.min.css';
import axios from 'axios';
function Index({roles}) {
  const [role, setRole] = useState('');
  const [show, setShow] = useState(false);
  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);
  const api = 'http://localhost:8000/api/';
  const app='http://localhost:8000/';
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
  const submitRole=()=>{
    axios.post('/roles',{
      role:role
    }).then((res)=>{
      if(res.data.check==true){
        notyf.open({
          type: "success",
          message: "Đã thêm thành công",
        });
        setRoles(res.data.data);
      }
    })
  }
  const resetCreate= ()=>{
    setRole('');
    setShow(true)
  }
  useEffect(()=>{
    console.log(roles);
  },[])
  return (
    
    <Layout>
      <>
      <Modal show={show} onHide={handleClose}>
        <Modal.Header closeButton>
          <Modal.Title>Tạo loại tài khoản</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <input type="text" className='form-control' onChange={(e)=>setRole(e.target.value)} />
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={handleClose}>
            Đóng
          </Button>
          <Button variant="primary" disabled={role==''?true: false}  onClick={(e)=>submitRole()}>
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
                  <a className="btn btn-primary" onClick={(e)=>resetCreate()} aria-current="page" href="#">
                    Tạo mới
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
        <div className="row">
          <div className="col-md">

          </div>
        </div>
      </>
    </Layout>

  )
}

export default Index