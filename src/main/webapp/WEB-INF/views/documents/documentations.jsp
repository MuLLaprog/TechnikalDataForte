<%--
  Created by IntelliJ IDEA.
  User: mullaak47
  Date: 17.06.2020
  Time: 01:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<header>
    <nav class="navbar navbar-light bg-warning navbar-expand-md">
            <span class="border border-dark bg-secondary">
                    <a class="navbar-brand" href="/machines/machines"><img src="/img/forte.png" width="150" height="50" alt=""
                                                                              class="mx-auto d-block"> Maszyny Zakładu Forte</a>
            </span>
    <%--        <div style="border-left:1px solid #000000; height: 200px; width: 0"></div>--%>
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
<div class="container">
    <div class="jumbotron text-center">
        <h2>Nazwa maszyny</h2>
        <text>${idMachine.nameMachine}</text>
        <form>
            <div class="form-group">
               <h2>Opis:</h2><br>
               <text>${idMachine.descriptionMachine}</text>
            </div>
        </form>
        <sec:authorize access="hasRole('ADMIN')">
            <div class="form-group">
               <a href="/documents/addDocumentations/${idMachine.id}" class="btn btn-outline-secondary bg-dark">Dodaj dokumentacje</a>
            </div>
        </sec:authorize>
        <table class="table table-dark">
            <tr>
                <th>Dokumentacje Maszyny</th>
                <%--            &nbsp--%>
            </tr>
            <c:forEach var="document" items="${documents}">
                <tr>
                    <td class="col align-self-start">
                        <a class="col align-self-start" href="/filesMachine/${document.nameDocument}" target="_blank">${document.documentation}</a>
                    </td>
                    <sec:authorize access="hasRole('ADMIN')">
                        <td class="col align-self-end">
                            <button type="button" class="btn btn-danger"><a class="text-light" href="/documents/delete/${document.id}/${document.machine.id}">Delete</a></button>
                        </td>
                        <td class="col align-self-end">
                            <button type="button" class="btn btn-primary"><a class="text-light" href="/documents/update/${document.id}/${document.machine.id}">Edit</a></button>
                        </td>
                    </sec:authorize>
                </tr>
            </c:forEach>
        </table>
        <div class="text-center">
            <a href="/machines/machines" class="btn btn-outline-primary bg-dark">Wstecz</a>
        </div>
    </div>
</div>
</body>
</html>
