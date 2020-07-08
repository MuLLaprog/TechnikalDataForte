<%--
  Created by IntelliJ IDEA.
  User: mullaak47
  Date: 20.06.2020
  Time: 00:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <title>Dodanie Maszyny</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body class="bg-warning">
<header>
    <nav class="navbar navbar-light bg-warning navbar-expand-md">
        <span class="border border-dark bg-secondary">
            <a class="navbar-brand" href="/machines/machines"><img src="/img/forte.png" width="150" height="50" alt=""
                                                                   class="mx-auto d-block"> Maszyny Zakładu Forte</a>
        </span>
        <sec:authorize access="hasRole('ADMIN')">
            <span class="border border-dark bg-info">
                <a class="navbar-brand" href="/users/users"><img src="/img/forte.png" width="150" height="50" alt=""
                                                                 class="mx-auto d-block"> Użytkownicy Bazy Danych</a>
            </span>
        </sec:authorize>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainmenu"
                aria-controls="mainmenu" aria-expanded="false" aria-label="Przełącznik nawigacji">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse text-right" id="mainmenu">
            <ul class="nav navbar-nav ml-auto">
                <li class="nav-item">
                    <form action="<c:url value="/logout"/>" method="post">
                        <input class="fa fa-id-badge" type="submit" value="Wyloguj">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                </li>
            </ul>
        </div>
    </nav>
</header>
<div class="row justify-content-center text-center">
    <div class="jumbotron">
        <form:form method="post" modelAttribute="document" enctype="multipart/form-data">
            <form:hidden path="machine.id"/>
            <label for="documantationId">Nazwa dokumentacji: </label><br>
            <form:input type="text" path="documentation" id="documantationId"/><br>
            <form:errors path="documentation"/><br>
            <label>Plik:</label><br>
            <input type="file" name="file"/><br/><br/>
            <div><br></div>
            <input type="submit" value="Dodaj">
        </form:form>
    </div>
</div>
<div class="text-center">
    <a href="/documents/idMachine/${machineId}" class="btn btn-outline-primary bg-dark">Wstecz</a>
</div>
</body>
</html>
