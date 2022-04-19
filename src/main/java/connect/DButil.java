package connect;

import java.sql.*;

public class DButil {
	
	private static final String url = "jdbc:mysql://localhost:3306/web_student";
	private static final String username = "root";
	private static final String password = "12345";
	public static Connection conn = null;
	
	public static void connect(){
		try {
			//加载驱动
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			//获得数据库连接
			conn = DriverManager.getConnection(url, username , password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static Connection getSqlConnect() {
		return conn;
	}
	
	public static void closeConnection() {
		try {
			if(conn!=null)
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("关闭失败");
			e.printStackTrace();
		}
	}
}
