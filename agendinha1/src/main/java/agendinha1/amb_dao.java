package agendinha1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class amb_dao {
	String erro = "";
	
	
	public String getErro() {
		return erro;
	}

	public void setErro(String erro) {
		this.erro = erro;
	}

	public void salva_ambientes (ambientes ambientes_recebida) {
		try {
			this.erro = "";
            String url = "jdbc:postgresql://localhost:5432/agenda";
            String driver = "org.postgresql.Driver";
            String user = "postgres";
            String senha = "postgres";
            //sql = "";
            String sql = "insert into ambientes (tipo, nome, identificacao, cod_instituicao) values ('"+
            ambientes_recebida.getTipo()
    				+"','"+ambientes_recebida.getNome()+"','"+ambientes_recebida.getIdentificacao()+"',"
            +ambientes_recebida.getCod_instituicao()+")";
            
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
 
    public ArrayList<ambientes> buscaDados(String dat_ini) throws ClassNotFoundException, SQLException {
        ArrayList<ambientes> list = new ArrayList<>();
        conexao conex = new conexao();
        String sql = "SELECT * FROM ambientes";
        Class.forName(conex.getDriver());
        Connection MyConn = DriverManager.getConnection(conex.getUrl(), conex.getUser(), conex.getSenha());
        Statement MyStm = MyConn.createStatement();
        ResultSet m = MyStm.executeQuery(sql);

        try {
            while (m.next()) {
                ambientes cp = new ambientes();
                cp.setTipo(m.getString("tipo"));
                cp.setNome(m.getString("nome"));
                cp.setId(m.getInt("id"));
                cp.setCod_instituicao(m.getInt("cod_instituicao"));
                
                list.add(cp);
            }
            MyConn.close();
        } catch (Exception e) {
            e.printStackTrace(); 
        }
        return list;
    }
}
