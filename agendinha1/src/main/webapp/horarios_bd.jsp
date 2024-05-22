<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <%@page import="agendinha1.*"%>
 <%@page import="java.util.*"%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%usuario user_local =  (usuario)session.getAttribute("login");
if (user_local == null){
	response.sendRedirect("login.jsp");
}
else{
	

	
		String cod_dia =(String) request.getParameter("dia");
		int cod_diax = Integer.parseInt(cod_dia);

		
		String horario_inicio = (String) request.getParameter("horario_inicio");
		String horario_fim = (String) request.getParameter("horario_fim"); 
		String ambiente = (String) request.getParameter("ambiente"); 
		
		if (horario_inicio == null){
			horario_inicio = "00:00";		
		}
		if (horario_fim == null){
			horario_fim = "00:00";		
		}
		if (ambiente == null){
			ambiente = "1";		
		}
	
		
		horarios_dao conect = new horarios_dao();
		
		horario hora = new horario();
		ambientes a = new ambientes();
		a.setId(Integer.parseInt(ambiente));
		
		hora.setCod_inst(user_local.getInst().getId());
		hora.setCod_dia(cod_diax);
		hora.setAmbiente(a);
	
		hora.setHorarios_fim(horario_fim);
		hora.setHorarios_inicio(horario_inicio);
		
		conect.salva_horario(hora);
		
		
		
		response.sendRedirect("horarios_cadastro.jsp");
}	
		%>

</body>
</html>