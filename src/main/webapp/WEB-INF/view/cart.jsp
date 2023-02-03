<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
    <%@include file="bootstrap.css" %>
</style>
<%--<input type="button" value="my profile" onclick="window.location.href='${pageContext.request.contextPath}/books/user';return false;" />--%>

<%--<a href="${pageContext.request.contextPath}/books/list " align="left"> return to booklist </a>--%>
<%--<c:url var="logoutUrl" value="/j_spring_security_logout" />--%>
<%--<form action="${logoutUrl}" id="logout" method="post" >--%>
<%--    <input type="hidden" name="${_csrf.parameterName}"--%>
<%--           value="${_csrf.token}" />--%>
<%--</form>--%>
<%--<a href="#" onclick="document.getElementById('logout').submit();">Logout</a>--%>
<html>
<head>
    <title>Cart</title>
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
            <div class="jumbotron bg-dark">
                <br>
<h2>CART:</h2>
<c:set var="total" value="${0.00}"/>
<c:choose>
<c:when test="${not empty products}">
<div>

    <table class="table table-striped">
        <tbody>
        <tr>
            <th>Nazwa</th>
            <th>Cena</th>
            <th>Kategoria</th>

            <th> </th>

        </tr>

        <c:forEach var="products" items="${products}">
            <tr>
                <td>${products.nazwa}</td>
                <td>${products.cena}</td>
                <c:set var="total" value="${total + products.cena}" />
                <td>${products.kategoria.nazwa}</td>
<%--                <td><c:out value="${book.authorsToString()}"/></td>--%>
                <td>
                    <form:form action="${pageContext.request.contextPath}/cart/delete">
                        <input type="hidden" id="bookId" name="bookId" value="${products.getId()}"/>
                        <button type="submit" class="btn btn-outline-primary" >Usun</button>
                    </form:form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

<%--    </table>--%>
</div>
</c:when>
<c:otherwise>
<div>
    <h2>cart is empty</h2>
</div>
</c:otherwise>
</c:choose>
<div>
    <h3>Suma zamowienia:</h3>
    <h4><fmt:formatNumber value="${total}" minFractionDigits="2" maxFractionDigits="2"/> pln</h4>
    <form:form action="${pageContext.request.contextPath}/cart/createOrder">
        <input type="hidden" id="total" name="total" value="${total}"/>
        <button type="submit" class="btn btn-outline-primary" >Zloz zamowienie</button>
    </form:form>
</div>
            </div>
        </div>
    </div>
</div>
</body>
</html>