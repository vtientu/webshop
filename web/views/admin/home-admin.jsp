<%-- 
    Document   : home-admin
    Created on : Oct 9, 2022, 12:42:33 AM
    Author     : Dell
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Acara - Admin</title>
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="adminFE/img/favicon.png">
        <link rel="stylesheet" href="adminFE/vendor/chartist/css/chartist.min.css">
        <link href="adminFE/vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
        <link href="adminFE/vendor/owl-carousel/owl.carousel.css" rel="stylesheet">
        <link href="adminFE/css/style.css" rel="stylesheet">
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&family=Roboto:wght@100;300;400;500;700;900&display=swap"
            rel="stylesheet">
    </head>
    <body>
        <div id="preloader">
            <div class="sk-three-bounce">
                <div class="sk-child sk-bounce1"></div>
                <div class="sk-child sk-bounce2"></div>
                <div class="sk-child sk-bounce3"></div>
            </div>
        </div>
        <div id="main-wrapper">
            <div class="nav-header">
                <a href="adminHome" class="brand-logo">
                    <img class="logo-abbr" src="adminFE/img/logo.png" alt="">
                    <img class="logo-compact" src="adminFE/img/logo-text.png" alt="">
                    <img class="brand-title" src="adminFE/img/logo-text.png" alt="">
                </a>
                <div class="nav-control">
                    <div class="hamburger">
                        <span class="line"></span><span class="line"></span><span class="line"></span>
                    </div>
                </div>
            </div>
            <div class="header">
                <div class="header-content">
                    <nav class="navbar navbar-expand">
                        <div class="collapse navbar-collapse justify-content-between">
                            <div class="header-left">
                                <div class="dashboard_bar">
                                    Dashboard
                                </div>
                            </div>
                            <ul class="navbar-nav header-right">
                                <li class="nav-item dropdown notification_dropdown">
                                    <a class="nav-link  ai-icon" href="javascript:void(0)" role="button"
                                       data-toggle="dropdown">
                                        <svg width="28" height="28" viewBox="0 0 28 28" fill="none"
                                             xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" clip-rule="evenodd"
                                              d="M12.8333 5.91732V3.49998C12.8333 2.85598 13.356 2.33331 14 2.33331C14.6428 2.33331 15.1667 2.85598 15.1667 3.49998V5.91732C16.9003 6.16698 18.5208 6.97198 19.7738 8.22498C21.3057 9.75681 22.1667 11.8346 22.1667 14V18.3913L23.1105 20.279C23.562 21.1831 23.5142 22.2565 22.9822 23.1163C22.4513 23.9761 21.5122 24.5 20.5018 24.5H15.1667C15.1667 25.144 14.6428 25.6666 14 25.6666C13.356 25.6666 12.8333 25.144 12.8333 24.5H7.49817C6.48667 24.5 5.54752 23.9761 5.01669 23.1163C4.48469 22.2565 4.43684 21.1831 4.88951 20.279L5.83333 18.3913V14C5.83333 11.8346 6.69319 9.75681 8.22502 8.22498C9.47919 6.97198 11.0985 6.16698 12.8333 5.91732ZM14 8.16664C12.4518 8.16664 10.969 8.78148 9.87469 9.87581C8.78035 10.969 8.16666 12.453 8.16666 14V18.6666C8.16666 18.8475 8.12351 19.026 8.04301 19.1881C8.04301 19.1881 7.52384 20.2265 6.9755 21.322C6.88567 21.5028 6.89501 21.7186 7.00117 21.8901C7.10734 22.0616 7.29517 22.1666 7.49817 22.1666H20.5018C20.7037 22.1666 20.8915 22.0616 20.9977 21.8901C21.1038 21.7186 21.1132 21.5028 21.0234 21.322C20.475 20.2265 19.9558 19.1881 19.9558 19.1881C19.8753 19.026 19.8333 18.8475 19.8333 18.6666V14C19.8333 12.453 19.2185 10.969 18.1242 9.87581C17.0298 8.78148 15.547 8.16664 14 8.16664Z"
                                              fill="#FE634E" />
                                        </svg>
                                        <div class="pulse-css"></div>
                                    </a>
                                    <div class="dropdown-menu rounded dropdown-menu-right">
                                        <div id="DZ_W_Notification1" class="widget-media dz-scroll p-3 height380">
                                            <ul class="timeline">
                                                <li>
                                                    <div class="timeline-panel">
                                                        <div class="media mr-2">
                                                            <img alt="image" width="50" src="images/avatar/1.jpg">
                                                        </div>
                                                        <div class="media-body">
                                                            <h6 class="mb-1">Dr sultads Send you Photo</h6>
                                                            <small class="d-block">29 July 2020 - 02:26 PM</small>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="timeline-panel">
                                                        <div class="media mr-2 media-info">
                                                            KG
                                                        </div>
                                                        <div class="media-body">
                                                            <h6 class="mb-1">Resport created successfully</h6>
                                                            <small class="d-block">29 July 2020 - 02:26 PM</small>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="timeline-panel">
                                                        <div class="media mr-2 media-success">
                                                            <i class="fa fa-home"></i>
                                                        </div>
                                                        <div class="media-body">
                                                            <h6 class="mb-1">Reminder : Treatment Time!</h6>
                                                            <small class="d-block">29 July 2020 - 02:26 PM</small>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="timeline-panel">
                                                        <div class="media mr-2">
                                                            <img alt="image" width="50" src="images/avatar/1.jpg">
                                                        </div>
                                                        <div class="media-body">
                                                            <h6 class="mb-1">Dr sultads Send you Photo</h6>
                                                            <small class="d-block">29 July 2020 - 02:26 PM</small>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="timeline-panel">
                                                        <div class="media mr-2 media-danger">
                                                            KG
                                                        </div>
                                                        <div class="media-body">
                                                            <h6 class="mb-1">Resport created successfully</h6>
                                                            <small class="d-block">29 July 2020 - 02:26 PM</small>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="timeline-panel">
                                                        <div class="media mr-2 media-primary">
                                                            <i class="fa fa-home"></i>
                                                        </div>
                                                        <div class="media-body">
                                                            <h6 class="mb-1">Reminder : Treatment Time!</h6>
                                                            <small class="d-block">29 July 2020 - 02:26 PM</small>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <a class="all-notification" href="javascript:void(0)">See all notifications <i
                                                class="ti-arrow-right"></i></a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown header-profile">
                                    <a class="nav-link" href="javascript:void(0)" role="button" data-toggle="dropdown">
                                        <img src="${account.pro.avatar}" width="20" alt="" />
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <c:if test="${account == null}">
                                            <a href="adminlogin" class="dropdown-item ai-icon">
                                                <svg id="icon-user1" xmlns="http://www.w3.org/2000/svg" class="text-primary"
                                                     width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                     stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                                <circle cx="12" cy="7" r="4"></circle>
                                                </svg>
                                                <span class="ml-2">Login</span>
                                            </a>
                                        </c:if>
                                        <c:if test="${account != null}">
                                            <a href="adminProfile" class="dropdown-item ai-icon">
                                                <svg id="icon-user1" xmlns="http://www.w3.org/2000/svg" class="text-primary"
                                                     width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                     stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                                <circle cx="12" cy="7" r="4"></circle>
                                                </svg>
                                                <span class="ml-2">Profile </span>
                                            </a>

                                            <a href="adminLogout" class="dropdown-item ai-icon">
                                                <svg id="icon-logout" xmlns="http://www.w3.org/2000/svg" class="text-danger"
                                                     width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                     stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                                                <polyline points="16 17 21 12 16 7"></polyline>
                                                <line x1="21" y1="12" x2="9" y2="12"></line>
                                                </svg>
                                                <span class="ml-2">Logout </span>
                                            </a>
                                        </c:if>

                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            <div class="deznav">
                <div class="deznav-scroll">
                    <ul class="metismenu" id="menu">
                        <li><a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
                                <i class="flaticon-381-networking"></i>
                                <span class="nav-text">Dashboard</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="adminHome">Dashboard</a></li>
                                <li><a href="reviews.html">Reviews</a></li>
                            </ul>
                        </li>
                        <li><a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
                                <i class="flaticon-381-layer-1"></i>
                                <span class="nav-text">Pages</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="adminProfile">Profile</a></li>
                                <li><a href="adminlogin">Login</a></li>
                                <li><a href="changePassword">Change pass</a></li>
                                <li><a href="adminLogout">Logout</a></li>
                            </ul>
                        </li>
                        <li><a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
                                <i class="flaticon-381-notepad"></i>
                                <span class="nav-text">Shop</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="productList">Product List</a></li>    
                                <li><a href="categoryList">Category List</a></li> 
                                <li><a href="producerList">Producer List</a></li>
                                <li><a href="customer">Customers</a></li>
                                <li><a href="order">Order</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="content-body">
                <!-- row -->
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-6 col-xxl-8">
                            <div class="row">
                                <div class="col-xl-12 col-md-6">
                                    <div class="card">
                                        <div class="card-header border-0 pb-0">
                                            <h4 class="fs-20">Doanh Thu</h4>
                                            <form action="" method="get">
                                                <select name="month" class="form-control style-1 default-select " onchange="this.form.submit()">
                                                    <c:set var="t" value="12"/>
                                                    <c:forEach begin="1" end="12" var="i">
                                                        <option value="${t}" ${month == t ? 'selected' : ''}>Tháng ${t}</option>
                                                        <c:set var="t" value="${t - 1}"/>
                                                    </c:forEach>
                                                </select>
                                                <select name="year" class="form-control style-1 default-select " onchange="this.form.submit()">
                                                    <c:forEach begin="0" end="5" var="i">
                                                        <option value="${curYear - i}" ${year == curYear - i ? 'selected' : ''}>${curYear - i}</option>
                                                    </c:forEach>
                                                </select>
                                            </form>
                                        </div>
                                        <div class="card-body">
                                            <span class="fs-35 text-black font-w600">${totalMoneyOrder} VND
                                                <svg class="ml-3" width="19" height="12" viewBox="0 0 19 12"
                                                     fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M2.00401 11.1924C0.222201 11.1924 -0.670134 9.0381 0.589795 7.77817L7.78218 0.585786C8.56323 -0.195262 9.82956 -0.195262 10.6106 0.585786L17.803 7.77817C19.0629 9.0381 18.1706 11.1924 16.3888 11.1924H2.00401Z"
                                                    fill="#33C25B" />
                                                </svg>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-xl-6 col-xxl-8">
                            <div class="row">
                                <div class="col-xl-6 col-md-6">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="d-flex align-items-end">
                                                <div>
                                                    <p class="fs-20 mb-3">Order</p>
                                                    <jsp:useBean id="od" class="dal.OrderDAO"/>
                                                    <span class="fs-35 text-black font-w600">${od.count()}
                                                        <svg class="ml-3" width="19" height="12" viewBox="0 0 19 12"
                                                             fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                            d="M2.00401 11.1924C0.222201 11.1924 -0.670134 9.0381 0.589795 7.77817L7.78218 0.585786C8.56323 -0.195262 9.82956 -0.195262 10.6106 0.585786L17.803 7.77817C19.0629 9.0381 18.1706 11.1924 16.3888 11.1924H2.00401Z"
                                                            fill="#33C25B" />
                                                        </svg>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-md-6">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div>
                                                    <p class="fs-20 mb-3">Total Product</p>
                                                    <jsp:useBean id="pda" class="dal.ProductDAO"/>
                                                    <span class="fs-35 text-black font-w600">${pda.count()}
                                                        <svg class="ml-3" width="19" height="12" viewBox="0 0 19 12"
                                                             fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                            d="M2.00401 11.1924C0.222201 11.1924 -0.670134 9.0381 0.589795 7.77817L7.78218 0.585786C8.56323 -0.195262 9.82956 -0.195262 10.6106 0.585786L17.803 7.77817C19.0629 9.0381 18.1706 11.1924 16.3888 11.1924H2.00401Z"
                                                            fill="#33C25B" />
                                                        </svg>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-6">
                            <div class="card" id="sales-revenue">
                                <div class="card-header pb-0 d-block d-sm-flex border-0">
                                    <h3 class="fs-20 text-black mb-0">Sales Revenue</h3>
                                    <div class="card-action revenue-tabs mt-3 mt-sm-0">
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" data-toggle="tab" href="#monthly"
                                                   role="tab" aria-selected="false">
                                                    Monthly
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#weekly" role="tab"
                                                   aria-selected="false">
                                                    Weekly
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#today" role="tab"
                                                   aria-selected="true">
                                                    Daily
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="user" role="tabpanel">
                                            <canvas id="revenue" class="chartjs"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <div class="card">
                                <div class="card-header border-0 pb-sm-0 pb-5">
                                    <h4 class="fs-20">Order</h4>
                                    <div class="dropdown custom-dropdown mb-0">
                                        <div data-toggle="dropdown">
                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                 xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M12 12.9999C12.5523 12.9999 13 12.5522 13 11.9999C13 11.4477 12.5523 10.9999 12 10.9999C11.4477 10.9999 11 11.4477 11 11.9999C11 12.5522 11.4477 12.9999 12 12.9999Z"
                                                stroke="#7E7E7E" stroke-width="2" stroke-linecap="round"
                                                stroke-linejoin="round" />
                                            <path
                                                d="M12 5.99994C12.5523 5.99994 13 5.55222 13 4.99994C13 4.44765 12.5523 3.99994 12 3.99994C11.4477 3.99994 11 4.44765 11 4.99994C11 5.55222 11.4477 5.99994 12 5.99994Z"
                                                stroke="#7E7E7E" stroke-width="2" stroke-linecap="round"
                                                stroke-linejoin="round" />
                                            <path
                                                d="M12 19.9999C12.5523 19.9999 13 19.5522 13 18.9999C13 18.4477 12.5523 17.9999 12 17.9999C11.4477 17.9999 11 18.4477 11 18.9999C11 19.5522 11.4477 19.9999 12 19.9999Z"
                                                stroke="#7E7E7E" stroke-width="2" stroke-linecap="round"
                                                stroke-linejoin="round" />
                                            </svg>
                                        </div>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="javascript:void(0);">Details</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body"> 
                                    <c:set var="order" value="${od.order}"/>
                                    <div class="event-bx owl-carousel">
                                        <c:forEach begin="0" end="4" var="i">
                                            <div class="items">
                                                <div class="image-bx">
                                                    <img src="images/events/3.png" alt="">
                                                    <div class="info">
                                                        <p class="fs-18 font-w600"><a href="invoice?id=${order.get(i).orderID}" class="text-black">
                                                                ${order.get(i).account.pro.getFullName()}</a></p>
                                                        <span class="fs-14 text-black d-block mb-3">${order.get(i).account.pro.address}</span>
                                                        <p class="fs-12"></p>

                                                        <li>${order.get(i).getPriceFormat()} VND</li>
                                                        <li></li>
                                                        <li>${order.get(i).getDate()}</li>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="adminFE/vendor/global/global.min.js"></script>
        <script src="adminFE/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
        <script src="adminFE/vendor/chart.js/Chart.bundle.min.js"></script>
        <script src="adminFE/js/custom.min.js"></script>
        <script src="adminFE/js/deznav-init.js"></script>
        <script src="adminFE/vendor/owl-carousel/owl.carousel.js"></script>

        <!-- Chart piety plugin files -->
        <script src="adminFE/vendor/peity/jquery.peity.min.js"></script>

        <!-- Apex Chart -->
        <script src="adminFE/vendor/apexchart/apexchart.js"></script>

        <!-- Dashboard 1 -->
        <script src="adminFE/js/dashboard/dashboard-1.js"></script>


        <script>
                                                    function carouselReview() {
                                                        /*  event-bx one function by = owl.carousel.js */
                                                        jQuery('.event-bx').owlCarousel({
                                                            loop: true,
                                                            margin: 30,
                                                            nav: true,
                                                            center: true,
                                                            autoplaySpeed: 3000,
                                                            navSpeed: 3000,
                                                            paginationSpeed: 3000,
                                                            slideSpeed: 3000,
                                                            smartSpeed: 3000,
                                                            autoplay: false,
                                                            navText: ['<i class="fa fa-caret-left" aria-hidden="true"></i>', '<i class="fa fa-caret-right" aria-hidden="true"></i>'],
                                                            dots: true,
                                                            responsive: {
                                                                0: {
                                                                    items: 1
                                                                },
                                                                720: {
                                                                    items: 2
                                                                },

                                                                1150: {
                                                                    items: 3
                                                                },

                                                                1200: {
                                                                    items: 2
                                                                },
                                                                1749: {
                                                                    items: 3
                                                                }
                                                            }
                                                        })
                                                    }
                                                    jQuery(window).on('load', function () {
                                                        setTimeout(function () {
                                                            carouselReview();
                                                        }, 1000);
                                                    });
        </script>
    </body>

</html>