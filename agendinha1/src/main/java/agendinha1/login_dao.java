package agendinha1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class login_dao {
	usuario user_local = new usuario();
	private String erro; 
	
	public String getErro() {
		return erro;
	}

	

	public usuario Executa(usuario user_recebido) {
		usuario user_local = new usuario();
        try {
            
            this.erro = "";
            String url = "jdbc:postgresql://localhost:5432/agenda";
            String driver = "org.postgresql.Driver";
            String user = "postgres";
            String senha = "postgres";
            
            String sql = "SELECT instituicao.nome as nome_inst, * FROM usuarios, instituicao where email like '"+user_recebido.getEmail()+
            		"' and senha like '"+user_recebido.getSenha()+"' and instituicao.id = usuarios.cod_inst";
            //sql = "";
            Class.forName(driver);
            Connection MyConn = DriverManager.getConnection(url, user, senha);
            
            Statement MyStm = MyConn.createStatement();
			ResultSet m = MyStm.executeQuery(sql);
			while(m.next()){
				user_local.setEmail(m.getString("email"));
				user_local.setSenha(m.getString("senha"));
				Instituicao inst = new Instituicao();
				inst.setId(m.getInt("cod_inst"));
				inst.setNome(m.getString("nome_inst")); 
				Funcao funcao = new Funcao();
				funcao.setCod(m.getInt("cod_funcao"));
				user_local.setCod_func(funcao);
				user_local.setInst(inst);
			}
			
			if (user_local.getEmail().equals(user_recebido.getEmail()) && user_local.getSenha().equals(user_recebido.getSenha())) {
				user_local.setAprovado("Aprovado");
				
			}else {
				user_local = user_recebido;
				user_local.setAprovado("Reprovado");
				
			}
			MyStm.close();
			m.close();
            MyConn.close();
        } catch (Exception e) {
            this.setErro(""+e);
            
            System.out.println("" + e);
        }
        return user_local;
    }
	
	public void setErro(String erro) {
		this.erro = erro;
	}
	
}
