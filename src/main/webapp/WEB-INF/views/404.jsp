<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    <link href="<c:url value="vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <link href="<c:url value="css/sb-admin-2.min.css"/>" rel="stylesheet">
</head>
<body id="page-top">
<div id="wrapper">
    <jsp:include page="temps/sidebar.jsp"/>
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <jsp:include page="temps/header.jsp"/>
            <div class="container-fluid">

                <div class="text-center">
                    <div class="error mx-auto" data-text="404">404</div>
                    <p class="lead text-gray-800 mb-5">Nie ma takiej strony</p>
                    <p class="text-gray-500 mb-0">To jest amelinium tego nie pomalujesz</p>
                    <a class="nav-link" href="<spring:url value="/login"/>">Zaloguj się</a>
                </div>
            </div>
        </div>
        <jsp:include page="temps/footer.jsp"/>
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
