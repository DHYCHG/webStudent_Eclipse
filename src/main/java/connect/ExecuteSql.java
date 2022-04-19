package connect;

import java.sql.*;

public class ExecuteSql extends DButil{
	private PreparedStatement pstmt;
	private Statement stmt;
	
	public ResultSet pExecuteSelect(String sql, String[] s_string, int num) {
		ResultSet rs = null;
		int count = 1;
		try {
			pstmt = conn.prepareStatement(sql);
			for (String string : s_string) {
				pstmt.setString(count, string);
				count++;
			}
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("pselect error");
			e.printStackTrace();
		}
		return rs;
	}
}
