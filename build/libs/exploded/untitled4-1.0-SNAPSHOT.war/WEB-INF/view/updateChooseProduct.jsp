<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style type="text/css">
    <%@include file="bootstrap.css" %>
</style>
<%--<input type="button" value="Admin Panel" onclick="window.location.href='${pageContext.request.contextPath}/shop/manage';return false;" />--%>
<html>
<head>
    <title>Update Product</title>
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
<h3>Choose a product to update</h3>
<form:form action="updateForm" modelAttribute="productToUpDateID" method="POST">
<br>
    Select a Product:
    <select name="productToUpDateID">
        <c:forEach items="${products}" var="products">
            <option value="${products.getId()}">
                    ${products.getId()} : ${products.nazwa}
            </option>
        </c:forEach>
    </select>


    <br/><br/>
    <input type="submit" name="submit" class="btn btn-outline-primary" value="Update"  />
</form:form>
<a href="${pageContext.request.contextPath}/shop/manage "> return </a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
