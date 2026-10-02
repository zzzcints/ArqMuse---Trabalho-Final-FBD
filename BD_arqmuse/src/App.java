import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class App {
    public static void main(String[] args) {
        String url = "jdbc:postgresql://localhost:5432/postgres";
        String usuario = "postgres"; 
        String senha = "ufc6548"; 

        System.out.println("Tentando conectar ao banco de dados PostgreSQL...");

        try {
            Class.forName("org.postgresql.Driver");

            try (Connection conexao = DriverManager.getConnection(url, usuario, senha);
                 Statement statement = conexao.createStatement()) {
                
                System.out.println("Conexão estabelecida com sucesso!");
                
                ResultSet resultSet = statement.executeQuery("SELECT version();");
                if (resultSet.next()) {
                    System.out.println("Versão do PostgreSQL: " + resultSet.getString(1));
                }

            }
        } catch (ClassNotFoundException e) {
            System.out.println("Erro: Driver JDBC do PostgreSQL não foi encontrado na pasta lib/!");
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("Erro ao conectar: " + e.getMessage());
            e.printStackTrace();
        }
    }
}