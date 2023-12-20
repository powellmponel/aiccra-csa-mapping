import { NavLink, useLocation } from "react-router-dom";
import React, { useReducer } from "react";



const Sidebar=()=>{
const userdata = JSON.parse(sessionStorage.getItem('token'));
const location = useLocation();

 const getNavLinkClass = path => {
    return location.pathname.startsWith(path)
    ? "active"
    : "";
     };
     const getNavLinkColapse = path => {
      return location.pathname.startsWith(path)
      ? " show"
      : "";
       };

return (
    <>
    <nav className="sidebar sidebar-offcanvas" id="sidebar">
        <div className="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
          <span className="text-color-success" ><h4>Pothole Portal</h4></span>
        </div>
      
      </nav></>




);

}
export default Sidebar;