package agendinha1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Pessoa_dao {
	String erro = "";
	
	public String getErro() {
		return erro;
	}

	public void setErro(String erro) {
		this.erro = erro;
	}

	public int salva_pessoa (usuario pessoa_recebida) {
		int cod_user = 0;
		try {
			this.erro = "";
            String url = "jdbc:postgresql://localhost:5432/agenda";
            String driver = "org.postgresql.Driver";
            String user = "postgres";
            String senha = "postgres";
            //sql = "";
            String sql = "insert into usuarios (nome, cpf, email, telefone, cep, senha, cod_inst, cod_funcao, login) values ('"+
            pessoa_recebida.getNome()
    				+"','"+pessoa_recebida.getCpf()+"','"+pessoa_recebida.getEmail()+"', '"+
    				pessoa_recebida.getTelefone()+"', '"+pessoa_recebida.getEnd().getCep()+"', '"+
    				pessoa_recebida.getSenha()+"','"+pessoa_recebida.getInst().getId()+"','"+
    				pessoa_recebida.getCod_func().getCod()+"','"+pessoa_recebida.getLogin()+"') ";
            
            Class.forName(driver);
            Connection MyConn = DriverManager.getConnection(url, user, senha);
               
            
            PreparedStatement inserirCadsp = MyConn.prepareStatement(sql);
                inserirCadsp.executeUpdate();
                inserirCadsp.close();
                sql = "select max(id) as id from usuarios";
	               
	              
                Statement MyStm = MyConn.createStatement();
                ResultSet m = MyStm.executeQuery(sql);
               
                    while (m.next()) {
                        cod_user = m.getInt("id");
                    }
               
                    m.close();
                    MyStm.close();
                    
            MyConn.close();
            
            MyConn.close();
        } catch (Exception e) {
            this.setErro(""+e);
            System.out.println("" + e);
        }
		return cod_user;
	}
	public void deleta_func (String func_recebido) {
		try {
			this.erro = "";
            String url = "jdbc:postgresql://localhost:5432/agenda";
            String driver = "org.postgresql.Driver";
            String user = "postgres";
            String senha = "postgres";
            //sql = "";
            String sql = "update usuarios set flg_excluido = true where id = '"+func_recebido+"'";
            
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
 
	public ArrayList<usuario> buscaDados(String dat_ini, usuario user) throws ClassNotFoundException, SQLException {
        ArrayList<usuario> list = new ArrayList<>();
        conexao conex = new conexao();
        String sql = "SELECT * FROM usuarios where cod_inst = "+user.getInst().getId()+ " and flg_excluido = false";
        Class.forName(conex.getDriver());
        Connection MyConn = DriverManager.getConnection(conex.getUrl(), conex.getUser(), conex.getSenha());
        Statement MyStm = MyConn.createStatement();
        ResultSet m = MyStm.executeQuery(sql);

        try {
            while (m.next()) {
                usuario cp = new usuario();
                cp.setId(m.getInt("id"));
                cp.setNome(m.getString("nome"));
                cp.setTelefone(m.getString("telefone"));
                cp.setEmail(m.getString("email"));
                cp.setCpf(m.getString("cpf"));
                cp.setSenha(m.getString("senha"));
                cp.setCod_func(m.getInt("cod_funcao"));
                cp.setLogin(m.getString("login"));;
               Instituicao tt = new Instituicao(); 
               tt.setId(m.getInt("cod_inst"));
                cp.setInst(tt);
                list.add(cp);
            }
            m.close();
            MyStm.close();
            MyConn.close();
         
        } catch (Exception e) {
        	this.setErro(""+e);
            e.printStackTrace(); 
        }
        return list;
    }
}

