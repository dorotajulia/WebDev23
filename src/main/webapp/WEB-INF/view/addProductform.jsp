<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
    <%@include file="bootstrap.css" %>
</style>
<%--<input type="button" value="Admin Panel" onclick="window.location.href='${pageContext.request.contextPath}/shop/manage';return false;" />--%>
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
ADD PRODUCT
<form:form action="saveProduct" modelAttribute="product" method="POST">
<table>
    <tbody>

    <tr>
        <td><label>nazwa:</label></td>
        <td><form:input path="nazwa" /></td>
    </tr>
    <tr>
        <td><label>opis:</label></td>
        <td><form:input path="opis" /></td>
    </tr>


    <tr>
        <td><label>cena:</label></td>
        <td><form:input path="cena" /></td>
    </tr>


    <tr>
        <td><label></label></td>
        <td><input type="submit" value="Save" class="save" /></td>
    </tr>
    </tbody>
</table>
</form:form>

<p>
 <a href="${pageContext.request.contextPath}/shop/manage "> return </a>
</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>