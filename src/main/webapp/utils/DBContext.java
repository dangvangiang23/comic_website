
package utils;

import dal.DAO;
import model.Account;
import model.Comic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBContext {
    protected Connection connection;
    public DBContext()
    {
        try {
            // Edit URL , username, password to authenticate with your MS SQL Server
          connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;" +
                    "databaseName=WebTruyenTranh;" +
                    "encrypt=true;trustServerCertificate=true", "sa", "123456789");

        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    public static void main(String[] args) {
        DBContext db = new DBContext();
        Connection d = db.connection;
        //ginachann 123
        DAO dao = new DAO();
    Account c = dao.findAccount("ginachann", "123");
        System.out.println(c.getUsername());


    }

}
