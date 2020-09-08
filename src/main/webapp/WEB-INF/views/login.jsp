<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="BTZ Management System">
    <meta name="author" content="Emilian Bucewka">
    <title>BTZ Management System</title>
    <link href="<c:url value="vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <link href="<c:url value="css/sb-admin-2.min.css"/>" rel="stylesheet">
</head>

<body class="bg-gradient-info">

<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">BTZ Management System</h1>
                                </div>
                                <form:form method="post" class="user">
                                    <div class="form-group"><form:label path="username"/>
                                        <form:input path="username" type="username" class="form-control form-control-user" id="inputEmail" aria-describedby="emailHelp" placeholder="Użytkownik"/></div>
                                    <div class="form-group"><form:label path="password"/>
                                        <form:input path="password" type="password" class="form-control form-control-user" id="inputPassword" placeholder="Hasło"/></div>
<%--                                    <div class="custom-control custom-checkbox small">--%>
<%--                                        <input type="checkbox" class="custom-control-input" id="customCheck">--%>
<%--                                        <label class="custom-control-label" for="customCheck">Remember Me</label>--%>
<%--                                    </div>--%>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-info btn-employee btn-block">Zaloguj</button>
                                    </div>
                                </form:form>
                                <hr>
                                <div class="text-center">
                                    <a class="small" href="<c:url value="/forgot"/>">Forgot Password?</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="<c:url value="vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

<!-- Core plugin JavaScript-->
<script src="<c:url value="vendor/jquery-easing/jquery.easing.min.js"/>"></script>

<!-- Custom scripts for all pages-->
<script src="<c:url value="js/sb-admin-2.min.js"/>"></script>

</body>

</html>

