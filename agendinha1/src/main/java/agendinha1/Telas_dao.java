package agendinha1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Telas_dao {

	String erro = "";
	
	public String getErro() {
		return erro;
	}

	public void setErro(String erro) {
		this.erro = erro;
	}

	public void salva_telas (Telas telas_recebida) {
		try {
			this.erro = "";
            String url = "jdbc:postgresql://localhost:5432/agenda";
            String driver = "org.postgresql.Driver";
            String user = "cedup";
            String senha = "cedup";
            //sql = "";
            String sql = "insert into telas (nome, link, icone) values ('"+
            		telas_recebida.getNome()
    				+"','"+telas_recebida.getLink()+"','"+telas_recebida.getIcone()+"')";
            
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
 
    public ArrayList<Telas> buscaDados(String cod_funcao) throws ClassNotFoundException, SQLException {
        ArrayList<Telas> list = new ArrayList<>();
        conexao conex = new conexao();
        String sql = "SELECT * FROM telas, acessos_tela where cod_tela = telas.id and cod_func = "+cod_funcao;
        Class.forName(conex.getDriver());
        Connection MyConn = DriverManager.getConnection(conex.getUrl(), conex.getUser(), conex.getSenha());
        Statement MyStm = MyConn.createStatement();
        ResultSet m = MyStm.executeQuery(sql);
        this.setErro(sql);

        try {
            while (m.next()) {
                Telas cp = new Telas();
                cp.setNome(m.getString("nome"));
                cp.setLink(m.getString("link"));
                cp.setIcone(m.getString("icone"));
                list.add(cp);

            }
        } catch (Exception e) {
            e.printStackTrace(); 
        }
        return list;
    }
	
}