<%
	String p=request.getParameter("pw");
	if(p.length()>10)
		out.println("<div style='color:green'>Strong</div>");
	else if(p.length()>=5 && p.length()<=10)
		out.println("<div style='color:yellow'>Medium</div>");
	else
		out.println("<div style='color:red'>Weak</div>");
%>