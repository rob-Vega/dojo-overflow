<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- fn: -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Category</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
<main class="container mt-5">
    <h1 class="mb-3">Questions Dashboard</h1>
    <div class="row justify-content-center">
        <table class="table table-striped border border-1">
            <thead>
                <th>Question</th>
                <th>Tags</th>
            </thead>
            <tbody>
                <c:forEach items="${questionsList}" var="question">
                    <tr>
                        <td><a href="/questions/${question.id}">${question.question}</a></td>
                        <td>
                            <c:forEach items="${question.tags}" var="tag">
                                ${tag.subject},
                            </c:forEach>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="container">
            <a class="float-end" href="/questions/new">New Question</a>
        </div>
    </div>
</main>
</body>
</html>