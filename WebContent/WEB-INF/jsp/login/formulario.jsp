<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Formulário de Login</title>
</head>
<body>

<form action="<c:url value='/login/autentica'/>" method="post"> 

<input type="text" name="usuario.nome">
<input type="text" name="usuario.senha">
<input type="submit" value="Login">

</form>
  <c:if test="${not empty errors}">
            <div class="alert alert-danger">
                <c:forEach var="error" items="${errors}">
                    ${error.category} - ${error.message}<br />
                </c:forEach>
            </div>
        </c:if>

</body>
</html>