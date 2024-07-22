import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Demo {
    public static void main(String[] args) {
        String jdbcUrl = "jdbc:mysql://localhost:3306/yeafitness";
        String username = "root";
        String password = "zeynep";

        Connection connection =null ;
        Statement statement = null;
        ResultSet resultSet = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            connection = DriverManager.getConnection(jdbcUrl, username, password);

            statement = connection.createStatement();


            resultSet = statement.executeQuery("select * from kullanici where kullanici_id > 3 ");


            while (resultSet.next()) {
                System.out.println("ID: " + resultSet.getInt("kullanici_id"));
                System.out.println("Name: " + resultSet.getString("isim"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}