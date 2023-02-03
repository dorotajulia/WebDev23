<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    <%@include file="bootstrap.css" %>
</style>
<html>
<head>
    <title>User</title>
</head>
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
<%--                        <a class="nav-link" href="#" onclick="window.location.href='${pageContext.request.contextPath}/shop/user';return false;">Hi, ${username} <span class="sr-only">(current)</span></a>--%>
                        <li class="nav-item active">
                            <a class="nav-link" href="#" onclick="window.location.href='${pageContext.request.contextPath}/shop/user';return false;">Hi, ${username} <span class="sr-only">(current)</span></a>
                        </li>


                    </ul>
                </div>
            </nav>
            <div class="jumbotron bg-dark" align="centre">
                <br>
                <div class="btn-group btn-group-vertical btn-group-lg" role="group" >

                    <button class="btn btn-secondary" type="button" onclick="window.location.href='${pageContext.request.contextPath}/shop/list';return false;">
                        Shop
                    </button>
                    <button class="btn btn-secondary" type="button" onclick="window.location.href='${pageContext.request.contextPath}/cart';return false;">
                        Cart
                    </button>
                    <button class="btn btn-secondary" type="button" onclick="window.location.href='${pageContext.request.contextPath}/orders/userOrderList';return false;">
                        Orders
                    </button>

                </div>


            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <img alt="Bootstrap Image Preview" src="https://images.deepai.org/art-image/631182e5491041d7b0e87855441d12f6/tea-3f703f.jpg" width="200" height="200"/>
            <h2>
                Tea
            </h2>
            <p>
                A single leaf of tea is then mixed with many pieces of tea each, of different parts containing different forms of water, including teas in different varieties. There are several different varieties and they all give different meanings and the tea given at various times is known from time to time at different parts.
            </p>
            <p>
                <a class="btn" href="${pageContext.request.contextPath}/shop/list">Shop here »</a>
            </p>
        </div>
        <div class="col-md-4">
            <img alt="Bootstrap Image Preview" src="https://images.deepai.org/art-image/ffbbdc66e1d54cb1a21cab805027e688/coffee-making.jpg" width="200" height="200"/>
            <h2>
                Coffee
            </h2>
            <p>
                The term goes back to ancient Athens' day when the Romans and Greeks traded it at dinner. And coffee is a powerful, well-known flavor. Most varieties are made of dried beans, which are hard and tend to take weeks to dry when hot, but if you want to give your friends and family an apple, try the red. The fruit is a strong, dark green with a sharp spud, the black and white.
            </p>
            <p>
                <a class="btn" href="${pageContext.request.contextPath}/shop/list">Shop here »</a>
            </p>
        </div>
        <div class="col-md-4">
            <img alt="Bootstrap Image Preview" src="https://images.deepai.org/art-image/0c7ff63c6fdc4cf28f2696bd0cace5b1/coffee-machine-42c358.jpg" width="200" height="200"/>
            <h2>
                Accessories
            </h2>
            <p>
                Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
            </p>
            <p>
                <a class="btn" href="${pageContext.request.contextPath}/shop/list">Shop here »</a>
            </p>
        </div>
    </div>
</div>
</html>
