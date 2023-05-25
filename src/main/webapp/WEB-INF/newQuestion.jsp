<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>New Category</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
<main class="container mt-5">
    <div class="row justify-content-center">
        <form class="mt-5 border border-1 rounded p-4" action="/questions/new" method="post">
            <h1 class="mb-3">Whats is your question?</h1>
            <div class="mb-3">
                <label class="form-label">Question:</label>
                <textarea class="form-control" name="question"></textarea>
                <label class="text-danger">${questionError}</label>
            </div>
            <div class="mb-3">
                <label class="form-label">Tags:</label>
                <input class="form-control" name="tags" />
                <label class="text-danger">${tagsError}</label>
            </div>
            <input class="btn btn-primary float-end" type="submit" value="Create"/>
        </form>
    </div>
</main>
</body>
</html>