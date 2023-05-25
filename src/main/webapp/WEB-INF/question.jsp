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
    <h1 class="mb-3">${question.question}</h1>
    <div class="row mt-5">
        <div class="col-6">
            <table class="table table-striped border border-1 col-6">
                <thead>
                    <th>Answers</th>
                </thead>
                <tbody>
                    <c:forEach items="${question.answers}" var="answer">
                        <tr>
                            <td>${answer.answer}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="col-6 row justify-content-center">
            <form class="border border-1 rounded p-4" action="/questions/${question.id}" method="post">
                <h1 class="mb-3">Add your answer:</h1>
                <div class="mb-3">
                    <label class="form-label">Answer:</label>
                    <textarea class="form-control" name="answer"></textarea>
                    <label class="text-danger">${questionError}</label>
                </div>
                <input class="btn btn-primary float-end" type="submit" value="Answer it!"/>
            </form>
        </div>
    </div>
</main>
</body>
</html>