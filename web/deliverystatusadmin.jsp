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
	<td colspan="16" class="bg-primary">
		Order Details
	</td>
</tr>
<tr class="bg-success">
	<td>Product ID</td>
	<td>Brand Name</td>
	<td>Price</td>
	<td>Discount %</td>
        <td>Offer price</td>
        <td>Detail</td>
        <td>First name</td>
        <td>Middle name</td>
        <td>Last name</td>
        <td>Mobile</td>
        <td>Country code</td>
        <td>Delivery Address</td>
        <td>Delivery Status</td>
        <td>Quantity</td>
        <td>Date</td>
        <td></td>
<!--        <td></td>-->
</tr>
<%
	Connection con=null;
	Statement st;
	ResultSet rs;
	try{
		Class.forName("com.mysql.jdbc.Driver");	
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mnnit","root","");
		st=con.createStatement();
		
		rs=st.executeQuery("select * from buy");	
		while(rs.next())
		{
                        String uid=rs.getString(1);
                        %>
			<tr>
			<td><% out.print(rs.getString(1)); %></td>
			<td><% out.print(rs.getString(2)); %></td>
			<td><% out.print(rs.getInt(3)); %></td>
                        <td><% out.print(rs.getInt(4)); %></td>
                        <td><% out.print(rs.getInt(5)); %></td>
			<td><% out.print(rs.getString(6)); %></td>
                        <td><% out.print(rs.getString(7)); %></td>
                        <td><% out.print(rs.getString(8)); %></td>
                        <td><% out.print(rs.getString(9)); %></td>
                        <td><% out.print(rs.getString(10)); %></td>
                        <td><% out.print(rs.getString(11)); %></td>
                        <td><% out.print(rs.getString(12)); %></td>
                        <td><% out.print(rs.getString(13)); %></td>
                        <td><% out.print(rs.getInt(14)); %></td>
                        <td><% out.print(rs.getString(15)); %></td>
                        
                        
                        
                        
                        
                        
<!--                        <td><a href="edit.jsp?id=<%=uid%>"><span class="glyphicon glyphicon-pencil" /></a></td>-->
<!--        <td><a href="deletemobile.jsp?m=<%=uid%>"><span class="glyphicon glyphicon-remove" /></a></td>-->
                                                   
                        
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
