import Sidebar from './sidebar';
import Footer from './footer';
import React from "react";
const Layout =({children})=>{

return(

    <div className='container-scroller'>
    <Sidebar></Sidebar>
    <div className="container-fluid page-body-wrapper">
    <div className="main-panel">
    {children}
    <Footer></Footer>
    </div>
    </div>
</div>




);




}
export default Layout;