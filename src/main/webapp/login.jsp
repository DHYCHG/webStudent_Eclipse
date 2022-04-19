<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="connect.*" %>
<%@ page import="java.sql.*" %>
<%

	String[] s_string = new String[2];
	s_string[0] = request.getParameter("x");
	s_string[1] = request.getParameter("y");
	
	String sql = "select * from t_user where username= ? and password= ? ";
	DButil.connect();
	ExecuteSql exec = new ExecuteSql();
	ResultSet rs = exec.pExecuteSelect(sql, s_string, 2);
	if(rs.next()){
		response.sendRedirect("table.jsp");
	}
	else{
		response.sendRedirect("error.jsp");
	}
	DButil.closeConnection();

%>
