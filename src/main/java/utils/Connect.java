package utils;

import dal.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {
    public static Connection getConnection() {

        try {
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           // Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;" +
                    "databaseName=WebTruyenTranh;" +
                    "encrypt=true;trustServerCertificate=true", "sa", "123456789");
            System.out.println("connect successful!");
            return connection;
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        Connection connection = Connect.getConnection();
        System.out.println(connection);
               DAO d = new DAO();
        //Account a = new Account();
        System.out.println(d.findAccount("ginachann", "123").getUsername());
    }
}
