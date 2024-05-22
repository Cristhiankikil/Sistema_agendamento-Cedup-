<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Tela inicial</title>
    <link rel="stylesheet" href="style.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <meta charset="utf-8">
  </head>
  <body>
    <form action="login.jsp" method="get" accept-charset="utf-8">
      <div class="textos">
        <p>Nesta parte do projeto ficarão textos.</p>
      </div>
      <div class="container">
        <div class="login">
          <label>Email ou Matrícula: </label>
          <input type="text" placeholder="Digite seu email ou matricula" name="email" id="email">
          <label>Senha:</label>
          <input type="password" placeholder="Digite sua senha" name="senha" id="senha">
          <button type="submit" onclick="validacampos()">Entrar</button>
        </div>
        <div>
          <p>Ainda não possui cadastro?</p>
          <a href="Pessoa_cadastro.jsp"><p>Cadastrar</p></a>
        </div>
      </div>
    </form>
    
   	<%
   	String recebe = (String) request.getParameter("msg");
   	if (recebe == null){
   		recebe = "";
   	}
   	out.println(recebe);%>
  </body>
  	<script type="text/javascript">
  	function validacampos (){
  		email = document.getElementById("email").value;
  		senha = document.getElementById("senha").value;
  		
  		if email 
  	}
  	</script>
</html>