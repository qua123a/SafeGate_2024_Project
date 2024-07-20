package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {

    private final String url = "jdbc:mysql://localhost:3306/shoestore"; // Thay đổi URL nếu cần
    private final String user = "root"; // Thay đổi username nếu cần
    private final String password = "Quandz1105*"; // Thay đổi mật khẩu nếu cần

    public Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException e) {
            throw new SQLException(e);
        }
    }
}
