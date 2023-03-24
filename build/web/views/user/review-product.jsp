<%-- 
    Document   : review-product
    Created on : Oct 22, 2022, 10:29:32 PM
    Author     : Dell
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <div id="quickview-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-xl">
                <div class="modal-content"></div>
            </div>
        </div>
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
                                                        <a href="userList?pid=1">Rạng Đông</a>
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
                                                        <a href="userList?pid=2">Trần Phú</a>
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
                                                            <a href="remove?action=delete&id=${i.product.productID}"><button type="button"
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
            <div class="page-header">
                <div class="page-header__container container">
                    <div class="page-header__breadcrumb">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="userHome">Home</a> <svg class="breadcrumb-arrow"
                                                                                             width="6px" height="9px">
                                    <use xlink:href="userFE/images/sprite.svg#arrow-rounded-right-6x9"></use>
                                    </svg></li>
                                <li class="breadcrumb-item"><a href="userList?cid=${product.cate.categoryID}">${product.cate.categoryName}</a> <svg class="breadcrumb-arrow"
                                                                                                                                                    width="6px" height="9px">
                                    <use xlink:href="userFE/images/sprite.svg#arrow-rounded-right-6x9"></use>
                                    </svg></li>
                                <li class="breadcrumb-item active" aria-current="page">${product.productName}
                                </li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="block">
                <div class="container">
                    <div class="product product--layout--standard" data-layout="standard">
                        <div class="product__content">
                            <!-- .product__gallery -->
                            <div class="product__gallery">
                                <div class="product-gallery">
                                    <div class="product-gallery__featured">
                                        <div class="owl-carousel" id="product-image"><a
                                                href="${product.image}" target="_blank"><img
                                                    src="${product.image}" alt=""> </a></div>
                                    </div>
                                    <div class="product-gallery__carousel">
                                        <div class="owl-carousel" id="product-carousel"><a href="#"
                                                                                           class="product-gallery__carousel-item"><img
                                                    class="product-gallery__carousel-image"
                                                    src="${product.image}" alt=""> </a>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- .product__gallery / end -->
                            <!-- .product__info -->
                            <div class="product__info">
                                <div class="product__wishlist-compare"><button type="button"
                                                                               class="btn btn-sm btn-light btn-svg-icon" data-toggle="tooltip"
                                                                               data-placement="right" title="Wishlist"><svg width="16px" height="16px">
                                        <use xlink:href="userFE/images/sprite.svg#wishlist-16"></use>
                                        </svg></button> <button type="button" class="btn btn-sm btn-light btn-svg-icon"
                                                            data-toggle="tooltip" data-placement="right" title="Compare"><svg width="16px"
                                                                                                      height="16px">
                                        <use xlink:href="userFE/images/sprite.svg#compare-16"></use>
                                        </svg></button></div>
                                <h1 class="product__name">${product.productName}</h1>
                                <div class="product__rating">
                                    <div class="product__rating-stars">
                                        <div class="rating">
                                            <div class="rating__body"><svg class="rating__star rating__star--active"
                                                                           width="13px" height="12px">
                                                <g class="rating__fill">
                                                <use xlink:href="userFE/images/sprite.svg#star-normal"></use>
                                                </g>
                                                <g class="rating__stroke">
                                                <use xlink:href="userFE/images/sprite.svg#star-normal-stroke"></use>
                                                </g>
                                                </svg>
                                                <div class="rating__star rating__star--only-edge rating__star--active">
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
                                                <use xlink:href="userFE/images/sprite.svg#star-normal-stroke"></use>
                                                </g>
                                                </svg>
                                                <div class="rating__star rating__star--only-edge rating__star--active">
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
                                                <use xlink:href="userFE/images/sprite.svg#star-normal-stroke"></use>
                                                </g>
                                                </svg>
                                                <div class="rating__star rating__star--only-edge rating__star--active">
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
                                                <use xlink:href="userFE/images/sprite.svg#star-normal-stroke"></use>
                                                </g>
                                                </svg>
                                                <div class="rating__star rating__star--only-edge rating__star--active">
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
                                                <use xlink:href="userFE/images/sprite.svg#star-normal-stroke"></use>
                                                </g>
                                                </svg>
                                                <div class="rating__star rating__star--only-edge rating__star--active">
                                                    <div class="rating__fill">
                                                        <div class="fake-svg-icon"></div>
                                                    </div>
                                                    <div class="rating__stroke">
                                                        <div class="fake-svg-icon"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="product__description">
                                    <c:if test="${product.meters != null}">
                                        <li>Meters: <a>${product.meters}</a></li>
                                        </c:if>
                                        <c:if test="${product.color != null}">
                                        <li>Color: <a>${product.color}</a></li> 
                                        </c:if>
                                        <c:if test="${product.wattage != null}">
                                        <li>Wattage: <a>${product.wattage}</a></li> 
                                        </c:if>
                                        <c:if test="${product.chip != null}">
                                        <li>Chip: <a>${product.chip}</a></li> 
                                        </c:if>
                                        <c:if test="${product.nguondien != null}">
                                        <li>Nguồn điện: <a>${product.nguondien}</a></li> 
                                        </c:if>
                                        <c:if test="${product.nhietdomau != null}">
                                        <li>Nhiệt độ màu: <a>${product.nhietdomau}</a></li> 
                                        </c:if>
                                        <c:if test="${product.loiday != null && product.loiday != 0}">
                                        <li>Lõi dây: <a>${product.loiday}</a></li> 
                                        </c:if>
                                        <c:if test="${product.kichthuoc != null}">
                                        <li>Kích thuớc: <a>${product.kichthuoc}</a></li> 
                                        </c:if>
                                        <c:if test="${product.tuoitho != null}">
                                        <li>Tuổi thọ: <a>${product.tuoitho}</a></li> 
                                        </c:if>
                                        <c:if test="${product.dienap != null}">
                                        <li>Điện áp: <a>${product.dienap}</a></li> 
                                        </c:if>
                                        <c:if test="${product.chiutai != null}">
                                        <li>Chịu tải: <a>${product.chiutai}</a></li> 
                                        </c:if>
                                        <c:if test="${product.baohanh != null}">
                                        <li>Bảo Hành: <a>${product.baohanh}</a></li> 
                                        </c:if>


                                </div>

                                <ul class="product__meta">
                                    <!--                                    <li class="product__meta-availability">Availability: <span class="text-success">In
                                                                                Stock</span></li>-->
                                    <li>Brand: <a>${product.prod.producerName}</a></li>
                                    <li>ID:${product.productID}</li>
                                </ul>
                            </div><!-- .product__info / end -->
                            <!-- .product__sidebar -->
                            <div class="product__sidebar">
                                <div class="product__availability">Availability: <span class="text-success">In
                                        Stock</span></div>
                                <div class="product__prices">${product.getPriceFormat()} VND</div>
                                <form class="product__options" action="" method="post">
                                    <div class="form-group product__option"><label class="product__option-label"
                                                                                   for="product-quantity">Quantity</label>
                                        <div class="product__actions">
                                            <div class="product__actions-item">
                                                <div class="input-number product__quantity"><input id="product-quantity"
                                                                                                   class="input-number__input form-control form-control-lg"
                                                                                                   type="number" name="quantity" min="1" value="1">
                                                    <input type="text" name="id" value="${product.productID}" hidden>
                                                    <div class="input-number__add"></div>
                                                    <div class="input-number__sub"></div>
                                                </div>
                                            </div>
                                            <div class="product__actions-item product__actions-item--addtocart"><button
                                                    class="btn btn-primary btn-lg" type="submit">Add to cart</button></div>


                                        </div>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                    <div class="product-tabs">
                        <div class="product-tabs__list"><a href="#tab-description"
                                                           class="product-tabs__item product-tabs__item--active">Description</a><a
                                                           href="#tab-reviews" class="product-tabs__item">Reviews</a></div>
                        <div class="product-tabs__content">
                            <div class="product-tabs__pane product-tabs__pane--active" id="tab-description">
                                <div class="typography">
                                    <h3>Product Full Description</h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum, diam
                                        non iaculis finibus, ipsum arcu sollicitudin dolor, ut cursus sapien sem sed
                                        purus. Donec vitae fringilla tortor, sed fermentum nunc. Suspendisse sodales
                                        turpis dolor, at rutrum dolor tristique id. Quisque pellentesque ullamcorper
                                        felis, eget gravida mi elementum a. Maecenas consectetur volutpat ante, sit amet
                                        molestie urna luctus in. Nulla eget dolor semper urna malesuada dictum. Duis
                                        eleifend pellentesque dui et finibus. Pellentesque dapibus dignissim augue.
                                        Etiam odio est, sodales ac aliquam id, iaculis eget lacus. Aenean porta, ante
                                        vitae suscipit pulvinar, purus dui interdum tellus, sed dapibus mi mauris vitae
                                        tellus.</p>
                                    <h3>Etiam lacus lacus mollis in mattis</h3>
                                    <p>Praesent mattis eget augue ac elementum. Maecenas vel ante ut enim mollis
                                        accumsan. Vestibulum vel eros at mi suscipit feugiat. Sed tortor purus,
                                        vulputate et eros a, rhoncus laoreet orci. Proin sapien neque, commodo at porta
                                        in, vehicula eu elit. Vestibulum ante ipsum primis in faucibus orci luctus et
                                        ultrices posuere cubilia Curae; Curabitur porta vulputate augue, at sollicitudin
                                        nisl molestie eget.</p>
                                    <p>Nunc sollicitudin, nunc id accumsan semper, libero nunc aliquet nulla, nec
                                        pretium ipsum risus ac neque. Morbi eu facilisis purus. Quisque mi tortor,
                                        cursus in nulla ut, laoreet commodo quam. Pellentesque et ornare sapien. In ac
                                        est tempus urna tincidunt finibus. Integer erat ipsum, tristique ac lobortis sit
                                        amet, dapibus sit amet purus. Nam sed lorem nisi. Vestibulum ultrices tincidunt
                                        turpis, sit amet fringilla odio scelerisque non.</p>
                                </div>
                            </div>
                            
                            <div class="product-tabs__pane" id="tab-reviews">
                                <div class="reviews-view">
                                    <div class="reviews-view__list">
                                        <h3 class="reviews-view__header">Customer Reviews</h3>
                                        <div class="reviews-list">
                                            <ol class="reviews-list__content">
                                                <li class="reviews-list__item">
                                                    <div class="review">
                                                        <div class="review__avatar"><img
                                                                src="userFE/images/avatars/avatar-1.jpg" alt=""></div>
                                                        <div class="review__content">
                                                            <div class="review__author">Samantha Smith</div>
                                                            <div class="review__rating">
                                                                <div class="rating">
                                                                    <div class="rating__body"><svg
                                                                            class="rating__star rating__star--active"
                                                                            width="13px" height="12px">
                                                                        <g class="rating__fill">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal">
                                                                        </use>
                                                                        </g>
                                                                        <g class="rating__stroke">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal-stroke">
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
                                                                        </div><svg
                                                                            class="rating__star rating__star--active"
                                                                            width="13px" height="12px">
                                                                        <g class="rating__fill">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal">
                                                                        </use>
                                                                        </g>
                                                                        <g class="rating__stroke">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal-stroke">
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
                                                                        </div><svg
                                                                            class="rating__star rating__star--active"
                                                                            width="13px" height="12px">
                                                                        <g class="rating__fill">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal">
                                                                        </use>
                                                                        </g>
                                                                        <g class="rating__stroke">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal-stroke">
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
                                                                        </div><svg
                                                                            class="rating__star rating__star--active"
                                                                            width="13px" height="12px">
                                                                        <g class="rating__fill">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal">
                                                                        </use>
                                                                        </g>
                                                                        <g class="rating__stroke">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal-stroke">
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
                                                                        </div><svg class="rating__star" width="13px"
                                                                                   height="12px">
                                                                        <g class="rating__fill">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal">
                                                                        </use>
                                                                        </g>
                                                                        <g class="rating__stroke">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal-stroke">
                                                                        </use>
                                                                        </g>
                                                                        </svg>
                                                                        <div
                                                                            class="rating__star rating__star--only-edge">
                                                                            <div class="rating__fill">
                                                                                <div class="fake-svg-icon"></div>
                                                                            </div>
                                                                            <div class="rating__stroke">
                                                                                <div class="fake-svg-icon"></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="review__text">Phasellus id mattis nulla. Mauris
                                                                velit nisi, imperdiet vitae sodales in, maximus ut
                                                                lectus. Vivamus commodo scelerisque lacus, at porttitor
                                                                dui iaculis id. Curabitur imperdiet ultrices fermentum.
                                                            </div>
                                                            <div class="review__date">27 May, 2018</div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="reviews-list__item">
                                                    <div class="review">
                                                        <div class="review__avatar"><img
                                                                src="userFE/images/avatars/avatar-2.jpg" alt=""></div>
                                                        <div class="review__content">
                                                            <div class="review__author">Adam Taylor</div>
                                                            <div class="review__rating">
                                                                <div class="rating">
                                                                    <div class="rating__body"><svg
                                                                            class="rating__star rating__star--active"
                                                                            width="13px" height="12px">
                                                                        <g class="rating__fill">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal">
                                                                        </use>
                                                                        </g>
                                                                        <g class="rating__stroke">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal-stroke">
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
                                                                        </div><svg
                                                                            class="rating__star rating__star--active"
                                                                            width="13px" height="12px">
                                                                        <g class="rating__fill">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal">
                                                                        </use>
                                                                        </g>
                                                                        <g class="rating__stroke">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal-stroke">
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
                                                                        </div><svg
                                                                            class="rating__star rating__star--active"
                                                                            width="13px" height="12px">
                                                                        <g class="rating__fill">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal">
                                                                        </use>
                                                                        </g>
                                                                        <g class="rating__stroke">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal-stroke">
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
                                                                        </div><svg class="rating__star" width="13px"
                                                                                   height="12px">
                                                                        <g class="rating__fill">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal">
                                                                        </use>
                                                                        </g>
                                                                        <g class="rating__stroke">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal-stroke">
                                                                        </use>
                                                                        </g>
                                                                        </svg>
                                                                        <div
                                                                            class="rating__star rating__star--only-edge">
                                                                            <div class="rating__fill">
                                                                                <div class="fake-svg-icon"></div>
                                                                            </div>
                                                                            <div class="rating__stroke">
                                                                                <div class="fake-svg-icon"></div>
                                                                            </div>
                                                                        </div><svg class="rating__star" width="13px"
                                                                                   height="12px">
                                                                        <g class="rating__fill">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal">
                                                                        </use>
                                                                        </g>
                                                                        <g class="rating__stroke">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal-stroke">
                                                                        </use>
                                                                        </g>
                                                                        </svg>
                                                                        <div
                                                                            class="rating__star rating__star--only-edge">
                                                                            <div class="rating__fill">
                                                                                <div class="fake-svg-icon"></div>
                                                                            </div>
                                                                            <div class="rating__stroke">
                                                                                <div class="fake-svg-icon"></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="review__text">Aenean non lorem nisl. Duis tempor
                                                                sollicitudin orci, eget tincidunt ex semper sit amet.
                                                                Nullam neque justo, sodales congue feugiat ac, facilisis
                                                                a augue. Donec tempor sapien et fringilla facilisis. Nam
                                                                maximus consectetur diam. Nulla ut ex mollis, volutpat
                                                                tellus vitae, accumsan ligula.</div>
                                                            <div class="review__date">12 April, 2018</div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="reviews-list__item">
                                                    <div class="review">
                                                        <div class="review__avatar"><img
                                                                src="userFE/images/avatars/avatar-3.jpg" alt=""></div>
                                                        <div class="review__content">
                                                            <div class="review__author">Helena Garcia</div>
                                                            <div class="review__rating">
                                                                <div class="rating">
                                                                    <div class="rating__body"><svg
                                                                            class="rating__star rating__star--active"
                                                                            width="13px" height="12px">
                                                                        <g class="rating__fill">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal">
                                                                        </use>
                                                                        </g>
                                                                        <g class="rating__stroke">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal-stroke">
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
                                                                        </div><svg
                                                                            class="rating__star rating__star--active"
                                                                            width="13px" height="12px">
                                                                        <g class="rating__fill">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal">
                                                                        </use>
                                                                        </g>
                                                                        <g class="rating__stroke">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal-stroke">
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
                                                                        </div><svg
                                                                            class="rating__star rating__star--active"
                                                                            width="13px" height="12px">
                                                                        <g class="rating__fill">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal">
                                                                        </use>
                                                                        </g>
                                                                        <g class="rating__stroke">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal-stroke">
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
                                                                        </div><svg
                                                                            class="rating__star rating__star--active"
                                                                            width="13px" height="12px">
                                                                        <g class="rating__fill">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal">
                                                                        </use>
                                                                        </g>
                                                                        <g class="rating__stroke">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal-stroke">
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
                                                                        </div><svg
                                                                            class="rating__star rating__star--active"
                                                                            width="13px" height="12px">
                                                                        <g class="rating__fill">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal">
                                                                        </use>
                                                                        </g>
                                                                        <g class="rating__stroke">
                                                                        <use
                                                                            xlink:href="userFE/images/sprite.svg#star-normal-stroke">
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
                                                            </div>
                                                            <div class="review__text">Duis ac lectus scelerisque quam
                                                                blandit egestas. Pellentesque hendrerit eros laoreet
                                                                suscipit ultrices.</div>
                                                            <div class="review__date">2 January, 2018</div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ol>
                                            <div class="reviews-list__pagination">
                                                <ul class="pagination justify-content-center">
                                                    <li class="page-item disabled"><a
                                                            class="page-link page-link--with-arrow" href="#"
                                                            aria-label="Previous"><svg
                                                                class="page-link__arrow page-link__arrow--left"
                                                                aria-hidden="true" width="8px" height="13px">
                                                            <use
                                                                xlink:href="userFE/images/sprite.svg#arrow-rounded-left-8x13">
                                                            </use>
                                                            </svg></a></li>
                                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                    <li class="page-item active"><a class="page-link" href="#">2 <span
                                                                class="sr-only">(current)</span></a></li>
                                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                    <li class="page-item"><a class="page-link page-link--with-arrow"
                                                                             href="#" aria-label="Next"><svg
                                                                class="page-link__arrow page-link__arrow--right"
                                                                aria-hidden="true" width="8px" height="13px">
                                                            <use
                                                                xlink:href="userFE/images/sprite.svg#arrow-rounded-right-8x13">
                                                            </use>
                                                            </svg></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <form class="reviews-view__form">
                                        <h3 class="reviews-view__header">Write A Review</h3>
                                        <div class="row">
                                            <div class="col-12 col-lg-9 col-xl-8">
                                                <div class="form-row">
                                                    <div class="form-group col-md-4"><label for="review-stars">Review
                                                            Stars</label> <select id="review-stars"
                                                                              class="form-control">
                                                            <option>5 Stars Rating</option>
                                                            <option>4 Stars Rating</option>
                                                            <option>3 Stars Rating</option>
                                                            <option>2 Stars Rating</option>
                                                            <option>1 Stars Rating</option>
                                                        </select></div>
                                                    <div class="form-group col-md-4"><label for="review-author">Your
                                                            Name</label> <input type="text" class="form-control"
                                                                            id="review-author" placeholder="Your Name"></div>
                                                    <div class="form-group col-md-4"><label for="review-email">Email
                                                            Address</label> <input type="text" class="form-control"
                                                                               id="review-email" placeholder="Email Address"></div>
                                                </div>
                                                <div class="form-group"><label for="review-text">Your Review</label>
                                                    <textarea class="form-control" id="review-text" rows="6"></textarea>
                                                </div>
                                                <div class="form-group mb-0"><button type="submit"
                                                                                     class="btn btn-primary btn-lg">Post Your Review</button></div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- .block-products-carousel -->
            <div class="block block-products-carousel" data-layout="grid-5">
                <jsp:useBean id="pda" class="dal.ProductDAO"/>
                <div class="container">
                    <div class="block-header">
                        <h3 class="block-header__title">Related Products</h3>
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
                        <div class="block-products-carousel__preloader"></div>
                        <div class="owl-carousel">
                            <c:forEach items="${pda.getProductByCategoryID(product.cate.categoryID)}" var="p">
                                <div class="block-products-carousel__column">
                                    <div class="block-products-carousel__cell">
                                        <div class="product-card">                                          
                                            <div class="product-card__image"><a href="product?id=${p.productID}"><img
                                                        src="${p.image}"  alt=""></a></div>
                                            <div class="product-card__info">
                                                <div class="product-card__name"><a href="product?id=${p.productID}">${p.productName}</a></div>
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
                                                <div class="product-card__prices">${p.getPriceFormat()} VND</div>
                                                <div class="product-card__buttons">
                                                    <form action="" method="post">
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
                            </c:forEach>

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