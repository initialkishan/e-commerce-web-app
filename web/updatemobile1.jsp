<%-- 
    Document   : updatemobile1
    Created on : Jun 28, 2019, 11:56:43 AM
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
                            response.sendRedirect("adminindex.jsp");
                    %>
                </div>
            </div>
                
            <div class="row">
                <div class="col-lg-12">
                    
                    <table class="table table-bordered table-hover">
<tr>
	<td colspan="9" class="bg-primary">
		Product Details
	</td>
</tr>
<tr class="bg-success">
	<td>Product ID</td>
	<td>Brand Name</td>
	<td>Price</td>
	<td>Discount %</td>
        <td>Offer price</td>
        <td>Detail</td>
                <td></td>
                <td></td>
                <td></td>
</tr>
<%
	Connection con=null;
	Statement st;
	ResultSet rs;
	try{
		Class.forName("com.mysql.jdbc.Driver");	
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mnnit","root","");
		st=con.createStatement();
		String addr=(String)session.getAttribute("usraddress");
		rs=st.executeQuery("select * from mobile1");	
		while(rs.next())
		{
                                                    int uid=rs.getInt(1);
			%>
			<tr>
			<td><% out.print(uid); %></td>
			<td><% out.print(rs.getString(2)); %></td>
			<td><% out.print(rs.getInt(3)); %></td>
                        <td><% out.print(rs.getInt(4)); %></td>
                        <td><% out.print(rs.getInt(5)); %></td>
			<td><% out.print(rs.getString(6)); %></td>
                        <td><a href="testmobile1.jsp?id=<%=uid%>"> Upload Photo</a></td>
                        <td><a href="edit.jsp?id=<%=uid%>"><span class="glyphicon glyphicon-pencil" /></a></td>
        <td><a href="deletemobile1.jsp?m=<%=uid%>"><span class="glyphicon glyphicon-remove" /></a></td>
                                                   
                        
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

