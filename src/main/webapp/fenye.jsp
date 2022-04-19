<%@ page pageEncoding="utf-8"%>
<%
		String uri = request.getRequestURI();
		//uri = uri.substring(1);
		uri = "table.jsp";
%>

<center>
<form action="<%=uri%>>">
		共<%=totalPage%>页 第<%=xPage%>页 共<%=totalRecords%>记录 转到
		<select onchange="go(this.value)">
			<%
			for(int i = 1; i <= totalPage; i++){
				if(i > 25)break;
				if(i == xPage){
					out.println("<option selected>"+i+"</option>");
				}
				else
					out.println("<option>"+i+"</option>");
			}
			%>
		</select>
		页
		<input type="text" size = "4" name="x" />
			
		<hr>

		<input type="button"  <%=(xPage==1)?"disabled":""%> value="第一页" onclick = "go(<%=1%>)"/>		
		<input type="button"  <%=(xPage==1)?"disabled":""%> value="上一页" onclick = "go(<%=xPage-1%>)"/>
		<input type="button"  <%=(xPage==totalPage)?"disabled":""%> value="下一页" onclick = "go(<%=xPage+1%>)"/>
		<input type="button" <%=(xPage==totalPage)?"disabled":""%> value="最后一页" onclick = "go(<%=totalPage%>)"/>

</form>
</center>

<script>
	function go(x){
		var tmp = "<%=mode%>";
		if(tmp == "null"){
			window.location.href = "<%=uri%>?x=" + x;
		}
		else{
			window.location.href = "<%=uri%>?x=" + x + "&key=<%=key%>&mode=<%=mode%>";
		}
	}
</script>
