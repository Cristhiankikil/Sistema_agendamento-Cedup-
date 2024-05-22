package agendinha1;

public class horario {
	String erro = "";
	int cod_inst = 0;
	String horarios_inicio = "";
	String horarios_fim = "";
	int cod_turno = 0;
	int cod_dia = 0;
	int id = 0; 
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	ambientes ambiente = new ambientes();
	
	public ambientes getAmbiente() {
		return ambiente;
	}

	public void setAmbiente(ambientes ambiente) {
		this.ambiente = ambiente;
	}

	public int getCod_inst() {
		return cod_inst;
	}

	public void setCod_inst(int cod_inst) {
		this.cod_inst = cod_inst;
	}
	
	public String getHorarios_inicio() {
		return horarios_inicio;
	}

	public void setHorarios_inicio(String horarios_inicio) {
		this.horarios_inicio = horarios_inicio;
	}

	public String getHorarios_fim() {
		return horarios_fim;
	}

	public void setHorarios_fim(String horarios_fim) {
		this.horarios_fim = horarios_fim;
	}

	public int getCod_turno() {
		return cod_turno;
	}

	public void setCod_turno(int cod_turno) {
		this.cod_turno = cod_turno;
	}

	public int getCod_dia() {
		return cod_dia;
	}

	public void setCod_dia(int cod_dia) {
		this.cod_dia = cod_dia;
	}

	public String getErro() {
		return erro;
	}

	public void setErro(String erro) {
		this.erro = erro;
	}

}
