<%-- 
    Document   : statistic
    Created on : Nov 4, 2022, 1:05:01 PM
    Author     : Thang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {

                var data = google.visualization.arrayToDataTable([
                    ['Languague', 'Speakers (in millions)'],
                <c:forEach items="${list1}" var="i">
                    ['${i.name}',${i.numCate}],
                </c:forEach>
                ]);

                var options = {
                    title: 'Statistic Product By Category'
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechart'));

                chart.draw(data, options);
            }
        </script>

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
                            <div id="piechart" style="width: 900px; height: 500px;"></div>
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

