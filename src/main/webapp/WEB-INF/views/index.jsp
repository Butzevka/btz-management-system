<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
                <div class="d-none d-sm-inline-block">
                    <p class="text-success">${message}</p>
                </div>
                <sec:authorize access="hasAnyRole('ROLE_USER', 'ROLE_MANAGER', 'ROLE_ADMIN')">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Strefa Pracownika</h6>
                            <div class="dropdown no-arrow">
                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLinkEmployee"
                                   data-toggle="dropdown" aria-haspopup="true"
                                   aria-expanded="false">
                                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                     aria-labelledby="dropdownMenuLinkEmployee">
                                    <div class="dropdown-header">Użytkownicy</div>
                                    <a class="dropdown-item" href="<c:url value="/app/manager/user-form"/>">Dodaj
                                        użytkownika</a>
                                    <a class="dropdown-item" href="<c:url value="/app/manager/user-list"/>">Lista
                                        użytkowników</a>
                                    <div class="dropdown-divider"></div>
                                    <div class="dropdown-header">Grafik</div>
                                    <a class="dropdown-item" href="<c:url value="/app/manager/rota-form"/>">Edytuj
                                        grafik</a>
                                    <a class="dropdown-item" href="<c:url value="/app/manager/rota-show"/>">Pokaż obecny
                                        grafik</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            Ut faucibus tortor nisl, ac pharetra lectus porttitor vitae. Integer sit amet efficitur
                            nisi. Duis dignissim tellus dolor, non condimentum erat hendrerit eu. Cras et erat est.
                            Donec nisi velit, blandit sit amet pretium a, ultricies eu nibh. Morbi tempor pretium ligula
                            a pharetra. Proin diam lacus, finibus a volutpat ac, sollicitudin ut dui. Suspendisse et
                            dictum ipsum, in porta risus. In ullamcorper gravida enim ut finibus.
                        </div>
                    </div>
                </sec:authorize>
                <sec:authorize access="hasAnyRole('ROLE_MANAGER', 'ROLE_ADMIN')">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Strefa Managera</h6>
                            <div class="dropdown no-arrow">
                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLinkManager"
                                   data-toggle="dropdown" aria-haspopup="true"
                                   aria-expanded="false">
                                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                     aria-labelledby="dropdownMenuLinkManager">
                                    <div class="dropdown-header">Użytkownicy</div>
                                    <a class="dropdown-item" href="<c:url value="/app/manager/user-form"/>">Dodaj
                                        użytkownika</a>
                                    <a class="dropdown-item" href="<c:url value="/app/manager/user-list"/>">Lista
                                        użytkowników</a>
                                    <div class="dropdown-divider"></div>
                                    <div class="dropdown-header">Grafik</div>
                                    <a class="dropdown-item" href="<c:url value="/app/manager/rota-form"/>">Edytuj
                                        grafik</a>
                                    <a class="dropdown-item" href="<c:url value="/app/manager/rota-show"/>">Pokaż obecny
                                        grafik</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            Nunc sit amet tempor mi. Cras et massa bibendum, dapibus lacus sed, luctus lorem. Nullam
                            facilisis iaculis turpis, et interdum justo. Donec commodo vulputate nisl non facilisis.
                            Vivamus eu tempor leo, vitae malesuada sem. Vivamus aliquet risus sed ipsum porta lobortis.
                        </div>
                    </div>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Strefa Admina</h6>
                            <div class="dropdown no-arrow">
                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLinkAdmin"
                                   data-toggle="dropdown" aria-haspopup="true"
                                   aria-expanded="false">
                                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                     aria-labelledby="dropdownMenuLinkAdmin">
                                    <div class="dropdown-header">Użytkownicy</div>
                                    <a class="dropdown-item" href="<c:url value="/app/manager/user-form"/>">Dodaj
                                        użytkownika</a>
                                    <a class="dropdown-item" href="<c:url value="/app/manager/user-list"/>">Lista
                                        użytkowników</a>
                                    <div class="dropdown-divider"></div>
                                    <div class="dropdown-header">Grafik</div>
                                    <a class="dropdown-item" href="<c:url value="/app/manager/rota-form"/>">Edytuj
                                        grafik</a>
                                    <a class="dropdown-item" href="<c:url value="/app/manager/rota-show"/>">Pokaż obecny
                                        grafik</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            Integer nec porta justo. Nam hendrerit rhoncus justo at tincidunt. Morbi tristique ac erat
                            in porta. Nulla mollis turpis arcu, at posuere justo auctor vitae. Aliquam sit amet odio
                            lectus. Praesent volutpat non quam a bibendum. Aliquam mollis eros turpis. Nunc sed
                            fermentum mauris. Cras tincidunt mi eu dictum condimentum.
                        </div>
                    </div>
                </sec:authorize>
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
