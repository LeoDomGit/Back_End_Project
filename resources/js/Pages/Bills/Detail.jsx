import React, { useState } from 'react'
import Layout from '../../components/Layout'
import Radio from '@mui/material/Radio';
import RadioGroup from '@mui/material/RadioGroup';
import FormControlLabel from '@mui/material/FormControlLabel';
import FormControl from '@mui/material/FormControl';
import FormLabel from '@mui/material/FormLabel';
import axios from "axios";
import { Notyf } from "notyf";
function Detail({ total, bill, billList }) {
    const options = {
        filebrowserImageBrowseUrl: "/laravel-filemanager?type=Images",
        filebrowserImageUploadUrl:
            "/laravel-filemanager/upload?type=Images&_token=",
        filebrowserBrowseUrl: "/laravel-filemanager?type=Files",
        filebrowserUploadUrl: "/laravel-filemanager/upload?type=Files&_token=",
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
    window.CKEDITOR.replace("note", options);
    const [note, setNote] = useState('');
    const [status, setStatus] = useState(bill.status);
    const updateBill=()=>{
        var datanote = CKEDITOR.instances['note'].getData();
        if(status==2 &&datanote==''){
            notyf.open({
                type: "error",
                message: "Vui lòng cập nhật lý do thất bại",
            });
        }else {
            axios.put('/bills/'+bill.id,{
                status:status,
                note:datanote
            }).then((res)=>{
                if(res.data.check==true){
                    notyf.open({
                        type: "success",
                        message: "Cập nhật thành công",
                    });
                    setTimeout(() => {
                        window.location.reload();
                    }, 2000);
                }else if(res.data.check==false){
                    if(res.data.msg){
                        notyf.open({
                            type: "error",
                            message: res.data.msg,
                        });
                    }
                }
            })
        }
    }
    return (
        <Layout>
            <>
                .<div class="card">
                    <div class="card-header">
                        <div className="row">
                            <div className="col">
                            <h4>Hóa đơn chi tiết</h4>
                            </div>
                            <div className="col text-end">
                                <button className='btn btn-primary' onClick={(e)=>updateBill()}>Cập nhật</button>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div className="row">
                            <div className="col-md-9">
                                <h5>Tên khách hàng : {bill.name}</h5>
                                <h5>Số điện thoại : {bill.phone}</h5>
                                <h5>Địa chỉ đặt hàng : {bill.address}</h5>
                                {bill.note && (
                                    <>
                                        <h5>Ghi chú :</h5>
                                        <div
      dangerouslySetInnerHTML={{__html: bill.note}}
    />
                                    </>
                                )}

                                <hr />
                                <div className="row">
                                    <h4>Chi tiết hóa đơn</h4>
                                    <div
                                        class="table-responsive"
                                    >
                                        <table
                                            class="table table-striped"
                                        >
                                            <thead>
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">Tên sản phẩm</th>
                                                    <th scope="col">Đơn giá</th>
                                                    <th scope="col">Số lượng</th>
                                                    <th scope="col">Thành tiền</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                {billList.map((item, index) => (
                                                    <tr key={index}>
                                                        <td>{index+1}</td>
                                                        <td>{item.product.name}</td>
                                                        <td>{Intl.NumberFormat("en-US").format(item.product.price)}</td>
                                                        <td>{item.quantity}</td>
                                                        <td>{Intl.NumberFormat("en-US").format(item.product.price * item.quantity)}</td>
                                                    </tr>
                                                ))}
                                                <tr>
                                                    <td colSpan={4}>Thành tiền</td>
                                                    <td>{Intl.NumberFormat("en-US").format(total)}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>
                            <div className="col-md">
                                <FormControl>
                                    <FormLabel id="demo-radio-buttons-group-label">Trạng thái</FormLabel>
                                    <RadioGroup
                                        aria-labelledby="demo-radio-buttons-group-label"
                                        defaultValue="female"
                                        name="radio-buttons-group"
                                        value={status}
                                        onChange={(e)=>setStatus(e.target.value)}
                                    >
                                        <FormControlLabel value={0} control={<Radio />} label="Tạo mới" />
                                        <FormControlLabel value={1} control={<Radio />} label="Thành công" />
                                        <FormControlLabel value={2} control={<Radio />} label="Thất bại" />
                                    </RadioGroup>
                                </FormControl><br />
                                <FormLabel id="note-group-label">Ghi chú</FormLabel>
                                
                                <textarea name="" id="note"></textarea>
                            </div>
                        </div>
                    </div>
                </div>

            </>

        </Layout>

    )
}

export default Detail