<%-- 
    Document   : delete
    Created on : Jun 22, 2019, 4:45:50 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                                    int id=Integer.parseInt(request.getParameter("id"));

        	Connection con=null;
	Statement st;
	try{
		Class.forName("com.mysql.jdbc.Driver");	
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mnnit","root","");
		st=con.createStatement();
		String sql="delete from student where id="+id+"";

		int res=st.executeUpdate(sql);
		if(res!=0)
		{
			response.sendRedirect("update.jsp");
		}
		else
		{
			out.println("Record Not Deleted");
		}
		
	}catch(Exception e)
	{
		out.println(e.toString());
	}

        %>
    </body>
</html>
