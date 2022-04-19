<%@ page pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="connect.*" %>
<%		
		String id = request.getParameter("id");
		String x = request.getParameter("x");

		String sql = "update t_score set score="+x+" where id="+id;
		DButil.connect();

		Connection conn = DButil.getSqlConnect();
		Statement stmt = conn.createStatement();
		int i = stmt.executeUpdate(sql);
		DButil.closeConnection();
		response.sendRedirect("table.jsp");
%>

