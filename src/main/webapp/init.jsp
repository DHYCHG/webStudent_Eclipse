<%@ page import="java.sql.*" %>
<%@ page import="connect.*" %>
<%@ page pageEncoding="utf-8"%>
<%
	DButil.connect();
	Connection con = DButil.getSqlConnect();
	//创建语句
	Statement stmt = con.createStatement();
	String cleanSql = "drop table if exists t_score";
	String cleanSql2 = "drop table if exists t_user";
	String createSql = "create table t_score(ID int,name varchar(20),class_name varchar(20),score float)";
	String createSql2 = "create table t_user(username varchar(20) primary key, password varchar(20) not null)";
	
	try{
		stmt.execute(cleanSql);
		stmt.execute(cleanSql2);
		stmt.execute(createSql);
		stmt.execute(createSql2);
	}
	catch(Exception ex){
		out.println(ex.toString());
	}
	
	String a = "";
	String b = "";
	int c = 0;
	String clas[] = {"语文", "数学", "英语"};
	for(int i = 1; i <= 500; i++){
		a = "张" + i;
		b = clas[(int)(Math.random()*3)]; // 0 1 2
		c = 60 + (int)(Math.random()*41);
		String sql = "insert into t_score(ID, name, class_name, score) values('" + i + "' , '" + a + "', '" + b + "', " + c + ")";
		stmt.executeUpdate(sql); // 更新了 多少行
	}
	
	String sql2 = "insert into t_user(username, password) values('admin', '12345')";
	stmt.executeUpdate(sql2);
	sql2 = "insert into t_user(username, password) values('19063228', '11223344')";
	stmt.executeUpdate(sql2);

	con.close();
%>
<html>
<body>
	<center>
		<h3>信息初始化成功</h3>
		<table width="80%" border=1>
		<tr align="center">
			<th>用户名</th>
			<th>密码</th>
		</tr>
		<tr align="center">
			<th>admin</th>
			<th>12345</th>
		</tr>
		<tr align="center">
			<th>19063228</th>
			<th>11223344</th>
		</tr>
		</table>
		<a href="index.html">点我返回</a>
	</center>
</body>
</html>


