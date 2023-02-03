<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/tags/form" %>
<style type="text/css">
    <%@include file="bootstrap.css" %>
</style>
<%--<div class="navbar">--%>

<%--</div>--%>
<%--<input type="button" value="my profile" onclick="window.location.href='${pageContext.request.contextPath}/books/user';return false;" />--%>

<%--<a href="${pageContext.request.contextPath}/books/list " align="left"> return to booklist </a>--%>
<%--<c:url var="logoutUrl" value="/j_spring_security_logout" />--%>
<%--<form action="${logoutUrl}" id="logout" method="post">--%>
<%--    <input type="hidden" name="${_csrf.parameterName}"--%>
<%--           value="${_csrf.token}" />--%>
<%--</form>--%>
<%--<a href="#" onclick="document.getElementById('logout').submit();">Logout</a>--%>
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

                        <li class="nav-item active">
                            <a class="nav-link" href="#" onclick="window.location.href='${pageContext.request.contextPath}/shop/list';return false;">Shop <span class="sr-only">(current)</span></a>
                        </li>
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
                        <a class="nav-link" href="#" onclick="window.location.href='${pageContext.request.contextPath}/shop/user';return false;">My Profile<span class="sr-only">(current)</span></a>


                    </ul>
                </div>
            </nav>
            <div class="jumbotron bg-dark" >
                <br>
<h2>Zamowienia:</h2>
<div>
    <table class="table table-striped">
        <tr>
            <th>Data</th>
            <th>Produkty</th>
            <th>Cena</th>
            <th>Status</th>


        </tr>
        <c:forEach var="orders" items="${orders}" >
            <tr>
                <td>${orders.date_time}</td>
                <td>${orders.productsString}</td>
                <td>${orders.price}</td>
                <td>${orders.status}</td>

            </tr>
        </c:forEach>
    </table>
</div>
            </div>
        </div>
    </div>
</div>

<%--<div>--%>
<%--    <input type="button" value="Add Book"--%>
<%--           onclick="window.location.href='formadd';return false;" />--%>
<%--</div>--%>
</body>
</html>