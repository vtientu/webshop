<%-- 
    Document   : register
    Created on : Oct 8, 2022, 7:07:31 PM
    Author     : Dell
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="format-detection" content="telephone=no">
    <title>Đồ điện dân dụng</title>
    <link rel="shortcut icon" type="image/png" href="userFE/images/logos/Logo-D.png"><!-- fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i"><!-- css -->
    <link rel="stylesheet" href="userFE/vendor/bootstrap-4.2.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="userFE/vendor/owl-carousel-2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="userFE/css/style.css"><!-- js -->
    <script src="userFE/vendor/jquery-3.3.1/jquery.min.js"></script>
    <script src="userFE/vendor/bootstrap-4.2.1/js/bootstrap.bundle.min.js"></script>
    <script src="userFE/vendor/owl-carousel-2.3.4/owl.carousel.min.js"></script>
    <script src="userFE/vendor/nouislider-12.1.0/nouislider.min.js"></script>
    <script src="userFE/js/number.js"></script>
    <script src="userFE/js/main.js"></script>
    <script src="userFE/vendor/svg4everybody-2.1.9/svg4everybody.min.js"></script>
    <script>svg4everybody();</script><!-- font - fontawesome -->
    <link rel="stylesheet" href="userFE/vendor/fontawesome-5.6.1/css/all.min.css"><!-- font - stroyka -->
    <link rel="stylesheet" href="userFE/fonts/stroyka/stroyka.css">
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-97489509-6"></script>
    <script>window.dataLayer = window.dataLayer || []; function gtag() { dataLayer.push(arguments); } gtag('js', new Date()); gtag('config', 'UA-97489509-6');</script>
</head>

<body>
    <header class="site__header d-lg-block d-none">
            <div class="site-header">
                <div class="site-header__nav-panel">
                    <div class="nav-panel">
                        <div class="nav-panel__container container-fluid">
                            <div class="nav-panel__row"style="margin-left: 10%">
                                <div class="nav-panel__logo"><a href="userHome"><img width="50px" height="50px" style="padding-bottom: 5px" src="userFE/images/logos/Logo-D.png"
                                                                                     alt="logo"></a></div>
                                <div class="nav-panel__nav-links nav-links">
                                    <ul class="nav-links__list">
                                        <li class="nav-links__item "><a href="userHome"><span>Trang Chủ<svg
                                                        class="nav-links__arrow" width="9px" height="6px">
                                                    </svg></span></a>
                                        </li>

                                        <li class="nav-links__item nav-links__item--with-submenu"><a
                                                href="userList?pid=1"><span>Rạng Đông<svg class="nav-links__arrow" width="9px"
                                                                                      height="6px">
                                                    </svg></span></a>
                                            <div class="nav-links__menu">
                                                <jsp:useBean id="pd" class="dal.ProductDAO"/>
                                                <ul class="menu menu--layout--classic">
                                                    <li>
                                                        <c:set var="listRD" value="${pd.getProductbyProducerID(1)}"/>

                                                        <c:forEach begin="0" end="2" var="i">
                                                        <li class="megamenu__item"><a href="product?id=${listRD.get(i).productID}">${listRD.get(i).productName}</a></li>
                                                        </c:forEach> 
                                                    </li>                                                              
                                                </ul>
                                            </div>
                                        </li>

                                        <li class="nav-links__item nav-links__item--with-submenu"><a
                                                href="userList?pid=2"><span>Trần Phú<svg class="nav-links__arrow" width="9px"
                                                                                     height="6px">
                                                    </svg></span></a>
                                            <div class="nav-links__menu">
                                                <ul class="menu menu--layout--classic">
                                                    <li>
                                                        <c:set var="listTD" value="${pd.getProductbyProducerID(2)}"/>
                                                        <c:forEach begin="0" end="2" var="i">
                                                        <li class="megamenu__item"><a href="product?id=${listTD.get(i).productID}">${listTD.get(i).productName}</a></li>
                                                        </c:forEach> 
                                                    </li>                                                              
                                                </ul>                                              
                                            </div>
                                        </li>

                                        <li class="nav-links__item nav-links__item--with-submenu"><a
                                                href="userList?pid=3"><span>Thống Nhất<svg class="nav-links__arrow" width="9px"
                                                                                       height="6px">
                                                    </svg></span></a>
                                            <div class="nav-links__menu">
                                                <ul class="menu menu--layout--classic">
                                                    <li>                                                       
                                                        <c:set var="listTN" value="${pd.getProductbyProducerID(3)}"/>
                                                        <c:forEach begin="0" end="2" var="i">
                                                        <li class="megamenu__item"><a href="product?id=${listTN.get(i).productID}">${listTN.get(i).productName}</a></li>
                                                        </c:forEach> 
                                                    </li>                                                              
                                                </ul>                                              
                                            </div>
                                        </li>

                                        <li class="nav-links__item nav-links__item--with-submenu"><a
                                                href="userList?pid=4"><span>Philips<svg class="nav-links__arrow" width="9px"
                                                                                    height="6px">
                                                    </svg></span></a>
                                            <div class="nav-links__menu">
                                                <ul class="menu menu--layout--classic">
                                                    <li>                                                       
                                                        <c:set var="listPL" value="${pd.getProductbyProducerID(4)}"/>
                                                        <c:forEach begin="0" end="2" var="i">
                                                        <li class="megamenu__item"><a href="product?id=${listPL.get(i).productID}">${listPL.get(i).productName}</a></li>
                                                        </c:forEach> 
                                                    </li>                                                              
                                                </ul>                                              
                                            </div>
                                        </li>

                                        <li class="nav-links__item nav-links__item--with-submenu"><a
                                                href="userList?pid=5"><span>Sino<svg class="nav-links__arrow" width="9px"
                                                                                 height="6px">
                                                    </svg></span></a>
                                            <div class="nav-links__menu">
                                                <ul class="menu menu--layout--classic">
                                                    <li>                                                       
                                                        <c:set var="listSN" value="${pd.getProductbyProducerID(5)}"/>
                                                        <c:forEach begin="0" end="2" var="i">
                                                        <li class="megamenu__item"><a href="product?id=${listSN.get(i).productID}">${listSN.get(i).productName}</a></li>
                                                        </c:forEach> 
                                                    </li>                                                              
                                                </ul>                                              
                                            </div>
                                        </li>

                                        <li class="nav-links__item nav-links__item--with-submenu"><a
                                                href="userList?pid=6"><span>Lioa<svg class="nav-links__arrow" width="9px"
                                                                                 height="6px">
                                                    </svg></span></a>
                                            <div class="nav-links__menu">
                                                <ul class="menu menu--layout--classic">
                                                    <li>                                                       
                                                        <c:set var="listLI" value="${pd.getProductbyProducerID(6)}"/>
                                                        <c:forEach begin="0" end="2" var="i">
                                                        <li class="megamenu__item"><a href="product?id=${listLI.get(i).productID}">${listLI.get(i).productName}</a></li>
                                                        </c:forEach> 
                                                    </li>                                                              
                                                </ul>                                              
                                            </div>
                                        </li>
                                        <li class="nav-links__item nav-links__item--with-submenu"><a href=""><span>Cửa
                                                    hàng<svg class="nav-links__arrow" width="9px" height="6px">                                                   
                                                    </svg></span></a>
                                            <div class="nav-links__menu">
                                                <ul class="menu menu--layout--classic">
                                                    <li><a href="userList">Danh sách<svg class="menu__arrow"
                                                                                         width="6px" height="9px">
                                                            </svg></a>
                                                        <div class="menu__submenu">
                                                            <li><a href="cart">Cart</a></li>
                                                            <li><a href="userProfile">My Account</a></li>
                                                </ul>
                                            </div>
                                        </li>     
                                    </ul>
                                </div><!-- .nav-links / end -->
                                <div class="nav-panel__indicators">
                                    <div class="indicator indicator--trigger--click"><button type="button"
                                                                                             class="indicator__button"><span class="indicator__area"><svg
                                                    class="indicator__icon" width="20px" height="20px">
                                                <use xlink:href="userFE/images/sprite.svg#search-20"></use>
                                                </svg> <svg class="indicator__icon indicator__icon--open" width="20px"
                                                            height="20px">
                                                <use xlink:href="userFE/images/sprite.svg#cross-20"></use>
                                                </svg></span></button>
                                        <div class="indicator__dropdown">
                                            <div class="drop-search">
                                                <form action="userList" method="get" class="drop-search__form"><input
                                                        class="drop-search__input" name="search"
                                                        placeholder="Search over 10,000 products"
                                                        aria-label="Site search" type="text" autocomplete="off"> <button
                                                        class="drop-search__button drop-search__button--submit"
                                                        type="submit"><svg width="20px" height="20px">
                                                        <use xlink:href="userFE/images/sprite.svg#search-20"></use>
                                                        </svg></button></form>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="indicator indicator--trigger--click"><a href="cart.html"
                                                                                        class="indicator__button"><span class="indicator__area"><svg width="20px"
                                                                                                     height="20px">
                                                <use xlink:href="userFE/images/sprite.svg#cart-20"></use>
                                                </svg> <span class="indicator__value">${cart.items.isEmpty() ? '0' : cart.items.size()}</span></span></a>
                                        <div class="indicator__dropdown">
                                            <!-- .dropcart -->
                                            <div class="dropcart">
                                                <div class="dropcart__products-list">
                                                    <c:forEach items="${cart.items}" var="i">
                                                        <div class="dropcart__product">
                                                            <div class="dropcart__product-image"><a href="product?id=${i.product.productID}"><img
                                                                        src="${i.product.image}" alt=""></a>
                                                            </div>
                                                            <div class="dropcart__product-info">
                                                                <div class="dropcart__product-name"><a
                                                                        href="product?id=${i.product.productID}">${i.product.productName}</a></div>
                                                                <ul class="dropcart__product-options">
                                                                    <li>Category: ${i.product.cate.categoryName}</li>
                                                                    <li>Producer: ${i.product.prod.producerName}</li>
                                                                </ul>
                                                                <div class="dropcart__product-meta"><span
                                                                        class="dropcart__product-price"> ${i.priceFormat} đ</span>
                                                                    x <span class="dropcart__product-quantity"> ${i.quantity}</span>  </div>
                                                            </div>
                                                            <a href="userRegister?action=delete&id=${i.product.productID}"><button type="button"
                                                                                                                               class="dropcart__product-remove btn btn-light btn-sm btn-svg-icon">
                                                                    <svg
                                                                        width="10px" height="10px">
                                                                    <use xlink:href="userFE/images/sprite.svg#cross-10"></use>
                                                                    </svg></button></a>
                                                        </div>
                                                    </c:forEach>

                                                </div>
                                                <div class="dropcart__totals">
                                                    <table>
                                                        <tr>
                                                            <th>Subtotal</th>
                                                            <td>${cart.totalMoneyFormat} VND</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Shipping</th>
                                                            <td>0 đ</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Tax</th>
                                                            <td>0 đ</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Total</th>
                                                            <td>${cart.totalMoneyFormat} VND</td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div class="dropcart__buttons"><a class="btn btn-secondary"
                                                                                  href="cart">View Cart</a> <a class="btn btn-primary"
                                                                                  href="checkout">Checkout</a></div>
                                            </div><!-- .dropcart / end -->
                                        </div>
                                        
                                    </div>
                                    <jsp:useBean class="dal.ProductDAO" id="pao"/>            
                                    <div class="nav-panel__nav-links nav-links">
                                        <ul class="nav-links__list">
                                            <li class="nav-links__item nav-links__item--with-submenu"><a href="#">
                                                    <span>
                                                        <c:if test="${account == null}">
                                                            <i class="fas fa-user" style="font-size: 25px; padding-left: 15px"></i>
                                                        </c:if>

                                                        <c:if test="${account != null}">
                                                            <img src="${account.pro.avatar}" class="rounded-circle" width="40px" height="40px" alt=""/>
                                                        </c:if>
                                                    </span></a>
                                                <div class="nav-links__menu nav-links__usermenu">

                                                    <ul class="menu menu--layout--classic">
                                                        <c:if test="${account == null}">
                                                            <li><a href="userLogin">Đăng nhập</a></li>
                                                            <li><a href="userRegister">Đăng ký</a></li>
                                                            </c:if>
                                                            <c:if test="${account != null}">
                                                            <li><a href="userProfile">Profile</a></li>
                                                            <li><a href="changePass">Change Password</a></li>
                                                            <li><a href="checkout">Checkout</a></li>
                                                            <li><a href="userLogout">Logout</a></li>
                                                            <li><a>Total: ${pao.getPriceFormat(pao.totalPay)} VND</a></li>
                                                            </c:if>
                                                    </ul>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    <!-- quickview-modal -->
    <div id="quickview-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-xl">
            <div class="modal-content"></div>
        </div>
    </div>
    <div class="site__body">
        <div class="page-header">
            <div class="page-header__container container">
                <div class="page-header__title d-flex justify-content-center">
                    <h1>My Account</h1>
                </div>
            </div>
        </div>
        <div class="block">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-6 d-flex mt-4 mt-md-0">
                        <div class="card flex-grow-1 mb-0">
                            <div class="card-body">
                                <h3 class="card-title">Register</h3>
                                <form action="userRegister" method="post">
                                    <div class="form-group"><label>User name</label> <input type="text" name="userName"
                                            class="form-control" placeholder="User name"></div>
                                    <div class="form-group"><label>Email address</label> <input type="email" name="email"
                                            class="form-control" placeholder="Enter email"></div>
                                    <div class="form-group"><label>Password</label> <input type="password" name="password"
                                            class="form-control" placeholder="Password"></div>
                                    <div class="form-group"><label>Re-Password</label> <input type="password" name ="re-password"
                                            class="form-control" placeholder="Password"></div><button type="submit"
                                        class="btn btn-primary mt-4">Register</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="site__footer">
        <div class="site-footer">
            <div class="container">
                <div class="site-footer__widgets">
                    <div class="row">
                        <div class="col-12 col-md-6 col-lg-4">
                            <div class="site-footer__widget footer-contacts">
                                <h5 class="footer-contacts__title">Liên Hệ</h5>
                                <div class="footer-contacts__text">Hài lòng của khách hàng là trách nhiệm của chúng
                                    tôi !</div>
                                <ul class="footer-contacts__contacts">
                                    <li><i class="footer-contacts__icon fas fa-globe-americas"></i>Đông Anh Hà Nội
                                    </li>
                                    <li><i class="footer-contacts__icon far fa-envelope"></i> duc96989@gmail.com
                                    </li>
                                    <li><i class="footer-contacts__icon fas fa-mobile-alt"></i> (+84) 97-230-7529
                                    </li>
                                    <li><i class="footer-contacts__icon far fa-clock"></i> Thứ 2 - Thứ 7 08:00am -
                                        6:30pm
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-6 col-md-3 col-lg-2">
                            <div class="site-footer__widget footer-links">
                                <h5 class="footer-links__title">Thông Tin</h5>
                                <ul class="footer-links__list">
                                    <li class="footer-links__item"><a href="#" class="footer-links__link">About
                                            Us</a></li>
                                    <li class="footer-links__item"><a href="#" class="footer-links__link">Delivery
                                            Information</a></li>
                                    <li class="footer-links__item"><a href="#" class="footer-links__link">Privacy
                                            Policy</a></li>
                                    <li class="footer-links__item"><a href="#" class="footer-links__link">Brands</a>
                                    </li>
                                    <li class="footer-links__item"><a href="#" class="footer-links__link">Contact
                                            Us</a></li>
                                    <li class="footer-links__item"><a href="#" class="footer-links__link">Returns</a>
                                    </li>
                                    <li class="footer-links__item"><a href="#" class="footer-links__link">Site
                                            Map</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-6 col-md-3 col-lg-2">
                            <div class="site-footer__widget footer-links">
                                <h5 class="footer-links__title">Tài Khoản</h5>
                                <ul class="footer-links__list">
                                    <li class="footer-links__item"><a href="#" class="footer-links__link">Store
                                            Location</a></li>
                                    <li class="footer-links__item"><a href="#" class="footer-links__link">Order
                                            History</a></li>
                                    <li class="footer-links__item"><a href="#" class="footer-links__link">Wish
                                            List</a></li>
                                    <li class="footer-links__item"><a href="#" class="footer-links__link">Newsletter</a>
                                    </li>
                                    <li class="footer-links__item"><a href="#" class="footer-links__link">Specials</a>
                                    </li>
                                    <li class="footer-links__item"><a href="#" class="footer-links__link">Gift
                                            Certificates</a></li>
                                    <li class="footer-links__item"><a href="#" class="footer-links__link">Affiliate</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-12 col-md-12 col-lg-4">
                            <div class="site-footer__widget footer-newsletter">
                                <h5 class="footer-newsletter__title">Thư Phản Hồi</h5>
                                <div class="footer-newsletter__text">Có vấn đề nào cần giải đáp xin vui lòng để lại
                                    email bên dưới</div>
                                <form action="#" class="footer-newsletter__form"><label class="sr-only"
                                                                                        for="footer-newsletter-address">Địa chỉ email</label> <input type="text"
                                                                                        class="footer-newsletter__form-input form-control"
                                                                                        id="footer-newsletter-address" placeholder="Địa chỉ email..."> <button
                                                                                        class="footer-newsletter__form-button btn btn-primary">Subscribe</button>
                                </form>
                                <div class="footer-newsletter__text footer-newsletter__text--social">Theo dõi tôi
                                    trên các mạng xã hội</div>
                                <ul class="footer-newsletter__social-links">
                                    <li class="footer-newsletter__social-link footer-newsletter__social-link--facebook">
                                        <a href="https://www.facebook.com/dustinn.07 " target="_blank"><i
                                                class="fab fa-facebook-f"></i></a>
                                    </li>
                                    <li
                                        class="footer-newsletter__social-link footer-newsletter__social-link--instagram">
                                        <a href="https://www.instagram.com/nmd.0712/" target="_blank"><i
                                                class="fab fa-instagram"></i></a>
                                    </li>
                                    <li class="footer-newsletter__social-link footer-newsletter__social-link--rss">
                                        <a href="https://fpt.edu.vn/" target="_blank"><i class="fas fa-rss"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>
