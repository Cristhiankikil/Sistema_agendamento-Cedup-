<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="agendinha1.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String nome = (String) request.getParameter("nome");;
	String funcao = (String) request.getParameter("funcao");
	String login = (String) request.getParameter("login");
	String senha = (String) request.getParameter("senha");

	if (nome == null) {
		nome = "";
	}
	if (funcao == null) {
		funcao = "0";
	}
	if (login == null) {
		login = "";
	}
	if (senha == null) {
		senha = "";
	}
	usuario log = (usuario) session.getAttribute("login");

	Pessoa_dao conect = new Pessoa_dao();

	endereco end = new endereco();
	usuario funcionario = new usuario();

	funcionario.setNome(nome);
	funcionario.setEmail(login);
	funcionario.setLogin(login);
	funcionario.setSenha(senha);
	funcionario.setInst(log.getInst());

	

	
	Funcao funcaox = new Funcao();
	funcaox.setCod(Integer.parseInt(funcao));
	funcionario.setCod_func(funcaox);
	funcionario.setLogin(login);
	funcionario.setSenha(senha);

	funcionario.setInst(log.getInst());


	response.sendRedirect("funcionario_cad.jsp");
	int cd_user = conect.salva_pessoa(funcionario);
	%>
</body>
</html>