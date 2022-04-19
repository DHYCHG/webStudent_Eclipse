<%@ page import="java.sql.*" %>
<%@ page import="connect.*" %>
<%@ page pageEncoding="utf-8"%>

<html>
	<head>
		<title>学生成绩表</title>
	</head>
	
	<body>
		<center>
		
		<h2>学生成绩表</h2>
		<hr>
			<form action="table.jsp">
				<tr align="center">
					<th>【查询】 </th>
					<th>关键字: </th>
					<th width=40><input type="text" name="key"></th>
					<th>查询方式: </th>
					<th width=40>
						<select name="mode">
							<option value="ID">学号</option>
							<option value="name">姓名</option>
							<option value="class_name">课程</option>
							<option value="score">成绩</option>
						</select>
					</th>
					<th size=4 width=40><input type="submit" value="查询"></th>
				</tr>
			</form>
		<hr>	
			<form action="add.jsp">
				<tr align="center">
					<th>【添加】 </th>
					<th>学号: </th>
					<th width=40><input type="text" name="id"></th>
					<th>姓名: </th>
					<th width=40><input type="text" name="name"></th>
					<th>科目: </th>
					<th width=40>
						<select name="class_name">
							<option>语文</option>
							<option>数学</option>
							<option>英语</option>
						</select>
					</th>
					<th>成绩: </th>
					<th width=40><input type="text" name="x"></th>
					<th size=4 width=40><input type="submit" value="添加一个学生成绩"></th>
				</tr>
			</form>
		<hr>
		</center>

		<center>
		<table width="80%" border=1>
			<tr align="center">
				<th>学号1</th>
				<th>姓名</th>
				<th>科目</th>
				<th>成绩</th>
				<td>管理</td>
				<td>管理</td>
			</tr>
			
			<%
			String key = request.getParameter("key");
			String mode = request.getParameter("mode");
			String sql = null;
			String str = null;
			
			if(mode==null){
				sql = "select * from  t_score";
				str = "select count(*) from t_score";
			}
			else{

				sql = "select * from t_score where " + mode + " like " + "'%" + key + "%'" ;
				str = "select count(*) from t_score where " + mode + " like " + "'%" + key + "%'" ;
			}			

			DButil.connect();
	
			Connection conn = DButil.getSqlConnect();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);			

			int a = 0;
			String b = "";
			String c = "";
			int d = 0;
			
			int pageSize = 25;
			int xPage = 1;
			try{
				xPage = Integer.parseInt(request.getParameter("x"));
			}
			catch(Exception ex){
		
			}
			Statement stmt1 = conn.createStatement();	
			ResultSet rs1 = stmt1.executeQuery(str);		
			rs1.next();
			
			int totalRecords = rs1.getInt(1);
			int totalPage;//= (totalRecords / pageSize) + 1;
			
			if(totalRecords % pageSize == 0){
				totalPage = (totalRecords / pageSize);
			}
			else{
				totalPage = (totalRecords / pageSize) + 1;
			}

			if(xPage < 1)
				xPage = 1;
			if(xPage > totalPage)
				xPage = totalPage;			

			for (int i = 0; i < pageSize*(xPage-1); i++){
				rs.next();
			}			

			for (int i = 0; i < pageSize; i++){
				
				if(rs.next()){
					a = rs.getInt(1);
					b = rs.getString(2);
					c = rs.getString(3);
					d = rs.getInt(4);
				}
				else{
					break;
				}
			%>
				<form action = "update.jsp">
				<tr align = "center">
					<th><%=a%></th>
					<input type="hidden" name="id" value="<%=a%>" />
					<th><%=b%></th>
					<th><%=c%></th>
					<th width=60><input type="text" value="<%=d%>" name="x"></th>
					<th size = 4 width = 60><input type="submit" value = "修改"></th>
					<th width = 60><input type="button" value = "删除" onclick="del(<%=a%>)"></th>
				</tr>
				</form>
			<%
			}
			rs.close();
			rs1.close();
			conn.close();
			%>
		</table>
		</center>
		<hr>

		<script>
			function del(y){
				window.location.href = "del.jsp?x="+y;
			}
		</script>
		<%@include file = "fenye.jsp"%>
		<center>
		<a href="index.html">退出登录</a>
		</center>
	</body>
</html>
