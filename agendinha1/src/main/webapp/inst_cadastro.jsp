<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<title>Cadastro instituição</title>
</head>
<body>
	<form id="meuFormulario" action="inst_bd.jsp" method="post">
		<div class="container-fluid">
			<div class="mb-3">
				<label for="nome" class="form-label">Nome da instituição:</label> <input
					type="text" class="form-control" id="nome" name="nome">
			</div>
			<div class="mb-3">
				<label for="cep" class="form-label">CEP:</label> <input type="text"
					class="form-control" id="cep" name="cep">
			</div>
			<div class="mb-3">
				<label for="endereco" class="form-label">Endereço:</label> <input
					type="text" class="form-control" id="endereco" name="endereco">
			</div>
			<div class="mb-3">
				<label for="telefone" class="form-label">Telefone:</label> <input
					type="tel" class="form-control" id="telefone" name="telefone">
			</div>
			<button type="submit" class="btn btn-primary">Cadastrar</button>
		</div>
	</form>
</body>
<style>
body{
background-color:#1f59af;
}
.container-fluid{
border:2px solid #0d6efd;
position:relative;
display: center;
width:500px;
height:600px;
background-color:white;
margin-top:5%;
}
</style>
</html>