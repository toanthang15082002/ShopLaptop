<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi" class="h-100">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <jsp:include page="menu.jsp"></jsp:include>        
            <main role="main">
                <div class="container mt-4">
                    <div id="thongbao" class="alert alert-danger d-none face" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <h1 class="text-center">Giỏ hàng</h1>
                    <div class="row">
                        <div class="col col-md-12">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Ảnh đại diện</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Số lượng</th>
                                        <th>Đơn giá</th>
                                        <th>Thành tiền</th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                            <c:set var="o" value="${sessionScope.cart}"/>
                            <c:set var="t" value="0"/>

                            <tbody id="datarow">
                                <c:forEach items="${o.item}" var="i">
                                    <c:set var="t" value="${t+1}"/>
                                    <tr>
                                        <td>${t}</td>
                                        <td>
                                            <img style="width: 100px" src="${i.product.image}" class="hinhdaidien">
                                        </td>
                                        <td>${i.product.name}</td>
                                        <td class="text-right">
                                            <a href="process?num=-1&id=${i.product.id}" class="btn btn-success">-</a>
                                            <input type="text" readonly="" value="${i.quantity}"/>
                                            <a href="process?num=1&id=${i.product.id}" class="btn btn-success">+</a>
                                        </td>
                                        <td class="text-right"><fmt:formatNumber pattern="#,##0" value="${i.product.price}"/></td>
                                        <td class="text-right"><fmt:formatNumber pattern="#,##0" value="${i.product.price*i.quantity}"/></td>
                                        <td>
                                            <form action="process" method="post">
                                                <input type="hidden" name="id" value="${i.product.id}"/>
                                                <input type="submit" value="Delete" class="btn btn-danger"/>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>   
                            </tbody>
                        </table>
                            <h3 class="bloc_left_price">Total amount: <fmt:formatNumber pattern="#,##0" value="${o.amount}" />VND</h3>
                        <form action="pay" method="get">
                            <a href="home" class="btn btn-warning btn-md"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbsp;Quay về trang chủ</a>
                            <input type="submit" value="Pay" class="btn btn-success btn-md"/>
                        </form>
                    </div>
                </div>
            </div>
            <!-- End block content -->
        </main>

        <!-- footer -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- end footer -->

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="../vendor/jquery/jquery.min.js"></script>
        <script src="../vendor/popperjs/popper.min.js"></script>
        <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Custom script - Các file js do mình tự viết -->
        <script src="../assets/js/app.js"></script>

    </body>

</html>
