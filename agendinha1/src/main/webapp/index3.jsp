<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="agendinha1.*"%>
    <%@page import="java.util.*" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Agenda</title>
</head>
<body>
	<h1>O</h1><br>
	<a href="index.jsp">voltar</a>
	
	<%
		String nome_inst = (String) request.getParameter("nome_inst");
		String telefone_inst = (String) request.getParameter("telefone_inst");
		String cep_inst = (String) request.getParameter("cep_inst");
		String endereco_inst = (String) request.getParameter("endereco_inst");
		
		if (nome_inst==null){
			nome_inst="";
			}

			if (cep_inst==null){
			cep_inst="";
			}

			if (telefone_inst==null){
			telefone_inst="";
			}
			if (endereco_inst==null){
				endereco_inst="";
			}
			
			Instituicao inst = new Instituicao();
			endereco endereco_insti = new endereco();
			Instituicao_dao conect_inst = new Instituicao_dao();
			
			
			endereco_insti.setLogradouro(endereco_inst);
			endereco_insti.setCep(cep_inst);
			
			inst.setNome(nome_inst);
			inst.setEnd(endereco_insti);
			inst.setTelefone(telefone_inst);
			out.println(inst.getNome()+"Esse");
			
			int cod_instituicao = conect_inst.salva_instituicao(inst);
			
			
			
	
		String nome = (String) request.getParameter("nome");
		String email = (String) request.getParameter("email");
		String telefone = (String) request.getParameter("telefone");
		String senha = (String) request.getParameter("senha");
		String cep = (String) request.getParameter("cep");
		String cpf = (String) request.getParameter("cpf");
		String idade = (String) request.getParameter("idade");
	
		if (idade==null){
			idade="0";
			}
		
		if (nome==null){
			nome="";
			}

			if (email==null){
			email="";
			}

			if (telefone==null){
			telefone="";
			}

			if (senha==null){
			senha="";
			}

			if (cep==null){
			cep="";
			}

			if (cpf==null){
			cpf="";
			}
			
		
			
		Pessoa_dao conect = new Pessoa_dao();

		
		endereco end = new endereco();
		usuario usuario = new usuario ();
		
		usuario.setNome(nome);
		usuario.setCpf(cpf);
		usuario.setEmail(email);
		usuario.setSenha(senha);
		usuario.setTelefone(telefone);
		inst.setId(cod_instituicao);
		usuario.setInst(inst);
		usuario.setCod_func(2);
		
		end.setCep(cep);
		usuario.setEnd(end);
		out.print(usuario.getInst().getId()+"");
		conect.salva_pessoa(usuario);
		out.print(conect.getErro());
	
	
	
	Pessoa_dao agenda = new Pessoa_dao();
	response.sendRedirect("index.jsp");
	
	
	%>	
</body>
</html>