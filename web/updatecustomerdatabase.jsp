<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="script/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            
            <div class="row">
                <div class="col-lg-12">
                    <jsp:include page="header.jsp" />
                    
                    <br>
                    
                    <%
                        if(session.getAttribute("username")!=null)
                        {
                            String un=(String)session.getAttribute("username");
                            out.println("Welcome "+un);
                            out.println("<br>");
                        }
                        else
                            response.sendRedirect("adminindex.jsp");
                    %>
                </div>
            </div>
                
            <div class="row">
                <div class="col-lg-12">
                    
                    <table class="table table-bordered table-hover">
<tr>
	<td colspan="10" class="bg-primary">
		Customer Details
	</td>
</tr>
<tr class="bg-success">
	<td>First Name</td>
	<td>Middle Name</td>
	<td>Last Name</td>
	<td>Mobile</td>
        <td>Password</td>
        <td>Country Code</td>
                <td></td>
                <td></td>
                
</tr>
<%
	Connection con=null;
	Statement st;
	ResultSet rs;
	try{
		Class.forName("com.mysql.jdbc.Driver");	
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
		st=con.createStatement();
		String addr=(String)session.getAttribute("usraddress");
		rs=st.executeQuery("select * from account1");	
		while(rs.next())
		{
                        String uid=rs.getString(4);
                        %>
			<tr>
                            <td><% out.print(rs.getString(1)); %></td>
                            <td><% out.print(rs.getString(2)); %></td>
                            <td><% out.print(rs.getString(3)); %></td>
                            <td><% out.print(uid); %></td>
                            <td><% out.print(rs.getString(5)); %></td>
                            <td><% out.print(rs.getString(6)); %></td>
			
                        <td><a href="editcustomeraccount.jsp?m=<%=uid%>"><span class="glyphicon glyphicon-pencil" /></a></td>
        <td><a href="delete.jsp?id=<%=uid%>"><span class="glyphicon glyphicon-remove" /></a></td>
                                                   
                        
			</tr>
		<%
		}
	}catch(Exception e)
	{
		out.println(e.toString());
	}

%>
</table>

                    
                </div>
            </div>
            
        </div>
    </body>
</html>
