<%--
  Created by IntelliJ IDEA.
  User: mullaak47
  Date: 08.06.2020
  Time: 19:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Production Machines</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body class="bg-warning">
<%--                            class="d-inline-block mr-1 align-bottom"--%>
<header>
    <nav class="navbar navbar-light bg-warning navbar-expand-md">
        <sec:authorize access="hasRole('ADMIN')">
            <span class="border border-dark bg-info">
                <a class="navbar-brand" href="/users/users"><img src="/img/forte.png" width="150" height="50" alt=""
                                                                       class="mx-auto d-block"> Użytkownicy Bazy Danych</a>
            </span>
        </sec:authorize>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainmenu"
                aria-controls="mainmenu" aria-expanded="false" aria-label="Przełącznik nawigacji">
<%--            <span class="navbar-toggler-icon"></span>--%>
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
        <h1>Maszyny Zakładu Forte</h1>
        <p>W tej sekcji mamy możliwość wyboru maszyny, po wyborze maszyny ukażą się dostepne dokumentacje</p>
    </header>
    <table class="table table-dark">
        <tr>
            <th>Nazwa Maszyny</th>
<%--            &nbsp--%>
        </tr>
        <c:forEach var="machine" items="${machine}">
            <tr>
                <td class="col align-self-start">
                    <a href="/documents/idMachine/${machine.id}">${machine.nameMachine}</a>
                </td>
                <sec:authorize access="hasRole('ADMIN')">
                    <td class="col align-self-end">
                        <button type="button" class="btn btn-danger"><a class="text-light" href="/machines/delete/${machine.id}">Delete</a></button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-primary"><a class="text-light" href="/machines/update/${machine.id}">Edit</a></button>
                    </td>
                </sec:authorize>
            </tr>
        </c:forEach>
    </table>
    <sec:authorize access="hasRole('ADMIN')">
        <div class="text-center">
            <a href="/machines/addMachine/" class="btn btn-outline-secondary bg-dark">Dodaj maszyne</a>
        </div>
    </sec:authorize>
</div>
</body>
</html>
