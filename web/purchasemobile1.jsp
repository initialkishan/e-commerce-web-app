<%-- 
    Document   : purchasemobile1
    Created on : Jul 1, 2019, 10:00:53 AM
    Author     : admin
--%>

<%-- 
    Document   : showmobile1
    Created on : Jun 29, 2019, 10:23:49 AM
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
                   
         <br>

                    
                </div>
            </div>
                
            <div class="row">
                <div class="col-lg-12">
       
                   
                    
                    <table class="table table-bordered table-hover">
<tr>
	<td colspan="7" class="bg-info">
		Product Details
	</td>
</tr>
<tr class="bg-success">
	<td>Product ID</td>
	<td>Brand Name</td>
	<td>Price</td>
	<td>Discount</td>
        <td>Offer price</td>
        <td>Detail</td>
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
                                   
		rs=st.executeQuery("select * from mobile1");
		
		while(rs.next())
		{
                    String pid=rs.getString(1);
                    String pn=rs.getString(2);
                    String p=rs.getString(3);
                    String d=rs.getString(4);
                    String op=rs.getString(5);
                    String detail=rs.getString(6);
			%>
			<tr>
			<td><% out.print(rs.getInt(1)); %></td>
                        <td><a href="buy.jsp?pid=<%=pid%>&pn=<%=pn%>&p=<%=p%>&d=<%=d%>&op=<%=op%>&detail=<%=detail%>"><% out.print(rs.getString(2)); %></a></td>
			<td><% out.print(rs.getInt(3)); %></td>
                        <td><% out.print(rs.getInt(4)); %></td>
                        <td><% out.print(rs.getInt(5)); %></td>
			<td><% out.print(rs.getString(6)); %></td>
                        <td><img src="<% out.print(rs.getString(7)); %>" width="150px" height="150px"/></td>
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
