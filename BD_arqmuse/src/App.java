import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class App {
    public static void main(String[] args) {
        // Altere "localhost" se o banco estiver em outro servidor
        // Mude o usuário e coloque a senha que você definiu na instalação do MySQL
        String url = "jdbc:mysql://localhost:3306/";
        String usuario = "arqmuse"; 
        String senha = "ufc6548"; // ⚠️ coloque a senha do seu MySQL aqui!

        System.out.println("Tentando conectar ao banco de dados...");

        try (Connection conexao = DriverManager.getConnection(url, usuario, senha);
             Statement statement = conexao.createStatement()) {
            
            System.out.println("Conexão estabelecida com sucesso!");
            
            // Executa um comando para ler a versão do banco instalado
            ResultSet resultSet = statement.executeQuery("SELECT VERSION()");
            if (resultSet.next()) {
                System.out.println("Versão do MySQL: " + resultSet.getString(1));
            }

        } catch (Exception e) {
            System.out.println("Erro ao conectar: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
