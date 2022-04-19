<%@ page pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="connect.*" %>
<%
		String x = request.getParameter("x");
		String sql = "delete from t_score where id="+x;
		DButil.connect();

		Connection conn = DButil.getSqlConnect();
		Statement stmt = conn.createStatement();
		int i = stmt.executeUpdate(sql);
		DButil.closeConnection();
		response.sendRedirect("table.jsp");
%>

