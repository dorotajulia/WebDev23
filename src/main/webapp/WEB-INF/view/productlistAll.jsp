
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/tags/form" %>
<style type="text/css">
    <%@include file="bootstrap.css" %>
</style>
<%--<input type="button" value="my profile" onclick="window.location.href='${pageContext.request.contextPath}/books/user';return false;" />--%>

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
                            <th>Id</th>
                            <th>Nazwa</th>
                            <th>Opis</th>
                            <th>Cena</th>
                            <th>Kategoria</th>



                        </tr>
                        <c:forEach var="produkty" items="${produkty}" >
                            <tr>
                                <td>${produkty.id}</td>
                                <td>${produkty.nazwa}</td>
                                <td>${produkty.opis}</td>
                                <td>${produkty.cena}</td>
                                <td>${produkty.kategoria.nazwa}</td>


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
