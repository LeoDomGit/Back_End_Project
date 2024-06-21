/* eslint-disable */
import React from 'react'
import { Sidebar, Menu, MenuItem, useProSidebar } from "react-pro-sidebar";
import HomeOutlinedIcon from "@mui/icons-material/HomeOutlined";
import PeopleOutlinedIcon from "@mui/icons-material/PeopleOutlined";
import ContactsOutlinedIcon from "@mui/icons-material/ContactsOutlined";
import ReceiptOutlinedIcon from "@mui/icons-material/ReceiptOutlined";
import CalendarTodayOutlinedIcon from "@mui/icons-material/CalendarTodayOutlined";
import HelpOutlineOutlinedIcon from "@mui/icons-material/HelpOutlineOutlined";
import MenuOutlinedIcon from "@mui/icons-material/MenuOutlined";
import "../../css/app.css";
function Layout({ children }) {
  const { collapseSidebar } = useProSidebar();
  return (
    <>
      <div className='row w-100'>
      </div>
      <div style={({ height: "90vh" }, { display: "flex" })}>
        <Sidebar style={{ minHeight: "90vh" }}>
          <Menu>
            <MenuItem
              icon={<MenuOutlinedIcon />}
              onClick={() => {
                collapseSidebar();
              }}
              style={{ textAlign: "center" }}
            >
              {" "}
              <h2>Admin</h2>
            </MenuItem>

           <a href={'/roles'}> <MenuItem icon={<HomeOutlinedIcon />}>Loại tài khoản</MenuItem></a>
           <a href={'/categories'}> <MenuItem icon={<HomeOutlinedIcon />}>Loại sản phẩm</MenuItem></a>
            <MenuItem icon={<ContactsOutlinedIcon />}>Contacts</MenuItem>
            <MenuItem icon={<ReceiptOutlinedIcon />}>Profile</MenuItem>
            <MenuItem icon={<HelpOutlineOutlinedIcon />}>FAQ</MenuItem>
            <MenuItem icon={<CalendarTodayOutlinedIcon />}>Calendar</MenuItem>
          </Menu>
        </Sidebar>
        <main className='p-4 w-100'>
          {children}
        </main>
      </div>

    </>
  )
}

export default Layout