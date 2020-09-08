<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
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
                        <h6 class="m-0 font-weight-bold text-primary">Grafik na tydzień <tags:localDate
                                date="${CurrentWeek.get(0)}"/>-<tags:localDate date="${CurrentWeek.get(6)}"/></h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <form:form method="post" modelAttribute="TimesheetList">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                    <tr>
                                        <th rowspan="2">Pracownik</th>
                                        <th rowspan="2">Poniedziałek<br/><tags:localDate date="${CurrentWeek.get(0)}"
                                                                                         pattern="dd/MM"/></th>
                                        <th rowspan="2">Wtorek<br/><tags:localDate date="${CurrentWeek.get(1)}"
                                                                                   pattern="dd/MM"/></th>
                                        <th rowspan="2">Środa<br/><tags:localDate date="${CurrentWeek.get(2)}"
                                                                                  pattern="dd/MM"/></th>
                                        <th rowspan="2">Czwartek<br/><tags:localDate date="${CurrentWeek.get(3)}"
                                                                                     pattern="dd/MM"/></th>
                                        <th rowspan="2">Piątek<br/><tags:localDate date="${CurrentWeek.get(4)}"
                                                                                   pattern="dd/MM"/></th>
                                        <th rowspan="2">Sobota<br/><tags:localDate date="${CurrentWeek.get(5)}"
                                                                                   pattern="dd/MM"/></th>
                                        <th rowspan="2">Niedziela<br/><tags:localDate date="${CurrentWeek.get(6)}"
                                                                                      pattern="dd/MM"/></th>
                                    </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th>Pracownik</th>
                                        <th>Poniedziałek</th>
                                        <th>Wtorek</th>
                                        <th>Środa</th>
                                        <th>Czwartek</th>
                                        <th>Piątek</th>
                                        <th>Sobota</th>
                                        <th>Niedziela</th>
                                    </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach items="${Users}" var="user">
                                        <tr id="userRow${user.id}">

                                            <td>
                                                <c:out value="${user.firstName} ${user.lastName}"/>
                                            </td>
                                            <c:forEach items="${CurrentWeek}" var="currentDay">
                                                <td><c:forEach var="timesheet" items="${TimesheetList.timesheetList}"
                                                               varStatus="tagStatus">
                                                    <c:if test="${currentDay.equals(timesheet.date)}">
                                                        <c:if test="${user.id.equals(timesheet.user.id)}">
                                                            <form:input path="timesheetList[${tagStatus.index}].id"
                                                                        type="hidden" value="${timesheet.id}"/>
                                                            <form:input path="timesheetList[${tagStatus.index}].user"
                                                                        type="hidden" value="${timesheet.user.id}"/>
                                                            <form:input path="timesheetList[${tagStatus.index}].date"
                                                                        type="hidden" value="${currentDay}"/>
                                                            <form:input
                                                                    path="timesheetList[${tagStatus.index}].timeFrom"
                                                                    type="time" value="09:00"/><br/>
                                                            <form:input path="timesheetList[${tagStatus.index}].timeTo"
                                                                        type="time" value="17:00"/><br/>
                                                            <form:textarea
                                                                    path="timesheetList[${tagStatus.index}].comments"
                                                                    rows="2" cols="8" placeholder="komentarz"/>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach></td>
                                            </c:forEach>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <form:button type="submit"
                                             class="btn btn-success btn-user btn-block">Zatwierdź grafik</form:button>
                            </form:form>
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