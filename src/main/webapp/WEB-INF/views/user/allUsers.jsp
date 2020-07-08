<%--
  Created by IntelliJ IDEA.
  User: mullaak47
  Date: 24.06.2020
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Production Machines</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body class="bg-warning">
<header>
    <nav class="navbar navbar-light bg-warning navbar-expand-md">
         <span class="border border-dark bg-secondary">
                    <a class="navbar-brand" href="/machines/machines"><img src="/img/forte.png" width="150" height="50" alt=""
                                                                           class="mx-auto d-block"> Maszyny Zakładu Forte</a>
         </span>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainmenu"
                aria-controls="mainmenu" aria-expanded="false" aria-label="Przełącznik nawigacji">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse text-right" id="mainmenu">
            <ul class="nav navbar-nav ml-auto">
                <li class="nav-item">
                    <form action="<c:url value="/logout"/>" method="post">
                        <input type="submit" value="Wyloguj">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                </li>
            </ul>
        </div>
    </nav>
</header>
<div class="container">
    <header class="jumbotron text-center">
        <h1>Użytkownicy Bazy Danych</h1>
    </header>
    <table class="table table-info">
        <c:forEach var="users" items="${user}">
            <tr>
                <td class="col align-self-start">
                    ${users.username}
                </td>
                <td class="col align-self-end">
                    <button type="button" class="btn btn-danger"><a class="text-light" href="/users/delete/${users.id}">Delete</a></button>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="text-center">
        <a href="/machines/machines" class="btn btn-outline-primary bg-dark">Wstecz</a>
    </div>
</div>
</body>
</html>
