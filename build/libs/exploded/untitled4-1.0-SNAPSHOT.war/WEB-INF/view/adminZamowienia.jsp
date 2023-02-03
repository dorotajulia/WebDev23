<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/tags/form" %>
<style type="text/css">
    <%@include file="bootstrap.css" %>
</style>
<html>
<head>
    <title>TEA&COFFEE</title>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <nav class="navbar navbar-expand-lg navbar-dark fixed-top">

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="navbar-toggler-icon"></span>
                </button> <a class="navbar-brand" href="#">TEA&COFFEE</a>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="navbar-nav">


                        </li>
                    </ul>

                    <ul class="navbar-nav ml-md-auto">
                        <li class="nav-item active">
                            <div>
                                <c:url var="logoutUrl" value="/j_spring_security_logout" />
                                <form action="${logoutUrl}" id="logout" method="post">
                                    <input type="hidden" name="${_csrf.parameterName}"
                                           value="${_csrf.token}" />
                                </form>
                                <a class="nav-link" href="#" onclick="document.getElementById('logout').submit();">Logout</a>
                            </div>
                        </li>
                        <a class="nav-link" href="#" onclick="window.location.href='${pageContext.request.contextPath}/shop/manage';return false;">ADMIN PANEL <span class="sr-only">(current)</span></a>


                    </ul>
                </div>
            </nav>
            <div class="jumbotron bg-dark">
                <br>
<h2>Products:</h2>
<div>
    <table class="table table-striped">
        <tr>
            <th>Data</th>
            <th>Produkty</th>
            <th>Cena</th>
            <th>Status</th>
            <th>Uzytkownik</th>
            <th>Zmien status</th>

            <th></th>

        </tr>
        <c:forEach var="orders" items="${orders}" >
            <tr>
                <td>${orders.date_time}</td>
                <td>${orders.productsString}</td>
                <td>${orders.price}</td>
                <td>${orders.status}</td>
                <td>${orders.username}</td>
                <td>
                    <form:form action="${pageContext.request.contextPath}/orders/complete">
                        <input type="hidden" id="orderId" name="orderId" value="${orders.getId()}"/>
                        <button type="submit" class="btn btn-outline-primary" >Zrealizowane</button>
                    </form:form>
                </td>

            </tr>
        </c:forEach>
    </table>
</div>
            </div>
        </div>
    </div>
</div>


</body>
</html>