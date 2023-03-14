<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-sm-2">
    <div class="card bg-light mb-2">
        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
        <ul class="list-group category_block">
            <c:forEach items="${listC}" var="o">
                <li class="list-group-item text-white ${tag == o.categoryID ? "active":""}"><a href="category?categoryID=${o.categoryID}"><i class="fa fa-chevron-right" aria-hidden="true"></i> ${o.name}</a></li>
                </c:forEach>

        </ul>
        <ul class="list-group category_block">
            <div  class="form-check-inline">
                <form class="form-control bg-warning" action="search" method="get">
                    <label class="text-right">Search by price: </label><br/>
                    <select class="form-control-sm bg-light" name="price1">
                        <option value="0">0</option>
                        <option value="20000000">20tr</option>
                        <option value="30000000">30tr</option>
                        <option value="40000000">40tr</option>
                    </select>
                    and
                    <select class="form-control-sm bg-light" name="price2">
                        <option value="20000000">20tr</option>
                        <option value="30000000">30tr</option>
                        <option value="40000000">40tr</option>
                        <option value="999999999">max</option>
                    </select>
                    <input class="btn btn-success" type="submit" value="Search"/>
                </form>
            </div>
            <div class="form-check-inline">
                <form class="form-control bg-warning" action="sort" method="get">
                    <label class="text-right">Sort by price: </label><br/>
                    <input class="form-check-input" type="radio" name="sort" value="asc" checked/>Tăng dần
                    <input class="form-check-input" type="radio" name="sort" value="desc"/>Giảm dần
                    <input class="btn btn-success" type="submit" value="Sort"/>
                </form>
            </div>
        </ul>
    </div>
    <div class="card bg-light mb-2">
        <div class="card-header bg-success text-white text-uppercase"><i class="fa fa-diamond" aria-hidden="true"></i> Best seller product</div>
        <div class="card-body">
            <img class="img-fluid" src="${last.image}" />
            <h5 class="card-title">${last.name}</h5>
            <p class="card-text">${last.title}</p>
            <h5 class="alert alert-success text-center"><i class="fa fa-money" aria-hidden="true"></i> <fmt:formatNumber pattern="#,##0" value="${last.price}"/></h5>
        </div>
    </div>
    <div class="card bg-light mb-2">
        <div class="card-header bg-warning text-white text-uppercase"><i class="fa fa-diamond" aria-hidden="true"></i> The best product</div>
        <div class="card-body">
            <img class="img-fluid" src="${best.image}" />
            <h5 class="card-title">${best.name}</h5>
            <p class="card-text">${best.title}</p>
            <h5 class="alert alert-success text-center"><i class="fa fa-money" aria-hidden="true"></i> <fmt:formatNumber pattern="#,##0" value="${best.price}"/></h5>
        </div>
    </div>
</div>