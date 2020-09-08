<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-info sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <li>
        <a href="<c:url value="/"/>"><img src="<c:url value="/img/btz-logo.png"/>" alt="btz-logo"/></a>
    </li>
    <hr class="sidebar-divider">

    <div class="sidebar-heading">
        BTZ Management System
    </div>

    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
           aria-expanded="true" aria-controls="collapseUtilities">
            <i class="fas fa-fw fa-cog"></i>
            <span>Grafik</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Akcje:</h6>
                <a class="collapse-item" href="<c:url value="/app/rota"/>">Sprawdź swój grafik</a>
                <a class="collapse-item" href="<c:url value="/app/payroll"/>">payroll tba</a>
            </div>
        </div>
    </li>
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true"
           aria-controls="collapseTwo">
            <i class="fas fa-fw fa-cog"></i>
            <span>Dane konta</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Akcje:</h6>
                <a class="collapse-item" href="<c:url value="/app/details"/>">Twoje konto</a>
                <a class="collapse-item" href="<c:url value="/app/${user.id}/password"/>">zmiana hasła tba</a>
            </div>
        </div>
    </li>
    <hr class="sidebar-divider d-none d-md-block">
</ul>