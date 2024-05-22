<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
	<title>Insert title here</title>
</head>
<body>
	<form action="amb_bd.jsp" method="post">
		<div class="container-fluid">
			<label for="tipo">Tipo:</label>
                <select id="tipo" name="tipo">
                    <option value="sala">Sala</option>
                    <option value="equipamento">Aparelho</option>
                </select><br>   
			<div class="mb-3">
		   		<label for="nome" class="form-label">Nome:</label>
		    	<input type="text" class="form-control" id="nome" name="nome">
		  	</div>
		  	<div class="mb-3">
		   		<label for="identificacao" class="form-label">Indentificação:</label>
		    	<input type="text" class="form-control" id="identificacao" name="identificacao">
		  	</div>
		  	<button type="submit" class="btn btn-primary">Salvar</button>
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