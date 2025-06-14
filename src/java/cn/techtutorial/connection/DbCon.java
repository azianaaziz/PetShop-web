package cn.techtutorial.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon {
    private static final String URL;

    static {
        String envUrl = System.getenv("MYSQL_URL");
        if (envUrl != null) {
            URL = envUrl;
        } else {
            URL = "jdbc:mysql://localhost:3306/petshop?user=root&password=admin";
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL);
    }
}
