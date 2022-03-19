import React from 'react';
import { BrowserRouter as Router,NavLink, Route, Link} from 'react-router-dom';
import './style.css';

import Cc from './Caycanh';
import Chau from './Chaucanh';
import Ha from './Intro';
import Tg from './Chitiet';
import La from './Lienhe'
import Phu from './Phukien';
import { CartProvider } from './Cart';
import {CartContext} from './Cart';
import Tc from './Trangchu';

function index(){

        return(
                <div>
                <CartProvider>
                    <Router>
                    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
                        <a class="navbar-brand" href="Trangchu">CÂY XANH</a>
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
                         <ul class="navbar-nav ml-md-0">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-shopping-basket"></i>
                                    <CartContext.Consumer>
                                        {({ cartItems }) => ( <Link to="/Caycanh" class="badge">{cartItems.length}</Link> )}
                                    </CartContext.Consumer>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                                    <div class="shopping-cart">
                                        <div class="shopping-cart-header">
                                          <i class="fa fa-shopping-cart cart-icon"></i>
                                          <CartContext.Consumer>{({ cartItems }) => ( <Link to="/Caycanh"> {cartItems.length}</Link> )}</CartContext.Consumer>
                                          <div class="shopping-cart-total">
                                            <span class="lighter-text">Total: </span>
                                            <span class="main-color-text">215.000 đ</span>
                                          </div>
                                        </div>
                                        <ul class="shopping-cart-items">
                                          <li class="clearfix">
                                            <img src="hinh/DB1.jpg" width="70px" alt="item1" />
                                            <span class="item-name">CÂY TRẦU BÀ</span>
                                            <span class="item-price">150.000</span>
                                            <span class="item-quantity">Quantity: 01</span>
                                          </li>
                                        </ul>
                                        <ul class="shopping-cart-items">
                                          <li class="clearfix">
                                            <img src="hinh/DB22.jpg" width="70px" alt="item1" />
                                            <span class="item-name">Chậu thủy tinh  </span>
                                            <span class="item-price">65.000</span>
                                            <span class="item-quantity">Quantity: 02</span>
                                          </li>
                                        </ul>
                                        <a href="#" class="button">Checkout</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </nav>
                    <div id="layoutSidenav">
                        <div id="layoutSidenav_nav">
                            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                                <div class="sb-sidenav-menu">
                                    <div class="nav">
                                        <div class="sb-sidenav-menu-heading">CLIENTPAGE</div>
                                        <a class="nav-link" href="Trangchu">
                                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                            Trang chủ
                                        </a>
                                        <div class="sb-sidenav-menu-heading">Sản phẩm</div>
                                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                            <div class="sb-nav-link-icon">
                                            <i class="fas fa-columns"></i></div> Sản phẩm 
                                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                        </a>
                                        <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                            <nav class="sb-sidenav-menu-nested nav">
                                                <NavLink to="/Caycanh" className="nav-link">Cây cảnh</NavLink>
                                                <NavLink to="/Chaucanh" className="nav-link" >Chậu</NavLink>
                                                <NavLink  to ="/Phukien" className="nav-link" >Phụ kiện cây cảnh</NavLink>
                                            </nav>
                                        </div>
                                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayout" aria-expanded="false" aria-controls="collapseLayout">
                                            <div class="sb-nav-link-icon">
                                            <i class="fas fa-columns"></i></div> Thông tin 
                                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                        </a>
                                        <div class="collapse" id="collapseLayout" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                            <nav class="sb-sidenav-menu-nested nav">
                                                <NavLink to="/Intro" className="nav-link">Giới thiệu</NavLink>
                                                <NavLink to="/Lienhe" className="nav-link" >Liên hệ</NavLink>
                                                <NavLink  to ="/Chitiet" className="nav-link" >Chi tiết</NavLink>
                                            </nav>
                                        </div>
                                        
                                    </div>
                                </div>
                            </nav>
                        </div>
                        <div id="layoutSidenav_content" >
                            <main>
                                <div class="container-fluid" style={{backgroundImage:"url(hinh/bg1.jpg)",backgroundRepeat:"no-repeat",backgroundAttachment:"fixed",backgroundSize:"cover"}}>
                                    <Route exact path="/Trangchu"><Tc /></Route>
                                    <Route exact path="/Caycanh"><Cc /></Route>
                                    <Route exact path="/Chaucanh"><Chau/></Route>
                                    <Route exact path="/Phukien"><Phu/></Route>
                                    <Route exact path="/Intro"><Ha/></Route>
                                    <Route exact path="/Lienhe"><La/></Route>
                                    <Route exact path="/Chitiet"><Tg/></Route>
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
                    
                    </div> 
            </Router>
                    </CartProvider>    </div>
        );
    }

export default index;