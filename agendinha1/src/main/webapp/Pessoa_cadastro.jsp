<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<title>Cadastro Administrador</title>
</head>
<body>
	<form action="index3.jsp" method="post">
		<div class="container-fluid">
		<div class="mb-3">
		<h1>Cadastro de Administrador</h1>
		   	<label for="nome" class="form-label">Nome:</label>
		    <input type="text" class="form-control" id="nome" name="nome">
		  </div>
		  <div class="mb-3">
		   	<label for="cpf" class="form-label">CPF/CNPJ:</label>
		    <input type="text" class="form-control" id="cpf" name="cpf">
		  </div>
		  <div class="mb-3">
		    <label for="email" class="form-label">Email:</label>
		    <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp">
		  </div>
		  <div class="mb-3">
		   	<label for="telefone" class="form-label">Telefone:</label>
		    <input type="tel" class="form-control" id="telefone" name="telefone">
		  </div>
		  <div class="mb-3">
		   	<label for="cep" class="form-label">CEP:</label>
		    <input type="number" class="form-control" id="cep" name="cep">
		  </div>
		  <div class="mb-3">
		    <label for="senha" class="form-label">Senha:</label>
		    <input type="password" class="form-control" id="senha" name="senha"><br>
			<h1>Cadastro da Instituição</h1>
				<label for="nome" class="form-label">Nome da instituição:</label> <input
					type="text" class="form-control" id="nome_inst" name="nome_inst">
			</div>
			<div class="mb-3">
				<label for="cep" class="form-label">CEP:</label> <input type="text"
					class="form-control" id="cep_inst" name="cep_inst">
			</div>
			<div class="mb-3">
				<label for="endereco" class="form-label">Endereço:</label> <input
					type="text" class="form-control" id="endereco_inst" name="endereco_inst">
			</div>
			<div class="mb-3">
				<label for="telefone" class="form-label">Telefone:</label> <input
					type="tel" class="form-control" id="telefone_inst" name="telefone_inst">
			</div>
			<button type="submit" class="btn btn-primary">Cadastrar</button>
		</div>
		</form>
</body>

<style>
body{
background-color:#1f59af;
}
</style>
</html>