<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
    <ul class="navbar-nav ml-auto">
        <div class="topbar-divider d-none d-sm-block"></div>
        <sec:authorize access="isAuthenticated()">
            <li>
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Witaj<br/>
                    <sec:authentication property="principal.user.id"/></span>
            </li>
            <li><a class="nav-link" href="<spring:url value="/logout"/>">
                <img class="img-profile rounded-circle" src="<spring:url value="/img/user-icon.svg"/>">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Wyloguj się</span>
            </a></li>
            <sec:csrfInput/>
        </sec:authorize>
        <sec:authorize access="!isAuthenticated()">
            <li><a class="nav-link" href="<spring:url value="/login"/>">
                <img class="img-profile rounded-circle" src="<spring:url value="/img/user-icon.svg"/>">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Zaloguj się</span>
            </a></li>
            <sec:csrfInput/>
        </sec:authorize>
    </ul>
</nav>
