<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="agendinha1.*"%>
     <%@page import="java.util.*"%>
     <%@page import="java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Agendamentos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
	<%
usuario user_local =  (usuario)session.getAttribute("login");
if (user_local == null){
	response.sendRedirect("login.jsp");
}
else{


String cod_dia =(String) request.getParameter("dia");

if (cod_dia == null){
	cod_dia = "1";
}
int cod_diax = Integer.parseInt(cod_dia);

String data_recebida = request.getParameter("data_evento");

Date data_atual = new Date();

SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd");

if (data_recebida == null){
	data_recebida = dtf.format(data_atual);
}
else{
	data_atual = dtf.parse(data_recebida);
}

Calendar c = Calendar.getInstance();
c.setTime(data_atual);
 cod_diax = c.get(Calendar.DAY_OF_WEEK);

	horarios_dao agenda = new horarios_dao();
ArrayList<horario> lista = agenda.buscaDados(cod_diax+"",user_local);
out.print(agenda.getErro());
 
 
String select_dia = "";
out.print(cod_diax+"");

%>
	<div>
		<form action="horarios_cadastro.jsp" method="post">
		<input type="date"  name="data_evento" value="<%out.print(data_recebida); %>"  />
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Agendar
</button>
	<a href="menu.jsp" class="btn btn-primary" >Voltar</a>
		</form>
	</div>

    	<%

	out.print("<table class='table table-striped table-bordered'>");
	
	//out.print("<tr><th>"+nome_dia+"</th></tr>");
	out.print("<tr>");
	out.print("<th>Horario Início:</th>");
	out.print("<th>Horario final:</th>");
	out.print("</tr>");
	int contador = 0;
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