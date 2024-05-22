package agendinha1;

public class pessoa {

	 String nome = "";
	 int id = 0;
	 String telefone = "";
	 String cpf = "";
	 public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	 endereco end = new endereco();  
	 
public void setNome (String nomerecebido) {
	this.nome = nomerecebido;
}
public void setId (int idrecebido) {
	this.id = idrecebido;

}

public void setTelefone (String telefonerecebido) {
	this.telefone = telefonerecebido;

}
public void setEnd (endereco enderecorecebido) {
	this.end = enderecorecebido;
}
public String getNome () {
	return this.nome;
}
public int getId () {
	return this.id;
}

public String getTelefone () {
	return this.telefone;
}
public endereco getEnd () {
	return this.end;
}
public String toString() {
	return ("nome" + this.nome
			+ "telefone" +this.telefone);
}
}
