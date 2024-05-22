<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="agendinha1.*"%>
    <%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="amb_cadastro.jsp"><button>Voltar</button></a>
<%

usuario user_local =  (usuario)session.getAttribute("login");

if (user_local == null){
	response.sendRedirect("login.jsp");
}

		String tipo = (String) request.getParameter("tipo");
		String nome = (String) request.getParameter("nome");
		String identificacao = (String) request.getParameter("identificacao");
		
		
		if (tipo==null){
			tipo="";
			}

			if (nome==null){
			nome="";
			}

			if (identificacao==null){
			identificacao="";
			
			}
			
			ambientes amb = new ambientes();
			amb_dao conect = new amb_dao();
			
			amb.setNome(nome);
			amb.setTipo(tipo);
			amb.setIdentificacao(identificacao);
			amb.setCod_instituicao(user_local.getInst().getId());
		
			
			
			conect.salva_ambientes(amb);
			
			ArrayList <ambientes> lista_amb = conect.buscaDados("");
			
			response.sendRedirect("menu.jsp");
			
		%>
		</body>
</html>