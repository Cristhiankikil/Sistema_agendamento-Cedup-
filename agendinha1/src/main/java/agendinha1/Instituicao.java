package agendinha1;

public class Instituicao {
	
	String nome = "";
	endereco end = new endereco();
	String telefone = "";
	int id = 0;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}	
	public endereco getEnd() {
		return end;
	}
	public void setEnd(endereco end) {
		this.end = end;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	
	
}
