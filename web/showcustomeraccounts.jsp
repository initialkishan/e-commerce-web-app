<%-- 
    Document   : showcustomeraccounts
    Created on : Jun 29, 2019, 10:31:06 AM
    Author     : admin
--%>

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
                            response.sendRedirect("index.jsp");
                    %>
                    
                </div>
            </div>
                
            <div class="row">
                <div class="col-lg-12">
       
                   
                    
                    <table class="table table-bordered table-hover">
<tr>
	<td colspan="6" class="bg-primary">
		User Details
	</td>
</tr>
<tr class="bg-success">
	<td>First Name</td>
	<td>Middle Name</td>
	<td>Last Name</td>
        <td>Mobile</td>
        <td>Password</td>
	<td>Country Code</td>
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
//		rs=st.executeQuery("select * from student where address='"+addr+"'");
                rs=st.executeQuery("select * from account1");
		
		while(rs.next())
		{
			%>
			<tr>
			<td><% out.print(rs.getString(1)); %></td>
			<td><% out.print(rs.getString(2)); %></td>
			<td><% out.print(rs.getString(3)); %></td>
			<td><% out.print(rs.getString(4)); %></td>
                        <td><% out.print(rs.getString(5)); %></td>
                        <td><% out.print(rs.getString(6)); %></td>
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
