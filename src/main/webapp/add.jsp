<%@ page pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="connect.*" %>
<%
		String id = request.getParameter("id");
		String x = request.getParameter("x");
		String name = request.getParameter("name");
		String class_name = request.getParameter("class_name");

		String sql = "insert into t_score(id, name, class_name, score) values( '"+id+"', '"+name+"', '"+class_name+"', '"+x+"' )";
		DButil.connect();

		Connection conn = DButil.getSqlConnect();
		Statement stmt = conn.createStatement();
		int i = stmt.executeUpdate(sql);
		DButil.closeConnection();
		response.sendRedirect("table.jsp");
%>

