package agendinha1;

public class usuario extends pessoa{
	String email = "";
	String senha = "";
	String username = "";
	String aprovado = "";
	String login = "";
	Funcao cod_func = new Funcao();  
	Instituicao inst = new Instituicao();
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public Funcao getCod_func() {
		return cod_func;
	}
	public void setCod_func(Funcao cod_func) {
		this.cod_func = cod_func;
	}
	public void setCod_func(int cod_func) {
		this.cod_func.setCod(cod_func);
	}

	public String getAprovado() {
		return aprovado;
	}
	public void setAprovado(String aprovado) {
		this.aprovado = aprovado;
	}
	
	public Instituicao getInst() {
		return inst;
	}
	public void setInst(Instituicao inst) {
		this.inst = inst;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

}
