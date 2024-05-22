<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 
 <%@page import="agendinha1.*"%>
  <%@page import="java.util.*"%>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="style.css" rel="stylesheet"/>
<title>Tela de Menu</title>
</head>
<body>
	<%
	usuario user_local =  (usuario)session.getAttribute("login");
	if (user_local == null){
		response.sendRedirect("login.jsp");
	}
	else{
	out.print(user_local.getEmail()+"-"+user_local.getInst().getNome());	
	
	}
	
	Telas_dao tela = new Telas_dao();
	ArrayList <Telas> lista_telas = tela.buscaDados(user_local.getCod_func().getCod()+"");
	
	
	%>
	<ul class="nav nav-tabs">
 	
			<nav class="nav">
				<%
				int cont = 0;
				
				while (cont < lista_telas.size()){
					Telas t = (Telas)lista_telas.get(cont);
					out.print(" <li class='nav-item'>");
					out.print("<a class='nav-link' href='"+t.getLink()+"'>"+t.getNome()+"</a>");
					out.print(" </li>");
					
					cont++;					
				}
				out.print(" <li class='nav-item'>");
				out.print("<a class='nav-link' href='exit.jsp'>Sair</a>");
				out.print(" </li>");
				%>
		</nav>
	</ul>
	<div class="container">
		<img alt="" src="Imagem_fundo" class="icones/imagem_fundo.jpg">
	</div>
</body>
</html>