import React, { Component } from 'react';
import { BrowserRouter as Router,NavLink, Route} from 'react-router-dom';
import Pl from './phanloai';
import Sp from './sanpham';
import Tt from './ThongtinSP';
import Kh from './Khachhang';
import Ka from './Trangchu';
class trangchu extends Component{
    

    render(){
        
        return(
                <div>
                    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
                        <a class="navbar-brand" href="#">CÂY XANH</a>
                        <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
                       
                        <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                            <div class="input-group">
                                <input class="form-control" type="text" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="button"><i class="fas fa-search"></i></button>
                                </div>
                            </div>
                        </form>
                        <ul class="navbar-nav ml-auto ml-md-0">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#">Chào A</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="login.html">Logout</a>
                                </div>
                            </li>
                        </ul>
                    </nav>
                    <div id="layoutSidenav">
                    <Router>
                        <div id="layoutSidenav_nav">
                            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                                <div class="sb-sidenav-menu">
                                    <div class="nav">
                                        <div class="sb-sidenav-menu-heading">AdminPage</div>
                                        <a class="nav-link" href="Trangchu">
                                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                            Trang chủ
                                        </a>
                                        <div class="sb-sidenav-menu-heading">Quản lý</div>
                                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                            <div class="sb-nav-link-icon">
                                            <i class="fas fa-columns"></i></div> Danh mục 
                                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                        </a>
                                        <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                            <nav class="sb-sidenav-menu-nested nav">
                                                <NavLink to="/phanloai" className="nav-link">Phân loại</NavLink>
                                                <NavLink to="/sanpham" className="nav-link" >Sản phẩm</NavLink>
                                                <NavLink to="/ThongtinSP" className="nav-link" >Thông tin sản phẩm</NavLink>
                                            </nav>
                                        </div>
                                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                            <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                            Pages
                                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                        </a>
                                        <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
                                            <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                                    Authentication
                                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                                </a>
                                                <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                                    <nav class="sb-sidenav-menu-nested nav">
                                                        <a class="nav-link" href="login.html">Login</a>
                                                        <a class="nav-link" href="register.html">Register</a>
                                                        <a class="nav-link" href="password.html">Forgot Password</a>
                                                    </nav>
                                                </div>
                                            </nav>
                                        </div>
                                        <div class="sb-sidenav-menu-heading">Addons</div>
                                        
                                        <NavLink to="/Khachhang" className="nav-link">
                                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                            Đơn đặt hàng
                                        </NavLink>
                                    </div>
                                </div>
                            </nav>
                        </div>
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid" style={{backgroundImage:"url(hinh/bg1.jpg)",backgroundRepeat:"no-repeat",backgroundAttachment:"fixed",backgroundSize:"cover"}}>
                                    <Route exact path="/Trangchu"><Ka/></Route>
                                    <Route exact path="/phanloai"><Pl /></Route>
                                    <Route exact path="/sanpham"><Sp /></Route>
                                    <Route exact path="/ThongtinSP"><Tt /></Route>
                                    <Route exact path="/Khachhang"><Kh /></Route>
                                </div>
                            </main>
                            <footer class="py-4 bg-light mt-auto">
                                <div class="container-fluid">
                                    <div class="d-flex align-items-center justify-content-between small">
                                        <div class="text-muted">Nguyễn Thị Phương Thảo</div>
                                        <div class="text-muted">Trần Hồ Minh Mẫn</div>
                                    </div>
                                </div>
                            </footer>
                        </div>
                    </Router>
                    </div> 
                </div>
        );
    }
}
export default trangchu;