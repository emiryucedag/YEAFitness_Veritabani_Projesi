import javax.swing.*;
import javax.xml.transform.stream.StreamSource;
import java.sql.*;

public class baglanti {
    private String username="root";
    private String password="1234";
    private String url="jdbc:mysql://localhost:3306/YeaFitness";


private Connection connection=null;
    ResultSet rs;
    PreparedStatement preparedStatement;

public baglanti() throws ClassNotFoundException, SQLException {
    try {
        Class.forName(".com.mysql.cj.jdbcDriver");
    } catch (ClassNotFoundException e) {
        System.out.println("driver çalışmadı."+e);
    }
    try {
        connection= DriverManager.getConnection(url,username,password);
        String sql="SELECT * FROM kullanici";
        preparedStatement=connection.prepareStatement(sql);
        rs=preparedStatement.executeQuery();

        while(rs.next()){
String isim=rs.getString("Isim");
String ID=rs.getString("Kullanici ID");

            System.out.println(isim+" "+ ID);

        }

        System.out.println("bağlantı başarılı");
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
}

}
