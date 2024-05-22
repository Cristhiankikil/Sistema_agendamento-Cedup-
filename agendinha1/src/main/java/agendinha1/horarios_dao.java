package agendinha1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class horarios_dao {
	String erro = "";
	
	public String getErro() {
		return erro;
	}

	public void setErro(String erro) {
		this.erro = erro;
	}

	public void salva_horario (horario horario_recebido) {
		try {
			this.erro = "";
            String url = "jdbc:postgresql://localhost:5432/agenda";
            String driver = "org.postgresql.Driver";
            String user = "postgres";
            String senha = "postgres";
            //sql = "";
            String sql = "insert into horarios (cod_inst, cod_dia, hora_inicio, hora_fim, cod_ambiente) values ("+horario_recebido.getCod_inst()+","+
            horario_recebido.getCod_dia()+",'"+horario_recebido.getHorarios_inicio()+"','"
            		+horario_recebido.getHorarios_fim()+"',"+horario_recebido.getAmbiente().getId()+")";
            System.out.println(sql);
            Class.forName(driver);
            Connection MyConn = DriverManager.getConnection(url, user, senha);
               
            
            PreparedStatement inserirCadsp = MyConn.prepareStatement(sql);
                inserirCadsp.executeUpdate();
                inserirCadsp.close();
            
            MyConn.close();
        } catch (Exception e) {
            this.setErro(""+e);
            System.out.println("" + e);
        }
	}
 
    public ArrayList<horario> buscaDados(String cod_dia,String cod_ambiente, usuario user) throws ClassNotFoundException, SQLException {
        ArrayList<horario> list = new ArrayList<>();
        conexao conex = new conexao();
        String sql = "SELECT * FROM horarios, ambientes where cod_dia = "+cod_dia+
        		" and cod_inst = "+user.getInst().getId()+
        		" and cod_ambiente = "+cod_ambiente+" and horarios.cod_ambiente = ambientes.id and "
        				+ "ambientes.cod_instituicao = horarios.cod_inst ";
        Class.forName(conex.getDriver());
        Connection MyConn = DriverManager.getConnection(conex.getUrl(), conex.getUser(), conex.getSenha());
        Statement MyStm = MyConn.createStatement();
        ResultSet m = MyStm.executeQuery(sql);
        this.setErro(sql);
        try {
            while (m.next()) {
                horario cp = new horario();
                cp.setCod_inst(m.getInt("cod_inst"));
                cp.setCod_dia(m.getInt("cod_dia"));
                ambientes a = new ambientes();
                a.setNome(m.getString("nome"));
                a.setId(m.getInt("cod_ambiente"));
                cp.setAmbiente(a);
                cp.setHorarios_inicio(m.getString("hora_inicio"));
                cp.setHorarios_fim(m.getString("hora_fim"));    
                
           
                list.add(cp);
            }
            MyConn.close();
        } catch (Exception e) {
            e.printStackTrace();
            this.setErro(sql+e);
        }
        return list;
    }
public ArrayList<Dia> buscaDias(String cod_dia) throws ClassNotFoundException, SQLException {
    ArrayList<Dia> list = new ArrayList<>();
    conexao conex = new conexao();
    String sql = "SELECT * FROM dias_semana";
    Class.forName(conex.getDriver());
    Connection MyConn = DriverManager.getConnection(conex.getUrl(), conex.getUser(), conex.getSenha());
    Statement MyStm = MyConn.createStatement();
    ResultSet m = MyStm.executeQuery(sql);

    try {
        while (m.next()) {
            Dia cp = new Dia();
            cp.setId(m.getInt("id"));
            cp.setNome(m.getString("dia"));
           
            list.add(cp);
        }
        MyConn.close();
    } catch (Exception e) {
        e.printStackTrace();
        this.setErro(""+e);
    }
    return list;
}



public void salva_agendamento (Agendamento horario_recebido) {
	try {
		this.erro = "";
        String url = "jdbc:postgresql://localhost:5432/agenda";
        String driver = "org.postgresql.Driver";
        String user = "postgres";
        String senha = "postgres";
        //sql = "";
        String sql = "insert into agendamentos (cod_inst, cod_user, cod_horario, observacao, obs_materiais) values ("+horario_recebido.getCod_inst()+","+
        horario_recebido.getId()+",'"+horario_recebido.getObservacao()+"','"
        		+horario_recebido.getObs_materiais()+"')";
        System.out.println(sql);
        Class.forName(driver);
        Connection MyConn = DriverManager.getConnection(url, user, senha);
           
        
        PreparedStatement inserirCadsp = MyConn.prepareStatement(sql);
            inserirCadsp.executeUpdate();
            inserirCadsp.close();
        
        MyConn.close();
    } catch (Exception e) {
        this.setErro(""+e);
        System.out.println("" + e);
    }
}

public ArrayList<Agendamento> buscaAgenda(String cod_agenda) throws ClassNotFoundException, SQLException {
    ArrayList<Agendamento> list = new ArrayList<>();
    conexao conex = new conexao();
    String sql = "SELECT * FROM agendamentos";
    Class.forName(conex.getDriver());
    Connection MyConn = DriverManager.getConnection(conex.getUrl(), conex.getUser(), conex.getSenha());
    Statement MyStm = MyConn.createStatement();
    ResultSet m = MyStm.executeQuery(sql);

    try {
        while (m.next()) {
            Agendamento cp = new Agendamento();
            cp.setId(m.getInt("id"));
            
           
            list.add(cp);
        }
        MyConn.close();
    } catch (Exception e) {
        e.printStackTrace();
        this.setErro(""+e);
    }
    return list;
}
}

