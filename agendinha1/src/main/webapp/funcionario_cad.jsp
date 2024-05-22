<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="agendinha1.*"%>
     <%@page import="java.util.*"%>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<title>Cadastro de Funcionário</title>
</head>
<body>
<form action="funcionario_bd.jsp" method="post">
		<div class="container-fluid">
		<div class="mb-3">
		   	<label for="nome" class="form-label">Nome:</label>
		    <input type="text" class="form-control" id="nome" name="nome">
		  </div>
		  <div class="mb-3">
		  <label for="funcao" class="form-label">Funçao:</label>
		  	<select name="funcao">
			<option value=1>Professor</option>
			<option value=2>Gestor</option>
		</select> 
		  </div>
		  <div class="mb-3">
		   	<label for="login" class="form-label">Login:</label>
		    <input type="text" class="form-control" id="login" name="login">
		  </div>
		  <div class="mb-3">
		    <label for="senha" class="form-label">Senha:</label>
		    <input type="password" class="form-control" id="senha" name="senha">
		  </div>
		  </div>
			<button type="submit" class="btn btn-primary">Cadastrar</button>
			
		<div>
		<%
			Pessoa_dao agenda = new Pessoa_dao();
			String acao = (String) request.getParameter("acao");
			String cod_func = (String) request.getParameter("cod_func");
			
			if ("delete".equals(acao)){
				agenda.deleta_func(cod_func);
			}
			
			ArrayList<usuario> lista = agenda.buscaDados("", (usuario) session.getAttribute("login"));
			out.print(agenda.getErro());
			out.print("<table class='table table-striped table-bordered'>");
			int contador = 0;
			
			
			
			out.print("<tr>");
			out.print("<th>Nome do funcionário:</th>");
			out.print("<th>Login:</th>");
			out.print("<th>Opções:</th>");
			out.print("</tr>");
			while (contador < lista.size()) {

				usuario FunciExibir = (usuario) lista.get(contador);
				out.print("<tr>");
				out.print("<th>"+FunciExibir.getNome()+"</th>");
				out.print("<th>"+FunciExibir.getLogin()+"</th>");
				out.print("<th> <img src='icones/editar_icon.png' style='width:30px; height:30px;'>");
				out.print("<a href='funcionario_cad.jsp?acao=delete&&cod_func="+FunciExibir.getId()+"'><img src='icones/lixeira_icon.png' style='width:30px; height:30px;'></a></th>");
				out.print("</tr>");				
				contador++;
			}
			out.print("</table>");
			%>
		</div>	
		</form>
</body>
</html>