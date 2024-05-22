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
	<a href="inst_cadastro.jsp"><button>Voltar</button></a>
<%
		String nome = (String) request.getParameter("nome");
		String telefone = (String) request.getParameter("telefone");
		String cep = (String) request.getParameter("cep");
		String endereco = (String) request.getParameter("endereco");
		
		if (nome==null){
			nome="";
			}

			if (cep==null){
			cep="";
			}

			if (telefone==null){
			telefone="";
			}
			if (endereco==null){
				endereco="";
			}
			
			Instituicao inst = new Instituicao();
			endereco endereco_inst = new endereco();
			Instituicao_dao conect = new Instituicao_dao();
			
			
			endereco_inst.setLogradouro(endereco);
			endereco_inst.setCep(cep);
			
			inst.setNome(nome);
			inst.setEnd(endereco_inst);
			inst.setTelefone(telefone);
			out.println(inst.getNome()+"Esse");
			
			conect.salva_instituicao(inst);
			
			ArrayList <Instituicao> lista_inst = conect.buscaDados("");
			
			response.sendRedirect("horarios_cadastro.jsp");
		%>
		</body>
</html>