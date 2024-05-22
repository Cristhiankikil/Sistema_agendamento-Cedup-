<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="agendinha1.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	


	<%
	String email = (String) request.getParameter("email");
	String senha = (String) request.getParameter("senha");
	
	agendinha1.login_dao ld = new agendinha1.login_dao();
	usuario user_local = new usuario();
	user_local.setEmail(email);
	user_local.setSenha(senha);
	user_local = ld.Executa(user_local);
	
	
	if(user_local.getAprovado().equals("Aprovado")){
		session.setAttribute("login", user_local);
		out.print("Autorizado!");
		response.sendRedirect("menu.jsp");
	} else {
		out.print("Usuário inválido!");
		response.sendRedirect("index.jsp?msg=login invalido");
	}
	

	
	%>
</body>
</html>