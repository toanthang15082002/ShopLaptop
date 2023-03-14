<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--begin of menu-->
<script type="text/javascript">
    function show() {
        var x = document.getElementById("profile");
        if (x.style.display == "none") {
            x.style.display = "block";
        } else {
            x.style.display = "none";
        }
    }
</script>
<nav class="navbar navbar-expand-md navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="home"><i class="fa fa-laptop" aria-hidden="true"></i> Laptop</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <form action="search" method="post" class="form-inline my-2 my-lg-0 ">
                <div class="input-group input-group-sm">
                    <input value="${txtSearch}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search..."/>
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                <c:set var="size" value="${sessionScope.size}"/>
                <a class="btn btn-success btn-sm ml-3" href="cart.jsp">
                    <i class="fa fa-shopping-cart"></i> Cart
                    <span class="badge badge-light">${size}</span>
                </a>
            </form>
        </div>
        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav m-10">
                <c:if test="${sessionScope.acc.role == true}">
                    <li class="nav-item">
                        <a class="nav-item btn btn-success" href="statistic">Statistic</a>
                    </li>
                </c:if>
                &nbsp;&nbsp;&nbsp;
                <c:if test="${sessionScope.acc.role == true}">
                    <li class="nav-item">
                        <a class="nav-item btn btn-success" href="manager">Manager Product</a>
                    </li>
                </c:if>
                &nbsp;&nbsp;&nbsp;
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <p class="nav-tabs btn btn-success" href="#">Hello ${sessionScope.acc.name}</p>
                    </li>
                </c:if>
                &nbsp;&nbsp;&nbsp;
                <c:if test="${sessionScope.acc!=null}">
                    <li class="nav-item">
                        <a class="nav-item btn btn-success" href="#" onclick="show()">Profile</a>
                    </li>
                </c:if>
                &nbsp;&nbsp;&nbsp;
                <c:if test="${sessionScope.acc!=null}">
                    <li class="nav-item">
                        <a class="nav-item btn btn-success" href="login.jsp">Change password</a>
                    </li>
                </c:if>
                &nbsp;&nbsp;&nbsp;
                <c:if test="${sessionScope.acc == null}">
                    <li class="nav-item">
                        <a class="nav-item btn btn-warning" href="login.jsp"> <i class="fa fa-sign-in" aria-hidden="true"></i> Login</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-item btn btn-warning" href="logout" action="logout" method="post"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a>
                    </li> 
                </c:if>
            </ul>
        </div>
    </div>
</nav>
<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">Siêu thị Laptop chất lượng cao</h1>
        <p class="lead text-muted mb-0">Uy tín tạo nên thương's hiệu</p>
    </div>
    <div id="profile" style="display: none">
        Username: ${sessionScope.acc.username}
        <br/>
        Role: ${sessionScope.acc.role}
        <br/>
        Name: ${sessionScope.acc.name}                
    </div>
</section>
<!--end of menu-->
