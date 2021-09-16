<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../base.css">
<meta charset="ISO-8859-1">
<title>Novo Produto</title>
</head>
<body>


	<form action="<c:url value='/produto/adiciona'/>" method="post"> 

		Nome: <input class="form-control" type="text" name="produto.nome"> Valor:<input
			type="text" class="form-control" name="produto.valor"> Quantidade: <input
			type="text" class="form-control" name="produto.quantidade"> <input type="submit"
			class="btn btn-primary" value="Adicionar">
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