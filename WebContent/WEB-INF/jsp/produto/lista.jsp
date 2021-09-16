<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
>
<meta charset="ISO-8859-1">
<title>Listagem de produtos</title>
</head>
<body>
	<h1>Listagem de Produtos do ${usuarioLogado.usuario.nome}</h1>


	<table class="table table-stripped table-hover table-bordered">
		<thead>
			<tr>
				<th>Nome</th>
				<th>Valor</th>
				<th>Quantidade</th>
			</tr>

		</thead>
		<tbody>
			<c:forEach items="${produtoList}" var="produto">

				<tr>
					<td>${produto.nome}</td>
					<td>${produto.valor}</td>
					<td>${produto.quantidade}</td>
					<td><a
						href="<c:url value='/produto/remove?produto.id=${produto.id}'/>">Remover</a>
					</td>
					<td >
					<c:url value="/produto/enviaPedidoDeNovosItens?produto.nome=${produto.nome}" var="url"/>
					<a href="${url}">Pedir mais itens</a> 
					</td>
				</tr>

			</c:forEach>

		</tbody>

	</table>
	${mensagem} <br>
	<a href="<c:url value='/produto/formulario'/>"> Adicionar mais
		produtos! </a>
</body>
</html>