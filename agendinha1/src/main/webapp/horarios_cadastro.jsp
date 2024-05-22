<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="agendinha1.*"%>
     <%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cadastro de Horários</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<%usuario user_local =  (usuario)session.getAttribute("login");
if (user_local == null){
	response.sendRedirect("login.jsp");
}
else{

String cod_ambiente = (String) request.getParameter("ambiente");
String cod_dia =(String) request.getParameter("dia");


if (cod_ambiente == null){
	cod_ambiente = "1";
}
if (cod_dia == null){
	cod_dia = "1";
}
int cod_diax = Integer.parseInt(cod_dia);

String select_dia = "";
%>
	<div>
		<form action="horarios_cadastro.jsp" method="post">
	<%
	
			select_dia = select_dia+"<select name='dia'>";
			horarios_dao agenda = new horarios_dao();
			ArrayList <Dia> lista_dias = agenda.buscaDias(cod_dia);
			String nome_dia = "";
			
			int contador = 0;
			while (contador < lista_dias.size()){
				Dia d = (Dia) lista_dias.get(contador);
				String select = "";
				if (cod_dia.equals(""+d.getId())){
					select = "Selected";
					nome_dia = d.getNome();
				}
				select_dia = select_dia+"<option value='"+d.getId()+"' "+select+">"+d.getNome()+"</option>";
				contador++;
			}
			select_dia = select_dia+"</select>";
			out.print(select_dia);
			%>
			<%
			String select_ambiente = "";
			select_ambiente = select_ambiente+"<select name='ambiente'>";
			amb_dao ambientes_dao = new amb_dao();
			ArrayList <ambientes> lista_ambientes = ambientes_dao.buscaDados("");
			String nome_ambiente = "";
			 
			int cont = 0;
			while (cont < lista_ambientes.size()){
				ambientes amb = (ambientes) lista_ambientes.get(cont);
				String select = "";
				if (cod_ambiente.equals(""+amb.getId())){
					select = "Selected";
					nome_ambiente = amb.getNome();
				}
				select_ambiente = select_ambiente+"<option value='"+amb.getId()+"' "+select+">"+amb.getNome()+"</option>";
				cont++;
			}
			select_ambiente = select_ambiente+"</select>";
			out.print(select_ambiente);
			%>
		<button class="btn btn-primary" type="submit">Consultar Horário</button>
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Adicionar Horários
</button>
	<a href="menu.jsp" class="btn btn-primary" > Voltar</a>
		</form>
	</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
      
        <h1 class="modal-title fs-5" id="exampleModalLabel">Cadastrar Horários</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <form action="horarios_bd.jsp" method="post">
      <div class="modal-body">
        <%
        out.print(select_dia);
        out.print(select_ambiente);
        %>
<br>
		
					<div>
						<label>Inicio:</label> <input type="time" name="horario_inicio">
						<label>Fim:</label> <input type="time" name="horario_fim">
					</div>
				</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
        <button type="submit" class="btn btn-primary">Salvar</button>
        
      </div>
    
    </form>
    </div>
  </div>
</div>
	<%
	
	
	
	ArrayList<horario> lista = agenda.buscaDados(cod_diax+"",cod_ambiente,user_local);
	
	out.print(agenda.getErro());

	out.print("<table class='table table-striped table-bordered'>");
	
	out.print("<tr><th>"+nome_dia+"</th>");
	out.print("<th>"+nome_ambiente+"</th></tr>");
	out.print("<tr>");
	out.print("<th>Horario Início:</th>");
	out.print("<th>Horario final:</th>");
	out.print("</tr>");
	contador = 0;
	while (contador < lista.size()) {

		horario horarioExibir = (horario) lista.get(contador);
		out.print("<tr>");
		out.print("<th>"+horarioExibir.getHorarios_inicio()+"</th>");
		out.print("<th>"+horarioExibir.getHorarios_fim()+"</th>");
		out.print("</tr>");
		contador++;
	}
	out.print("</table>");
}
	%>
</body>
</html>