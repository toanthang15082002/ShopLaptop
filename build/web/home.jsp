<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    
                </div>
            </div>
            <div class="container-fluid">

                <div class="row">

                <jsp:include page="left.jsp"></jsp:include>
                    <div class="col-sm-9">
                        <div id="content" class="row">
                        <c:forEach items="${listPaging}" var="o">
                            <div class="product col-12 col-md-6 col-lg-2">
                                <div class="card">
                                    <form action="" method="post">
                                        <img class="card-img-top" src="${o.image}" alt="Card image cap">
                                        <div class="card-body">
                                            <h4 class="card-title show_txt"><a href="detail?pid=${o.id}" title="View Product">${o.name}</a></h4>
                                            <p class="card-text show_txt">${o.title}</p>
                                            <div class="row">
                                                <div class="col">
                                                    <p class="btn btn-info btn-block"><i class="fa fa-money" aria-hidden="true"></i> <fmt:formatNumber pattern="#,##0" value="${o.price}" /> VND</p>
                                                </div>
                                                <div class="col">
                                                    <input type="text" name="id" value="${o.id}" hidden=""/>
                                                    <input type="text" name="quantity" value="1" hidden=""/>
                                                    <input type="submit" value="Buy" class="btn btn-success btn-block"/>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <c:forEach begin="1" end="${endPage}" var="i">
                        <li class="page-item ${number == i ? "active":""}">
                            <a class="page-link" href="home?index=${i}">${i}</a>
                        </li>
                    </c:forEach>
                </ul>
            </nav>

        </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>

