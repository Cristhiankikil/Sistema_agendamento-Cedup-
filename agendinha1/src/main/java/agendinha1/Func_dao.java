package agendinha1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Func_dao {
	String erro = "";
	
	public String getErro() {
		return erro;
	}

	public void setErro(String erro) {
		this.erro = erro;
	}

	public void salva_func (Funcionarios func_recebido) {
		try {
			this.erro = "";
            String url = "jdbc:postgresql://localhost:5433/agenda";
            String driver = "org.postgresql.Driver";
            String user = "postgres";
            String senha = "postgres";
            //sql = "";
            String sql = "insert into funcionarios (nome, nome_abv, cod_func, matricula, senha, cod_inst, cod_user) values ('"+
            func_recebido.getNome()
    				+"','"+func_recebido.getNome_abv()+"',"+func_recebido.getFunc().getCod()+", '"+
    				func_recebido.getMatricula()+"', '"+
    				func_recebido.getSenha()+"',"+func_recebido.getInst().getId()+","+func_recebido.getCod_user()+") ";
            
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
 
	public void deleta_func (String func_recebido) {
		try {
			this.erro = "";
            String url = "jdbc:postgresql://localhost:5433/agenda";
            String driver = "org.postgresql.Driver";
            String user = "postgres";
            String senha = "postgres";
            //sql = "";
            String sql = "update funcionarios set flg_excluido = true where id = '"+func_recebido+"'";
            
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
	
    public ArrayList<Funcionarios> buscaDados(String dat_ini) throws ClassNotFoundException, SQLException {
        ArrayList<Funcionarios> list = new ArrayList<>();
        conexao conex = new conexao();
        String sql = "SELECT * FROM funcionarios where flg_excluido = false";
        Class.forName(conex.getDriver());
        Connection MyConn = DriverManager.getConnection(conex.getUrl(), conex.getUser(), conex.getSenha());
        Statement MyStm = MyConn.createStatement();
        ResultSet m = MyStm.executeQuery(sql);

        try {
            while (m.next()) {
                Funcionarios cp = new Funcionarios();
                cp.setId(m.getInt("id"));
                cp.setNome(m.getString("nome"));
                cp.setNome_abv(m.getString("nome_abv"));
               Funcao tr = new Funcao();
               tr.setCod(m.getInt("cod_func"));
                cp.setFunc(tr);
                cp.setMatricula(m.getString("matricula"));
                cp.setSenha(m.getString("senha"));
               Instituicao tt = new Instituicao(); 
               tt.setId(m.getInt("cod_inst"));
                cp.setInst(tt);
                list.add(cp);
            }
            m.close();
            MyStm.close();
            MyConn.close();
         
        } catch (Exception e) {
            e.printStackTrace(); 
        }
        return list;
    }
}