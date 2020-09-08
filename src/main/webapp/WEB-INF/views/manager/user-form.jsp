<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="BTZ Management System">
    <meta name="author" content="Emilian Bucewka">
    <title>BTZ Management System</title>
    <link href="<spring:url value="/../../vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <link href="<spring:url value="/../../css/sb-admin-2.min.css"/>" rel="stylesheet">
</head>

<body class="bg-gradient-info">

<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                <div class="col-lg-7">
                    <div class="p-5">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">Dodaj nowego pracownika</h1>
                        </div>
                        <form:form modelAttribute="user" method="post">
                            <div class="card shadow mb-4">
                                <a href="#personalDataForm" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
                                    <h6 class="m-0 font-weight-bold text-primary">Dane osobowe</h6>
                                </a>
                                <div class="collapse show" id="personalDataForm">
                                    <div class="card-body">
                                        <div class="form-group row">
                                            <div class="col-sm-6 mb-3 mb-sm-0">
                                                <form:label path="firstName">Imię</form:label>
                                                <form:input path="firstName" type="text" class="form-control form-control-user"
                                                            placeholder="Imię"/>
                                                <form:errors path="firstName"/>
                                            </div>
                                            <div class="col-sm-6">
                                                <form:label path="lastName">Nazwisko</form:label>
                                                <form:input path="lastName" type="text" class="form-control form-control-user"
                                                            placeholder="Nazwisko"/>
                                                <form:errors path="lastName"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <form:label path="dateOfBirth">Data urodzenia</form:label>
                                            <form:input path="dateOfBirth" type="date" class="form-control form-control-employee"/>
                                            <form:errors path="dateOfBirth"/>
                                        </div>
                                        <div class="form-group">
                                            <form:label path="email">Adres e-mail</form:label>
                                            <form:input path="email" type="email" class="form-control form-control-user"
                                                        placeholder="Adres e-mail"/>
                                            <form:errors path="email"/>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card shadow mb-4">
                                <a href="#addressDataForm" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
                                    <h6 class="m-0 font-weight-bold text-primary">Dane adresowe</h6>
                                </a>
                                <div class="collapse show" id="addressDataForm">
                                    <div class="card-body">
                                        <div class="form-group row">
                                            <div class="col-sm-5 mb-3 mb-sm-0">
                                                <form:label path="streetName">Nazwa ulicy</form:label>
                                                <form:input path="streetName" type="text" class="form-control form-control-user"
                                                            placeholder="Nazwa ulicy"/>
                                                <form:errors path="streetName"/>
                                            </div>
                                            <div class="col-sm-4">
                                                <form:label path="buildingNumber">Nr budynku</form:label>
                                                <form:input path="buildingNumber" type="text" class="form-control form-control-user"
                                                            placeholder="Nr budynku"/>
                                                <form:errors path="buildingNumber"/>

                                            </div>
                                            <div class="col-sm-3">
                                                <form:label path="flatNumber">Nr lokalu</form:label>
                                                <form:input path="flatNumber" type="text" class="form-control form-control-user"
                                                            placeholder="Nr lokalu"/>
                                                <form:errors path="flatNumber"/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-4">
                                                <form:label path="postCode">Kod pocztowy</form:label>
                                                <form:input path="postCode" type="text" class="form-control form-control-user"
                                                            placeholder="Kod pocztowy" value="00-000"/>
                                                <form:errors path="postCode"/>
                                            </div>
                                            <div class="col-sm-8">
                                                <form:label path="city">Miasto</form:label>
                                                <form:input path="city" type="text" class="form-control form-control-user"
                                                            placeholder="Miasto" value="Warszawa"/>
                                                <form:errors path="city"/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-6">
                                                <form:label path="voivodeship">Województwo</form:label>
                                                <form:input path="voivodeship" type="text" class="form-control form-control-user"
                                                            placeholder="Województwo" value="Mazowieckie"/>
                                                <form:errors path="voivodeship"/>
                                            </div>
                                            <div class="col-sm-6">
                                                <form:label path="country">Państwo</form:label>
                                                <form:input path="country" type="text" class="form-control form-control-user"
                                                            placeholder="Państwo" value="Polska"/>
                                                <form:errors path="country"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card shadow mb-4">
                                <a href="#loginDataForm" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
                                    <h6 class="m-0 font-weight-bold text-primary">Dane logowania</h6>
                                </a>
                                <div class="collapse show" id="loginDataForm">
                                    <div class="card-body">
                                        <div class="form-group row">
                                            <div class="col-sm-6 mb-3 mb-sm-0">
                                                <form:label path="username">Nazwa użytkownika</form:label>
                                                <form:input path="username" type="text" class="form-control form-control-user"
                                                            placeholder="Nazwa użytkownika"/>
                                            </div>
                                            <div class="col-sm-6">
                                                <form:label path="password">Hasło</form:label>
                                                <form:password path="password" class="form-control form-control-user"
                                                               placeholder="Hasło"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <hr>
                            <form:button type="submit" class="btn btn-primary btn-user btn-block">
                                Zatwierdź zmiany
                            </form:button>

                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- Bootstrap core JavaScript-->
<script src="<spring:url value="/../../vendor/jquery/jquery.min.js"/>"></script>
<script src="<spring:url value="/../../vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

<!-- Core plugin JavaScript-->
<script src="<spring:url value="/../../vendor/jquery-easing/jquery.easing.min.js"/>"></script>

<!-- Custom scripts for all pages-->
<script src="<spring:url value="/../../js/sb-admin-2.min.js"/>"></script>

</body>

</html>

