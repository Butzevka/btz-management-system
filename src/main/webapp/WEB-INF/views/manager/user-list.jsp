<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
    <link href="<spring:url value="/../../vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <link href="<spring:url value="/../../css/sb-admin-2.min.css"/>" rel="stylesheet">
</head>
<body id="page-top">
<div id="wrapper">
    <jsp:include page="/WEB-INF/views/temps/sidebar.jsp"/>
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <jsp:include page="/WEB-INF/views/temps/header.jsp"/>
            <div class="container-fluid">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Lista użytkowników</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Imię</th>
                                    <th>Nazwisko</th>
                                    <th>Adres e-mail</th>
                                    <th colspan="3">Akcje</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>Imię</th>
                                    <th>Nazwisko</th>
                                    <th>Adres e-mail</th>
                                    <th colspan="3" style="position: center">Akcje</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach var="user" items="${users}">
                                    <c:if test="${user.enabled > 0}">
                                        <tr>
                                            <td><c:out value="${user.firstName}"/></td>
                                            <td><c:out value="${user.lastName}"/></td>
                                            <td><c:out value="${user.email}"/></td>
                                            <td>
                                                <a href="<c:url value="/app/manager/user/${user.id}/details"/>">Szczegóły</a>
                                            </td>
                                            <td><a href="<c:url value="/app/manager/user/${user.id}/edit"/>">Edytuj</a></td>
                                            <td><a href="<c:url value="/app/manager/user/${user.id}/delete"/>">Usuń</a></td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="/WEB-INF/views/temps/footer.jsp"/>
    </div>
</div>

<script src="<spring:url value="/../../vendor/datatables/jquery.dataTables.min.js"/>"></script>
<script src="<spring:url value="/../../vendor/datatables/dataTables.bootstrap4.min.js"/>"></script>
<script src="<spring:url value="/../../js/demo/datatables-demo.js"/>"></script>
<script src="<spring:url value="/../../vendor/jquery/jquery.min.js"/>"></script>
<script src="<spring:url value="/../../vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
<script src="<spring:url value="/../../vendor/jquery-easing/jquery.easing.min.js"/>"></script>
<script src="<spring:url value="/../../js/sb-admin-2.min.js"/>"></script>

</body>

</html>