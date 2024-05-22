package agendinha1;

public class endereco {
	
	String cep = "";
	String logradouro = "";
	String bairro = "";
	String uf = "";
	String cidade = "";
	String numero = "";
	
	public void setCep (String ceprecebido) {
		this.cep = ceprecebido;
	}		
	public void setLogradouro (String logradourorecebido) {
		this.logradouro = logradourorecebido;
	}
	public void setBairro (String bairrorecebido) {
		this.bairro = bairrorecebido;
	}	
	public void setUf (String ufrecebido) {
		this.uf = ufrecebido;
	}
	public void setCidade (String cidaderecebido) {
		this.cidade = cidaderecebido;
	}	
	public void setNumero (String numerorecebido) {
		this.numero = numerorecebido;
	}
	public String getCep () {
		return this.cep;
	}
	public String getLogradouro () {
		return this.logradouro;
	}
	public String getBairro () {
		return this.bairro;
	}
	public String getUf () {
		return this.uf;
	}
	public String getCidade () {
		return this.cidade;
	}
	public String getNumero () {
		return this.numero;
	}
	
}
