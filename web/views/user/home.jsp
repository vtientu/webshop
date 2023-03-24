<%-- 
    Document   : home
    Created on : Sep 28, 2022, 5:18:21 PM
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
        <!--logo thanh tiêu đề-->
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
        <script>window.dataLayer = window.dataLayer || [];
            function gtag() {
                dataLayer.push(arguments);
            }
            gtag('js', new Date());
            gtag('config', 'UA-97489509-6');</script>
    </head>

    <body>
        <!-- quickview-modal -->
        <div id="quickview-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-xl">
                <div class="modal-content"></div>
            </div>
        </div>
        <!-- desktop site__header -->

        <header class="site__header d-lg-block d-none">
            <div class="site-header">
                <div class="site-header__nav-panel">
                    <div class="nav-panel">
                        <div class="nav-panel__container container-fluid">
                            <div class="nav-panel__row" style="margin-left: 10%">
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
                                    <div class="indicator indicator--trigger--click">
                                        <button type="button" class="indicator__button">
                                            <span class="indicator__area">
                                                <svg class="indicator__icon" width="20px" height="20px">
                                                <use xlink:href="userFE/images/sprite.svg#search-20"></use>
                                                </svg> 
                                                <svg class="indicator__icon indicator__icon--open" width="20px" height="20px">
                                                <use xlink:href="userFE/images/sprite.svg#cross-20"></use>
                                                </svg>
                                            </span>
                                        </button>
                                        <div class="indicator__dropdown">
                                            <div class="drop-search">
                                                <form action="userList" method="get" class="drop-search__form">
                                                    <input class="drop-search__input" name="search"
                                                           placeholder="Search over 10,000 products"
                                                           aria-label="Site search" type="text" autocomplete="off">
                                                    <button class="drop-search__button drop-search__button--submit" type="submit">
                                                        <svg width="20px" height="20px">
                                                        <use xlink:href="userFE/images/sprite.svg#search-20"></use>
                                                        </svg>
                                                    </button>
                                                </form>
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
                                                            <a href="userHome?action=delete&id=${i.product.productID}"><button type="button"
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
        <div class="site__body">
            <div class="block-slideshow block-slideshow--layout--full block">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="block-slideshow__body">
                                <div class="owl-carousel"><a class="block-slideshow__slide" href="userList">
                                        <div class="block-slideshow__slide-image block-slideshow__slide-image--desktop"
                                             style="background-image: url('userFE/images/slides/anh1.jpg'); background-repeat: none; background-size: 100%;"></div>
                                        <div class="block-slideshow__slide-image block-slideshow__slide-image--mobile"
                                             style="background-image: url('userFE/images/slides/slide-1-mobile.jpg')"></div>
                                        <div class="block-slideshow__slide-content">
                                            <div class="block-slideshow__slide-button"><span
                                                    class="btn btn-primary btn-lg" >Mua ngay</span></div>
                                        </div>

                                    </a><a class="block-slideshow__slide" href="userList">
                                        <div class="block-slideshow__slide-image block-slideshow__slide-image--desktop"
                                             style="background-image: url('userFE/images/slides/slide-3-full.jpg')"></div>
                                        <div class="block-slideshow__slide-image block-slideshow__slide-image--mobile"
                                             style="background-image: url('userFE/images/slides/slide-3-mobile.jpg')"></div>
                                        <div class="block-slideshow__slide-content">
                                            <div class="block-slideshow__slide-title">Một lần nữa<br>Nhấn mạnh rằng
                                            </div>
                                            <div class="block-slideshow__slide-text">Khách hàng rất quan trọng,
                                                khách hàng sẽ được tư vấn<br>nhiệt tình, chi tiết và đảm bảo chất lượng.
                                            </div>
                                            <div class="block-slideshow__slide-button"><span
                                                    class="btn btn-primary btn-lg">Mua ngay</span></div>
                                        </div>
                                    </a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="block block-features block-features--layout--boxed">
                <div class="container">
                    <div class="block-features__list">
                        <div class="block-features__item">
                            <div class="block-features__icon"><svg width="48px" height="48px">
                                <use xlink:href="userFE/images/sprite.svg#fi-free-delivery-48"></use>
                                </svg></div>
                            <div class="block-features__content">
                                <div class="block-features__title">Miễn phí vận chuyển</div>
                                <div class="block-features__subtitle">Cho đơn hàng từ 500.000 VNĐ</div>
                            </div>
                        </div>
                        <div class="block-features__divider"></div>
                        <div class="block-features__item">
                            <div class="block-features__icon"><svg width="48px" height="48px">
                                <use xlink:href="userFE/images/sprite.svg#fi-24-hours-48"></use>
                                </svg></div>
                            <div class="block-features__content">
                                <div class="block-features__title">Hỗ trợ 24/7</div>
                                <div class="block-features__subtitle">Gọi chúng tôi bất cứ lúc nào</div>
                            </div>
                        </div>
                        <div class="block-features__divider"></div>
                        <div class="block-features__item">
                            <div class="block-features__icon"><svg width="48px" height="48px">
                                <use xlink:href="userFE/images/sprite.svg#fi-payment-security-48"></use>
                                </svg></div>
                            <div class="block-features__content">
                                <div class="block-features__title"> Đảm bảo 100%</div>
                                <div class="block-features__subtitle">Thanh toán an toàn</div>
                            </div>
                        </div>
                        <div class="block-features__divider"></div>
                        <div class="block-features__item">
                            <div class="block-features__icon"><svg width="48px" height="48px">
                                <use xlink:href="userFE/images/sprite.svg#fi-tag-48"></use>
                                </svg></div>
                            <div class="block-features__content">
                                <div class="block-features__title">Ưu đãi hấp dẫn</div>
                                <div class="block-features__subtitle">Giảm giá lên đến 40%</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="block block-products-carousel" data-layout="grid-5">
                <div class="container">
                    <div class="block-header">
                        <h3 class="block-header__title">Rạng Đông</h3>
                        <div class="block-header__divider"></div>
                        <div class="block-header__arrows-list"><button
                                class="block-header__arrow block-header__arrow--left" type="button"><svg width="7px"
                                                                                                     height="11px">
                                <use xlink:href="userFE/images/sprite.svg#arrow-rounded-left-7x11"></use>
                                </svg></button> <button class="block-header__arrow block-header__arrow--right"
                                                    type="button"><svg width="7px" height="11px">
                                <use xlink:href="userFE/images/sprite.svg#arrow-rounded-right-7x11"></use>
                                </svg></button></div>
                    </div>
                    <div class="block-products-carousel__slider">
                        <div class="block-products-carousel__preloader "></div>
                        <div class="owl-carousel">
                            <c:set var="index" value="0"/>
                            <c:forEach items="${requestScope.ProducerofRangDong}" var="prd">
                                <c:if test="${index%2 == 0}">
                                    <div class="block-products-carousel__column">
                                        <div class="block-products-carousel__cell text-center">
                                            <div class="product-card">
                                                <div class="product-card__image"><a href="product?id=${prd.productID}"><img
                                                            src="${prd.image}" alt=""></a></div>
                                                <div class="product-card__info">
                                                    <div class="product-card__name"><a href="product?id=${prd.productID}">${prd.productName}</a>
                                                    </div>
                                                    <div class="product-card__rating">
                                                        <div class="rating">
                                                            <div class="rating__body"><svg
                                                                    class="rating__star rating__star--active" width="13px"
                                                                    height="12px">
                                                                <g class="rating__fill">
                                                                <use xlink:href="userFE/images/sprite.svg#star-normal"></use>
                                                                </g>
                                                                <g class="rating__stroke">
                                                                <use xlink:href="userFE/images/sprite.svg#star-normal-stroke">
                                                                </use>
                                                                </g>
                                                                </svg>
                                                                <div
                                                                    class="rating__star rating__star--only-edge rating__star--active">
                                                                    <div class="rating__fill">
                                                                        <div class="fake-svg-icon"></div>
                                                                    </div>
                                                                    <div class="rating__stroke">
                                                                        <div class="fake-svg-icon"></div>
                                                                    </div>
                                                                </div><svg class="rating__star rating__star--active"
                                                                           width="13px" height="12px">
                                                                <g class="rating__fill">
                                                                <use xlink:href="userFE/images/sprite.svg#star-normal"></use>
                                                                </g>
                                                                <g class="rating__stroke">
                                                                <use xlink:href="userFE/images/sprite.svg#star-normal-stroke">
                                                                </use>
                                                                </g>
                                                                </svg>
                                                                <div
                                                                    class="rating__star rating__star--only-edge rating__star--active">
                                                                    <div class="rating__fill">
                                                                        <div class="fake-svg-icon"></div>
                                                                    </div>
                                                                    <div class="rating__stroke">
                                                                        <div class="fake-svg-icon"></div>
                                                                    </div>
                                                                </div><svg class="rating__star rating__star--active"
                                                                           width="13px" height="12px">
                                                                <g class="rating__fill">
                                                                <use xlink:href="userFE/images/sprite.svg#star-normal"></use>
                                                                </g>
                                                                <g class="rating__stroke">
                                                                <use xlink:href="userFE/images/sprite.svg#star-normal-stroke">
                                                                </use>
                                                                </g>
                                                                </svg>
                                                                <div
                                                                    class="rating__star rating__star--only-edge rating__star--active">
                                                                    <div class="rating__fill">
                                                                        <div class="fake-svg-icon"></div>
                                                                    </div>
                                                                    <div class="rating__stroke">
                                                                        <div class="fake-svg-icon"></div>
                                                                    </div>
                                                                </div><svg class="rating__star rating__star--active"
                                                                           width="13px" height="12px">
                                                                <g class="rating__fill">
                                                                <use xlink:href="userFE/images/sprite.svg#star-normal"></use>
                                                                </g>
                                                                <g class="rating__stroke">
                                                                <use xlink:href="userFE/images/sprite.svg#star-normal-stroke">
                                                                </use>
                                                                </g>
                                                                </svg>
                                                                <div
                                                                    class="rating__star rating__star--only-edge rating__star--active">
                                                                    <div class="rating__fill">
                                                                        <div class="fake-svg-icon"></div>
                                                                    </div>
                                                                    <div class="rating__stroke">
                                                                        <div class="fake-svg-icon"></div>
                                                                    </div>
                                                                </div><svg class="rating__star" width="13px" height="12px">
                                                                <g class="rating__fill">
                                                                <use xlink:href="userFE/images/sprite.svg#star-normal"></use>
                                                                </g>
                                                                <g class="rating__stroke">
                                                                <use xlink:href="userFE/images/sprite.svg#star-normal-stroke">
                                                                </use>
                                                                </g>
                                                                </svg>
                                                                <div class="rating__star rating__star--only-edge">
                                                                    <div class="rating__fill">
                                                                        <div class="fake-svg-icon"></div>
                                                                    </div>
                                                                    <div class="rating__stroke">
                                                                        <div class="fake-svg-icon"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="product-card__rating-legend">9 Reviews</div>
                                                    </div>

                                                </div>
                                                <div class="product-card__actions">
                                                    <div class="product-card__availability">Availability: <span
                                                            class="text-success">In Stock</span></div>
                                                    <div class="product-card__prices">${prd.priceFormat} VND</div>
                                                    <div class="product-card__buttons"><form action="" method="post">
                                                            <button
                                                                class="btn btn-primary product-card__addtocart" type="submit">Add To Cart</button>
                                                            <input type="text" name="id" value="${prd.productID}" hidden>
                                                            <input type="text" name="quantity" value="1" hidden>

                                                        </form> <button
                                                            class="btn btn-secondary product-card__addtocart product-card__addtocart--list"
                                                            type="button">Add To Cart</button> <button
                                                            class="btn btn-light btn-svg-icon btn-svg-icon--fake-svg product-card__wishlist"
                                                            type="button"><svg width="16px" height="16px">
                                                            <use xlink:href="userFE/images/sprite.svg#wishlist-16"></use>
                                                            </svg> <span
                                                                class="fake-svg-icon fake-svg-icon--wishlist-16"></span></button>
                                                        <button
                                                            class="btn btn-light btn-svg-icon btn-svg-icon--fake-svg product-card__compare"
                                                            type="button"><svg width="16px" height="16px">
                                                            <use xlink:href="userFE/images/sprite.svg#compare-16"></use>
                                                            </svg> <span
                                                                class="fake-svg-icon fake-svg-icon--compare-16"></span></button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${index%2 != 0}">
                                        <div class="block-products-carousel__cell text-center">
                                            <div class="product-card">
                                                <div class="product-card__badges-list"></div>
                                                <div class="product-card__image"><a href="product?id=${prd.productID}"><img
                                                            src="${prd.image}" alt=""></a></div>
                                                <div class="product-card__info">
                                                    <div class="product-card__name"><a href="product?id=${prd.productID}"></a>${prd.productName}</div>
                                                    <div class="product-card__rating">
                                                        <div class="rating">
                                                            <div class="rating__body"><svg
                                                                    class="rating__star rating__star--active" width="13px"
                                                                    height="12px">
                                                                <g class="rating__fill">
                                                                <use xlink:href="userFE/images/sprite.svg#star-normal"></use>
                                                                </g>
                                                                <g class="rating__stroke">
                                                                <use xlink:href="userFE/images/sprite.svg#star-normal-stroke">
                                                                </use>
                                                                </g>
                                                                </svg>
                                                                <div
                                                                    class="rating__star rating__star--only-edge rating__star--active">
                                                                    <div class="rating__fill">
                                                                        <div class="fake-svg-icon"></div>
                                                                    </div>
                                                                    <div class="rating__stroke">
                                                                        <div class="fake-svg-icon"></div>
                                                                    </div>
                                                                </div><svg class="rating__star rating__star--active"
                                                                           width="13px" height="12px">
                                                                <g class="rating__fill">
                                                                <use xlink:href="userFE/images/sprite.svg#star-normal"></use>
                                                                </g>
                                                                <g class="rating__stroke">
                                                                <use xlink:href="userFE/images/sprite.svg#star-normal-stroke">
                                                                </use>
                                                                </g>
                                                                </svg>
                                                                <div
                                                                    class="rating__star rating__star--only-edge rating__star--active">
                                                                    <div class="rating__fill">
                                                                        <div class="fake-svg-icon"></div>
                                                                    </div>
                                                                    <div class="rating__stroke">
                                                                        <div class="fake-svg-icon"></div>
                                                                    </div>
                                                                </div><svg class="rating__star rating__star--active"
                                                                           width="13px" height="12px">
                                                                <g class="rating__fill">
                                                                <use xlink:href="userFE/images/sprite.svg#star-normal"></use>
                                                                </g>
                                                                <g class="rating__stroke">
                                                                <use xlink:href="userFE/images/sprite.svg#star-normal-stroke">
                                                                </use>
                                                                </g>
                                                                </svg>
                                                                <div
                                                                    class="rating__star rating__star--only-edge rating__star--active">
                                                                    <div class="rating__fill">
                                                                        <div class="fake-svg-icon"></div>
                                                                    </div>
                                                                    <div class="rating__stroke">
                                                                        <div class="fake-svg-icon"></div>
                                                                    </div>
                                                                </div><svg class="rating__star rating__star--active"
                                                                           width="13px" height="12px">
                                                                <g class="rating__fill">
                                                                <use xlink:href="userFE/images/sprite.svg#star-normal"></use>
                                                                </g>
                                                                <g class="rating__stroke">
                                                                <use xlink:href="userFE/images/sprite.svg#star-normal-stroke">
                                                                </use>
                                                                </g>
                                                                </svg>
                                                                <div
                                                                    class="rating__star rating__star--only-edge rating__star--active">
                                                                    <div class="rating__fill">
                                                                        <div class="fake-svg-icon"></div>
                                                                    </div>
                                                                    <div class="rating__stroke">
                                                                        <div class="fake-svg-icon"></div>
                                                                    </div>
                                                                </div><svg class="rating__star rating__star--active"
                                                                           width="13px" height="12px">
                                                                <g class="rating__fill">
                                                                <use xlink:href="userFE/images/sprite.svg#star-normal"></use>
                                                                </g>
                                                                <g class="rating__stroke">
                                                                <use xlink:href="userFE/images/sprite.svg#star-normal-stroke">
                                                                </use>
                                                                </g>
                                                                </svg>
                                                                <div
                                                                    class="rating__star rating__star--only-edge rating__star--active">
                                                                    <div class="rating__fill">
                                                                        <div class="fake-svg-icon"></div>
                                                                    </div>
                                                                    <div class="rating__stroke">
                                                                        <div class="fake-svg-icon"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="product-card__rating-legend">11 Reviews</div>
                                                    </div>
                                                    <ul class="product-card__features-list">
                                                        <li>Speed: 750 RPM</li>
                                                        <li>Power Source: Cordless-Electric</li>
                                                        <li>Battery Cell Type: Lithium</li>
                                                        <li>Voltage: 20 Volts</li>
                                                        <li>Battery Capacity: 2 Ah</li>
                                                    </ul>
                                                </div>
                                                <div class="product-card__actions">
                                                    <div class="product-card__availability">Availability: <span
                                                            class="text-success">In Stock</span></div>
                                                    <div class="product-card__prices">${prd.priceFormat} VND</div>
                                                    <div class="product-card__buttons"><form action="" method="post">
                                                            <button
                                                                class="btn btn-primary product-card__addtocart" type="submit">Add To Cart</button>
                                                            <input type="text" name="id" value="${prd.productID}" hidden>
                                                            <input type="text" name="quantity" value="1" hidden>

                                                        </form> <button
                                                            class="btn btn-secondary product-card__addtocart product-card__addtocart--list"
                                                            type="button">Add To Cart</button> <button
                                                            class="btn btn-light btn-svg-icon btn-svg-icon--fake-svg product-card__wishlist"
                                                            type="button"><svg width="16px" height="16px">
                                                            <use xlink:href="userFE/images/sprite.svg#wishlist-16"></use>
                                                            </svg> <span
                                                                class="fake-svg-icon fake-svg-icon--wishlist-16"></span></button>
                                                        <button
                                                            class="btn btn-light btn-svg-icon btn-svg-icon--fake-svg product-card__compare"
                                                            type="button"><svg width="16px" height="16px">
                                                            <use xlink:href="userFE/images/sprite.svg#compare-16"></use>
                                                            </svg> <span
                                                                class="fake-svg-icon fake-svg-icon--compare-16"></span></button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>    
                                <c:set var="index" value="${index+1}"/>
                            </c:forEach>                           
                        </div>
                    </div>
                </div>
            </div>
            <div class="block block-products block-products--layout--large-last">
                <div class="container">
                    <div class="block-header">
                        <h3 class="block-header__title">Trần Phú</h3>
                        <div class="block-header__divider"></div>
                    </div>
                    <div class="block-products__body">
                        <div class="block-products__list">
                            <c:forEach begin="0" end="5" var="i">
                                <div class="block-products__list-item">
                                    <div class="product-card">
                                        <div class="product-card__image"><a href="product?id=${ProducerofTranPhu.get(i).productID}"><img
                                                    src="${ProducerofTranPhu.get(i).image}" alt=""></a></div>
                                        <div class="product-card__info">
                                            <div class="product-card__name"><a href="product?id=${ProducerofTranPhu.get(i).productID}">${ProducerofTranPhu.get(i).productName}</a>
                                            </div>
                                            <div class="product-card__rating">
                                                <div class="rating">
                                                    <div class="rating__body"><svg class="rating__star rating__star--active"
                                                                                   width="13px" height="12px">
                                                        <g class="rating__fill">
                                                        <use xlink:href="userFE/images/sprite.svg#star-normal"></use>
                                                        </g>
                                                        <g class="rating__stroke">
                                                        <use xlink:href="userFE/images/sprite.svg#star-normal-stroke">
                                                        </use>
                                                        </g>
                                                        </svg>
                                                        <div
                                                            class="rating__star rating__star--only-edge rating__star--active">
                                                            <div class="rating__fill">
                                                                <div class="fake-svg-icon"></div>
                                                            </div>
                                                            <div class="rating__stroke">
                                                                <div class="fake-svg-icon"></div>
                                                            </div>
                                                        </div><svg class="rating__star rating__star--active" width="13px"
                                                                   height="12px">
                                                        <g class="rating__fill">
                                                        <use xlink:href="userFE/images/sprite.svg#star-normal"></use>
                                                        </g>
                                                        <g class="rating__stroke">
                                                        <use xlink:href="userFE/images/sprite.svg#star-normal-stroke">
                                                        </use>
                                                        </g>
                                                        </svg>
                                                        <div
                                                            class="rating__star rating__star--only-edge rating__star--active">
                                                            <div class="rating__fill">
                                                                <div class="fake-svg-icon"></div>
                                                            </div>
                                                            <div class="rating__stroke">
                                                                <div class="fake-svg-icon"></div>
                                                            </div>
                                                        </div><svg class="rating__star rating__star--active" width="13px"
                                                                   height="12px">
                                                        <g class="rating__fill">
                                                        <use xlink:href="userFE/images/sprite.svg#star-normal"></use>
                                                        </g>
                                                        <g class="rating__stroke">
                                                        <use xlink:href="userFE/images/sprite.svg#star-normal-stroke">
                                                        </use>
                                                        </g>
                                                        </svg>
                                                        <div
                                                            class="rating__star rating__star--only-edge rating__star--active">
                                                            <div class="rating__fill">
                                                                <div class="fake-svg-icon"></div>
                                                            </div>
                                                            <div class="rating__stroke">
                                                                <div class="fake-svg-icon"></div>
                                                            </div>
                                                        </div><svg class="rating__star rating__star--active" width="13px"
                                                                   height="12px">
                                                        <g class="rating__fill">
                                                        <use xlink:href="userFE/images/sprite.svg#star-normal"></use>
                                                        </g>
                                                        <g class="rating__stroke">
                                                        <use xlink:href="userFE/images/sprite.svg#star-normal-stroke">
                                                        </use>
                                                        </g>
                                                        </svg>
                                                        <div
                                                            class="rating__star rating__star--only-edge rating__star--active">
                                                            <div class="rating__fill">
                                                                <div class="fake-svg-icon"></div>
                                                            </div>
                                                            <div class="rating__stroke">
                                                                <div class="fake-svg-icon"></div>
                                                            </div>
                                                        </div><svg class="rating__star rating__star--active" width="13px"
                                                                   height="12px">
                                                        <g class="rating__fill">
                                                        <use xlink:href="userFE/images/sprite.svg#star-normal"></use>
                                                        </g>
                                                        <g class="rating__stroke">
                                                        <use xlink:href="userFE/images/sprite.svg#star-normal-stroke">
                                                        </use>
                                                        </g>
                                                        </svg>
                                                        <div
                                                            class="rating__star rating__star--only-edge rating__star--active">
                                                            <div class="rating__fill">
                                                                <div class="fake-svg-icon"></div>
                                                            </div>
                                                            <div class="rating__stroke">
                                                                <div class="fake-svg-icon"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="product-card__rating-legend">11 Reviews</div>
                                            </div>

                                        </div>
                                        <div class="product-card__actions">
                                            <div class="product-card__availability">Availability: <span
                                                    class="text-success">In Stock</span></div>
                                            <div class="product-card__prices">${ProducerofTranPhu.get(i).getPriceFormat()} VND</div>
                                            <div class="product-card__buttons">
                                                <form action="" method="post">
                                                    <button
                                                        class="btn btn-primary product-card__addtocart" type="submit">Add To Cart</button>
                                                    <input type="text" name="id" value="${ProducerofTranPhu.get(i).productID}" hidden>
                                                    <input type="text" name="quantity" value="1" hidden>

                                                </form>
                                                <button class="btn btn-secondary product-card__addtocart product-card__addtocart--list"
                                                        type="button">Add To Cart</button> <button
                                                        class="btn btn-light btn-svg-icon btn-svg-icon--fake-svg product-card__wishlist"
                                                        type="button"><svg width="16px" height="16px">
                                                    <use xlink:href="userFE/images/sprite.svg#wishlist-16"></use>
                                                    </svg> <span
                                                        class="fake-svg-icon fake-svg-icon--wishlist-16"></span></button>
                                                <button
                                                    class="btn btn-light btn-svg-icon btn-svg-icon--fake-svg product-card__compare"
                                                    type="button"><svg width="16px" height="16px">
                                                    <use xlink:href="userFE/images/sprite.svg#compare-16"></use>
                                                    </svg> <span
                                                        class="fake-svg-icon fake-svg-icon--compare-16"></span></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="block-products__featured">
                            <div class="block-products__featured-item">
                                <div class="product-card">
                                    <div class="product-card__badges-list">
                                        <div class="product-card__badge product-card__badge--new">New</div>
                                    </div>
                                    <div class="product-card__image"><a href="product?id=${ProducerofTranPhu.get(8).productID}"><img
                                                src="${ProducerofTranPhu.get(8).image}" alt=""></a></div>
                                    <div class="product-card__info">
                                        <div class="product-card__name"><a href="product?id=${ProducerofTranPhu.get(8).productID}">${ProducerofTranPhu.get(8).productName}</a></div>
                                        <div class="product-card__rating">
                                            <div class="rating">
                                                <div class="rating__body"><svg class="rating__star rating__star--active"
                                                                               width="13px" height="12px">
                                                    <g class="rating__fill">
                                                    <use xlink:href="images/sprite.svg#star-normal"></use>
                                                    </g>
                                                    <g class="rating__stroke">
                                                    <use xlink:href="images/sprite.svg#star-normal-stroke">
                                                    </use>
                                                    </g>
                                                    </svg>
                                                    <div
                                                        class="rating__star rating__star--only-edge rating__star--active">
                                                        <div class="rating__fill">
                                                            <div class="fake-svg-icon"></div>
                                                        </div>
                                                        <div class="rating__stroke">
                                                            <div class="fake-svg-icon"></div>
                                                        </div>
                                                    </div><svg class="rating__star rating__star--active" width="13px"
                                                               height="12px">
                                                    <g class="rating__fill">
                                                    <use xlink:href="images/sprite.svg#star-normal"></use>
                                                    </g>
                                                    <g class="rating__stroke">
                                                    <use xlink:href="images/sprite.svg#star-normal-stroke">
                                                    </use>
                                                    </g>
                                                    </svg>
                                                    <div
                                                        class="rating__star rating__star--only-edge rating__star--active">
                                                        <div class="rating__fill">
                                                            <div class="fake-svg-icon"></div>
                                                        </div>
                                                        <div class="rating__stroke">
                                                            <div class="fake-svg-icon"></div>
                                                        </div>
                                                    </div><svg class="rating__star rating__star--active" width="13px"
                                                               height="12px">
                                                    <g class="rating__fill">
                                                    <use xlink:href="images/sprite.svg#star-normal"></use>
                                                    </g>
                                                    <g class="rating__stroke">
                                                    <use xlink:href="images/sprite.svg#star-normal-stroke">
                                                    </use>
                                                    </g>
                                                    </svg>
                                                    <div
                                                        class="rating__star rating__star--only-edge rating__star--active">
                                                        <div class="rating__fill">
                                                            <div class="fake-svg-icon"></div>
                                                        </div>
                                                        <div class="rating__stroke">
                                                            <div class="fake-svg-icon"></div>
                                                        </div>
                                                    </div><svg class="rating__star rating__star--active" width="13px"
                                                               height="12px">
                                                    <g class="rating__fill">
                                                    <use xlink:href="images/sprite.svg#star-normal"></use>
                                                    </g>
                                                    <g class="rating__stroke">
                                                    <use xlink:href="images/sprite.svg#star-normal-stroke">
                                                    </use>
                                                    </g>
                                                    </svg>
                                                    <div
                                                        class="rating__star rating__star--only-edge rating__star--active">
                                                        <div class="rating__fill">
                                                            <div class="fake-svg-icon"></div>
                                                        </div>
                                                        <div class="rating__stroke">
                                                            <div class="fake-svg-icon"></div>
                                                        </div>
                                                    </div><svg class="rating__star" width="13px" height="12px">
                                                    <g class="rating__fill">
                                                    <use xlink:href="images/sprite.svg#star-normal"></use>
                                                    </g>
                                                    <g class="rating__stroke">
                                                    <use xlink:href="images/sprite.svg#star-normal-stroke">
                                                    </use>
                                                    </g>
                                                    </svg>
                                                    <div class="rating__star rating__star--only-edge">
                                                        <div class="rating__fill">
                                                            <div class="fake-svg-icon"></div>
                                                        </div>
                                                        <div class="rating__stroke">
                                                            <div class="fake-svg-icon"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="product-card__rating-legend">9 Reviews</div>
                                        </div>
                                        <ul class="product-card__features-list">
                                            <li>Speed: 750 RPM</li>
                                            <li>Power Source: Cordless-Electric</li>
                                            <li>Battery Cell Type: Lithium</li>
                                            <li>Voltage: 20 Volts</li>
                                            <li>Battery Capacity: 2 Ah</li>
                                        </ul>
                                    </div>
                                    <div class="product-card__actions">
                                        <div class="product-card__availability">Availability: <span
                                                class="text-success">In Stock</span></div>
                                        <div class="product-card__prices">${ProducerofTranPhu.get(8).getPriceFormat()} VND</div>
                                        <div class="product-card__buttons">
                                            <form action="" method="post">
                                                <button
                                                    class="btn btn-primary product-card__addtocart" type="submit">Add To Cart</button>
                                                <input type="text" name="id" value="${ProducerofTranPhu.get(8).productID}" hidden>
                                                <input type="text" name="quantity" value="1" hidden>

                                            </form>
                                            <button class="btn btn-secondary product-card__addtocart product-card__addtocart--list"
                                                    type="button">Add To Cart</button> <button
                                                    class="btn btn-light btn-svg-icon btn-svg-icon--fake-svg product-card__wishlist"
                                                    type="button"><svg width="16px" height="16px">
                                                <use xlink:href="userFE/images/sprite.svg#wishlist-16"></use>
                                                </svg> <span
                                                    class="fake-svg-icon fake-svg-icon--wishlist-16"></span></button>
                                            <button
                                                class="btn btn-light btn-svg-icon btn-svg-icon--fake-svg product-card__compare"
                                                type="button"><svg width="16px" height="16px">
                                                <use xlink:href="userFE/images/sprite.svg#compare-16"></use>
                                                </svg> <span
                                                    class="fake-svg-icon fake-svg-icon--compare-16"></span></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- .block-products / end -->
            <!-- .block-categories -->
            <div class="block block--highlighted block-categories block-categories--layout--compact">
                <div class="container">
                    <div class="block-header">
                        <h3 class="block-header__title">Các nhãn hàng phổ biến</h3>
                        <div class="block-header__divider"></div>
                    </div>
                    <div class="block-categories__list">
                        <div class="block-categories__item category-card category-card--layout--compact">
                            <div class="category-card__body">
                                <div class="category-card__image"><a href="userList?pid=1"><img src="userFE/images/logos/logo1.png"
                                                                                                alt=""></a></div>
                                <div class="category-card__content">
                                    <div class="category-card__name"><a href="userList?pid=1">Rạng Đông</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="block-categories__item category-card category-card--layout--compact">
                            <div class="category-card__body">
                                <div class="category-card__image"><a href="userList?pid=2"><img src="userFE/images/logos/logo2.png"
                                                                                                alt=""></a></div>
                                <div class="category-card__content">
                                    <div class="category-card__name"><a href="userList?pid=2">Trần Phú</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="block-categories__item category-card category-card--layout--compact">
                            <div class="category-card__body">
                                <div class="category-card__image"><a href="userList?pid=3"><img src="userFE/images/logos/logo3.jpg"
                                                                                                alt=""></a></div>
                                <div class="category-card__content">
                                    <div class="category-card__name"><a href="userList?pid=3">Thống Nhất</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="block-categories__item category-card category-card--layout--compact">
                            <div class="category-card__body">
                                <div class="category-card__image"><a href="userList?pid=4"><img src="userFE/images/logos/logo4.png"
                                                                                                alt=""></a></div>
                                <div class="category-card__content">
                                    <div class="category-card__name"><a href="userList?pid=4">Philips</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="block-categories__item category-card category-card--layout--compact">
                            <div class="category-card__body">
                                <div class="category-card__image"><a href="userList?pid=5"><img src="userFE/images/logos/logo5.png"
                                                                                                alt=""></a></div>
                                <div class="category-card__content">
                                    <div class="category-card__name"><a href="userList?pid=5">Sino</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="block-categories__item category-card category-card--layout--compact">
                            <div class="category-card__body">
                                <div class="category-card__image"><a href="userList?pid=6"><img src="userFE/images/logos/logo6.png"
                                                                                                alt=""></a></div>
                                <div class="category-card__content">
                                    <div class="category-card__name"><a href="userList?pid=6">Lioa</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="block block-products-carousel" data-layout="grid-5">
                <div class="container">
                    <div class="block-header">
                        <h3 class="block-header__title">Hàng mới</h3>
                        <div class="block-header__divider"></div>
                        <!--                        <ul class="block-header__groups-list">
                                                    <li><button type="button" class="block-header__group block-header__group--active">Tất
                                                            cả</button></li>
                                                    <li><button type="button" class="block-header__group">LED bán nguyệt</button></li>
                                                    <li><button type="button" class="block-header__group">Cáp nhôm</button></li>
                                                    <li><button type="button" class="block-header__group">Ổn áp - Biến áp</button></li>
                                                </ul>-->
                        <div class="block-header__arrows-list"><button
                                class="block-header__arrow block-header__arrow--left" type="button"><svg width="7px"
                                                                                                     height="11px">
                                <use xlink:href="userFE/images/sprite.svg#arrow-rounded-left-7x11"></use>
                                </svg></button> <button class="block-header__arrow block-header__arrow--right"
                                                    type="button"><svg width="7px" height="11px">
                                <use xlink:href="userFE/images/sprite.svg#arrow-rounded-right-7x11"></use>
                                </svg></button></div>
                    </div>
                    <div class="block-products-carousel__slider">
                        <div class="block-products-carousel__preloader"></div>
                        <div class="owl-carousel">                        
                            <c:forEach begin="0" end="10" items="${requestScope.Productnew}" var="pn">
                                <div class="block-products-carousel__column">
                                    <div class="block-products-carousel__cell">
                                        <div class="product-card">                                          
                                            <div class="product-card__image"><a href="product?id=${pn.productID}"><img
                                                        src="${pn.image}"  alt=""></a></div>
                                            <div class="product-card__info">
                                                <div class="product-card__name"><a href="product?id=${pn.productID}">${pn.productName}</a></div>
                                                <div class="product-card__rating">
                                                    <div class="rating">
                                                        <div class="rating__body"><svg
                                                                class="rating__star rating__star--active" width="13px"
                                                                height="12px">
                                                            <g class="rating__fill">
                                                            <use xlink:href="userFE/images/sprite.svg#star-normal"></use>
                                                            </g>
                                                            <g class="rating__stroke">
                                                            <use xlink:href="userFE/images/sprite.svg#star-normal-stroke">
                                                            </use>
                                                            </g>
                                                            </svg>
                                                            <div
                                                                class="rating__star rating__star--only-edge rating__star--active">
                                                                <div class="rating__fill">
                                                                    <div class="fake-svg-icon"></div>
                                                                </div>
                                                                <div class="rating__stroke">
                                                                    <div class="fake-svg-icon"></div>
                                                                </div>
                                                            </div><svg class="rating__star rating__star--active"
                                                                       width="13px" height="12px">
                                                            <g class="rating__fill">
                                                            <use xlink:href="userFE/images/sprite.svg#star-normal"></use>
                                                            </g>
                                                            <g class="rating__stroke">
                                                            <use xlink:href="userFE/images/sprite.svg#star-normal-stroke">
                                                            </use>
                                                            </g>
                                                            </svg>
                                                            <div
                                                                class="rating__star rating__star--only-edge rating__star--active">
                                                                <div class="rating__fill">
                                                                    <div class="fake-svg-icon"></div>
                                                                </div>
                                                                <div class="rating__stroke">
                                                                    <div class="fake-svg-icon"></div>
                                                                </div>
                                                            </div><svg class="rating__star rating__star--active"
                                                                       width="13px" height="12px">
                                                            <g class="rating__fill">
                                                            <use xlink:href="userFE/images/sprite.svg#star-normal"></use>
                                                            </g>
                                                            <g class="rating__stroke">
                                                            <use xlink:href="userFE/images/sprite.svg#star-normal-stroke">
                                                            </use>
                                                            </g>
                                                            </svg>
                                                            <div
                                                                class="rating__star rating__star--only-edge rating__star--active">
                                                                <div class="rating__fill">
                                                                    <div class="fake-svg-icon"></div>
                                                                </div>
                                                                <div class="rating__stroke">
                                                                    <div class="fake-svg-icon"></div>
                                                                </div>
                                                            </div><svg class="rating__star rating__star--active"
                                                                       width="13px" height="12px">
                                                            <g class="rating__fill">
                                                            <use xlink:href="userFE/images/sprite.svg#star-normal"></use>
                                                            </g>
                                                            <g class="rating__stroke">
                                                            <use xlink:href="userFE/images/sprite.svg#star-normal-stroke">
                                                            </use>
                                                            </g>
                                                            </svg>
                                                            <div
                                                                class="rating__star rating__star--only-edge rating__star--active">
                                                                <div class="rating__fill">
                                                                    <div class="fake-svg-icon"></div>
                                                                </div>
                                                                <div class="rating__stroke">
                                                                    <div class="fake-svg-icon"></div>
                                                                </div>
                                                            </div><svg class="rating__star" width="13px" height="12px">
                                                            <g class="rating__fill">
                                                            <use xlink:href="userFE/images/sprite.svg#star-normal"></use>
                                                            </g>
                                                            <g class="rating__stroke">
                                                            <use xlink:href="userFE/images/sprite.svg#star-normal-stroke">
                                                            </use>
                                                            </g>
                                                            </svg>
                                                            <div class="rating__star rating__star--only-edge">
                                                                <div class="rating__fill">
                                                                    <div class="fake-svg-icon"></div>
                                                                </div>
                                                                <div class="rating__stroke">
                                                                    <div class="fake-svg-icon"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="product-card__rating-legend">9 Reviews</div>
                                                </div>
                                                <ul class="product-card__features-list">
                                                    <li>Speed: 750 RPM</li>
                                                    <li>Power Source: Cordless-Electric</li>
                                                    <li>Battery Cell Type: Lithium</li>
                                                    <li>Voltage: 20 Volts</li>
                                                    <li>Battery Capacity: 2 Ah</li>
                                                </ul>
                                            </div>
                                            <div class="product-card__actions">
                                                <div class="product-card__availability">Availability: <span
                                                        class="text-success">In Stock</span></div>
                                                <div class="product-card__prices">${pn.priceFormat} VND</div>
                                                <div class="product-card__buttons"><form action="" method="post">
                                                        <button
                                                            class="btn btn-primary product-card__addtocart" type="submit">Add To Cart</button>
                                                        <input type="text" name="id" value="${pn.productID}" hidden>
                                                        <input type="text" name="quantity" value="1" hidden>

                                                    </form> <button
                                                        class="btn btn-secondary product-card__addtocart product-card__addtocart--list"
                                                        type="button">Add To Cart</button> <button
                                                        class="btn btn-light btn-svg-icon btn-svg-icon--fake-svg product-card__wishlist"
                                                        type="button"><svg width="16px" height="16px">
                                                        <use xlink:href="userFE/images/sprite.svg#wishlist-16"></use>
                                                        </svg> <span
                                                            class="fake-svg-icon fake-svg-icon--wishlist-16"></span></button>
                                                    <button
                                                        class="btn btn-light btn-svg-icon btn-svg-icon--fake-svg product-card__compare"
                                                        type="button"><svg width="16px" height="16px">
                                                        <use xlink:href="userFE/images/sprite.svg#compare-16"></use>
                                                        </svg> <span
                                                            class="fake-svg-icon fake-svg-icon--compare-16"></span></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>


                        </div>
                    </div>
                </div>
            </div>
            <div class="block block-posts block-posts--layout--grid-nl" data-layout="grid-nl">
            </div>
            <div class="block block-brands">
                <div class="container">
                    <div class="block-brands__slider">
                        <div class="owl-carousel d-flex align-items-center">
                            <div class="block-brands__item"><a href="userList?pid=1"><img src="userFE/images/logos/logo1.png" alt=""></a>
                            </div>
                            <div class="block-brands__item"><a href="userList?pid=2"><img src="userFE/images/logos/logo2.png" alt=""></a>
                            </div>
                            <div class="block-brands__item"><a href="userList?pid=3"><img src="userFE/images/logos/logo3.jpg" alt=""></a>
                            </div>
                            <div class="block-brands__item"><a href="userList?pid=4"><img src="userFE/images/logos/logo4.png" alt=""></a>
                            </div>
                            <div class="block-brands__item"><a href="userList?pid=5"><img src="userFE/images/logos/logo5.png" alt=""></a>
                            </div>
                            <div class="block-brands__item"><a href="userList?pid=6"><img src="userFE/images/logos/logo6.png" alt=""></a>
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
</div>
</body>

</html>
