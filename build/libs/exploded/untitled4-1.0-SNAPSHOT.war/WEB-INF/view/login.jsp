<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    <%@include file="bootstrap.css" %>
</style>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <title>Logowanie</title>
</head>
<body>
<div align="center">
<h3>Logowanie</h3>
</div>
<c:if test="${(param.error != null) && (not empty SPRING_SECURITY_LAST_EXCEPTION)}">
    <p><c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/></p>
</c:if>
<form:form method="post">
    <div align="center">
    <table style="text-align:center">
        <tbody>
        <tr>
            <td><label for="username">Nazwa:</label></td>
            <td><input type="text" id="username" name="username" class="formcontrol"/></td>
        </tr>
        <tr>
            <td><label for="password">Hasło:</label></td>
            <td><input type="password" id="password" name="password"
                       class="form-control" /></td>
        </tr>
        <tr align="center">
            <td align="center">
                <div align="center">
                <button type="submit" class="btn btn-outline-primary" >Zaloguj</button>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
    </div>
</form:form>
<div align="center">
<a href="${pageContext.request.contextPath}/register "> register </a>
</div>
</body>
</html>
