package agendinha1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Instituicao_dao {

		String erro = "";
		
		public String getErro() {
			return erro;
		}

		public void setErro(String erro) {
			this.erro = erro;
		}

		public int salva_instituicao (Instituicao instituicao_recebida) {
			int cod_inst = 0;
			try {
				this.erro = "";
				
	            String url = "jdbc:postgresql://localhost:5432/agenda";
	            String driver = "org.postgresql.Driver";
	            String user = "postgres";
	            String senha = "postgres";
	            //sql = "";
	            String sql = "insert into instituicao (nome, telefone, cep, endereco) values ('"+
	            instituicao_recebida.getNome()
	    				+"','"+instituicao_recebida.getTelefone()+"','"+instituicao_recebida.getEnd().getCep()+"', '"+
	    				instituicao_recebida.getEnd().getLogradouro()+"')";
	            System.out.println(sql);
	            Class.forName(driver);
	            Connection MyConn = DriverManager.getConnection(url, user, senha);
	               
	            
	            PreparedStatement inserirCadsp = MyConn.prepareStatement(sql);
	                inserirCadsp.executeUpdate();
	                inserirCadsp.close();
	                sql = "select id from instituicao where nome like '"+instituicao_recebida.getNome()+"' and telefone like '"+instituicao_recebida.getTelefone()+"' ";
	               
		              
	                Statement MyStm = MyConn.createStatement();
	                ResultSet m = MyStm.executeQuery(sql);
	               
	                    while (m.next()) {
	                        cod_inst = m.getInt("id");
	                    }
	               
	                    m.close();
	                    MyStm.close();
	                    
	            MyConn.close();
	        } catch (Exception e) {
	            this.setErro(""+e);
	            System.out.println("" + e);
	        }
			return cod_inst;
		}
	 
	    public ArrayList<Instituicao> buscaDados(String dat_ini) throws ClassNotFoundException, SQLException {
	        ArrayList<Instituicao> list = new ArrayList<>();
	        conexao conex = new conexao();
	        String sql = "SELECT * FROM instituicao";
	        Class.forName(conex.getDriver());
	        Connection MyConn = DriverManager.getConnection(conex.getUrl(), conex.getUser(), conex.getSenha());
	        Statement MyStm = MyConn.createStatement();
	        ResultSet m = MyStm.executeQuery(sql);

	        try {
	            while (m.next()) {
	                Instituicao cp = new Instituicao();
	                cp.setNome(m.getString("nome"));
	                cp.setTelefone(m.getString("telefone"));
	                
	                endereco endereco = new endereco();
	                endereco.setLogradouro(m.getString("endereco"));
	                endereco.setCep((m.getString("cep")));
	                cp.setEnd(endereco);
	                list.add(cp);
	            }
	            MyConn.close();
	            m.close();
	        } catch (Exception e) {
	            e.printStackTrace(); 
	        }
	        return list;
	    }
	}
