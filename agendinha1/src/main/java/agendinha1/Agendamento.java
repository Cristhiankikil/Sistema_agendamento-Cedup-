package agendinha1;

import java.util.Date;

public class Agendamento extends horario {

	String observacao = "";
	String obs_materiais = "";
	usuario user_agendamento = new usuario();
	Date data_agendamento = new Date();


	public String getObservacao() {
		return observacao;
	}
	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}
	public String getObs_materiais() {
		return obs_materiais;
	}
	public void setObs_materiais(String obs_materiais) {
		this.obs_materiais = obs_materiais;
	}
	public usuario getUser_agendamento() {
		return user_agendamento;
	}
	public void setUser_agendamento(usuario user_agendamento) {
		this.user_agendamento = user_agendamento;
	}
	public Date getData_agendamento() {
		return data_agendamento;
	}
	public void setData_agendamento(Date data_agendamento) {
		this.data_agendamento = data_agendamento;
	}
	
	
	
}
