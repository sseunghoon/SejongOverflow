package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
	public static Connection getConnection() {
		try {
			/* 옛날 진짜 서버용 */
//			String dbURL="jdbc:mysql://localhost:3306/SnS?serverTimezone=UTC";
//			String dbID="root";
//			String dbPassword="root";
//			Class.forName("com.mysql.cj.jdbc.Driver");
//			return DriverManager.getConnection(dbURL,dbID,dbPassword);
			Class.forName("org.mariadb.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mariadb://localhost:3306/SejongOverflow", "root", "1234");
			return connection;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
