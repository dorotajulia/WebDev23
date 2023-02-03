<%--
  Created by IntelliJ IDEA.
  User: dorot
  Date: 08.07.2022
  Time: 02:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    <%@include file="bootstrap.css" %>
</style>
<html>
<head>
    <title>Manage Inventory</title>
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
<h1>Store Manager</h1>
<div><h3>Products</h3></div>
<div>
    <input type="button" class="btn btn-secondary" value="Add Product"
           onclick="window.location.href='formadd';return false;" />
</div>
<div>
    <input type="button" class="btn btn-secondary" value="Remove Product"
           onclick="window.location.href='deleteForm';return false;" />
</div>
<div>
    <input type="button" class="btn btn-secondary" value="Update Product"
           onclick="window.location.href='chooseProductToUpdate';return false;" />
</div>
<div>
    <input type="button" class="btn btn-secondary" value="See all products"
           onclick="window.location.href='all';return false;" />
</div>
<div><h3>Orders</h3></div>
<div>
    <input type="button" value="See all orders" class="btn btn-secondary"
           onclick="window.location.href='${pageContext.request.contextPath}/orders/adminOrderList';return false;" />
</div>
            </div>
        </div>
    </div>
</div>
</body>
</html>


