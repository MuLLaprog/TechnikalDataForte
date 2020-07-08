<%--
  Created by IntelliJ IDEA.
  User: mullaak47
  Date: 12.06.2020
  Time: 19:16
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body class="bg-warning">
<header>
    <nav class="navbar navbar-light bg-warning navbar-expand-md">
        <a class="navbar-brand" href="/machines/machines"><img src="/img/forte.png" width="150" height="50" alt=""
                                                               class="mx-auto d-block"> Maszyny Zakładu Forte</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainmenu"
                aria-controls="mainmenu" aria-expanded="false" aria-label="Przełącznik nawigacji">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mainmenu">
            <ul class="navbar-nav">
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
<main>
    <section class="machines">
        <div class="container">
            <%--             <div class="container-fluid"> lub to wyrzej--%>
            <header class="jumbotron text-center">
                <h1>Maszyny Zakładu Forte</h1>
                <p>W tej sekcji mamy możliwość wyboru maszyny, po wyborze maszyny ukażą się dostepne dokumentacje</p>
            </header>
            <c:forEach var="machines" items="${machine}">
            <div class="row">
                <div class="col-sm-6 col-sm-4 col-xl-3 offset-md-1">
                        ${machines.nameMachine}
                    <figure>
                        <a href="#"><img src="img/ima2.jpg" calss="img-fluid" alt="IMA L2"></a>
                        <figcaption>IMA L2</figcaption>
                    </figure>


                    </c:forEach>


                    <a href="/allDocumentations/${machine.id}">

                    </a>
                    <div></div>

                    <%--                             <img src="cinqueterre.jpg" class="rounded" alt="Cinque Terre" width="304" height="236">--%>



                    <figure>
                        <%--                                 <a href="file:///ścieżka/plik"></a>--%>
                        <%--                                  <a href="http://localhost:8080/machines/allMachines"><img src="ima1.jpg" calss="img-fluid" alt="IMA L1"></a>--%>
                        <a href="file:///home/mullaak47/Obrazy/java.txt"><img src="img/ima1.jpg" calss="img-fluid" alt="IMA L1"></a>

                        <figcaption>IMA L1</figcaption>
                    </figure>


                </div>
                <div class="col-sm-6 col-sm-4 col-xl-3">
                    <figure>
                        <a href="#"><img src="img/ima2.jpg" calss="img-fluid" alt="IMA L2"></a>
                        <figcaption>IMA L2</figcaption>
                    </figure>
                </div>
                <div class="col-sm-6 col-sm-4 col-xl-3">
                    <figure>
                        <a href="#"><img src="img/imacombima.jpg" calss="img-fluid" alt="IMA COMBIMA"></a>
                        <figcaption>IMA COMBIMA</figcaption>
                    </figure>
                </div>
                <div class="col-sm-6 col-sm-4 col-xl-3">
                    <figure>
                        <a href="#"><img src="img/imanovimat.jpg" calss="img-fluid" alt="IMA NOVIMAT"></a>
                        <figcaption>IMA NOVIMAT</figcaption>
                    </figure>
                </div>
                <div class="col-sm-6 col-sm-4 col-xl-3">
                    <figure>
                        <a href="#"><img src="img/cnc.jpg" calss="img-fluid" alt="CNC"></a>
                        <figcaption>CNC</figcaption>
                    </figure>
                </div>
                <div class="col-sm-6 col-sm-4 col-xl-3">
                    <figure>
                        <a href="#"><img src="img/bst100.jpg" calss="img-fluid" alt="BST 100"></a>
                        <figcaption>BST 100</figcaption>
                    </figure>
                </div>
                <div class="col-sm-6 col-sm-4 col-xl-3">
                    <figure>
                        <a href="#"><img src="img/bst500.jpg" calss="img-fluid" alt="BST 500"></a>
                        <figcaption>BST 500</figcaption>
                    </figure>
                </div>
                <div class="col-sm-6 col-sm-4 col-xl-3">
                    <figure>
                        <a href="#"><img src="img/800_2.jpg" calss="img-fluid" alt="800 2"></a>
                        <figcaption>800 2</figcaption>
                    </figure>
                </div>
                <div class="col-sm-6 col-sm-4 col-xl-3">
                    <figure>
                        <a href="#"><img src="img/800_3.jpg" calss="img-fluid" alt="800 3"></a>
                        <figcaption>800 3</figcaption>
                    </figure>
                </div>
                <div class="col-sm-6 col-sm-4 col-xl-3">
                    <figure>
                        <a href="#"><img src="img/800_4.jpg" calss="img-fluid" alt="800 4"></a>
                        <figcaption>800 4</figcaption>
                    </figure>
                </div>
            </div>
        </div>
    </section>
</main>
</body>
</html>
