<%-- 
    Document   : editdeliverystatus
    Created on : Jul 3, 2019, 10:29:30 AM
    Author     : admin
--%>

<%-- 
    Document   : editcustomeraccount
    Created on : Jun 29, 2019, 12:08:41 PM
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
                </div>
            </div>
            
                
             <div class="row">
                <div class="col-lg-6">
                    <%
                        
                        String uid=request.getParameter("m");
                       Class.forName("com.mysql.jdbc.Driver");	
                        Connection cnn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
	      Statement stt=cnn.createStatement();  
                        ResultSet rs=stt.executeQuery("select * from account1 where mobile="+uid+"");
                        rs.next();
                    %>
                    
                    <form method="post" action="">
<table class="table">
<tr>
    <td colspan="2" class="bg-primary">
	Record Update Window
	</td>
</tr>
<tr>
	<td>First Name</td>
        <td><input type="text" value='<%= rs.getString(1) %>' readonly class="form-control" name="t1" /></td>
</tr>
<tr>
	<td>Middle Name </td>
	<td><input type="text" value='<%= rs.getString(2) %>' class="form-control" name="t2"  /></td>
</tr>
<tr>
	<td>Last Name</td>
	<td><input type="text" value='<%= rs.getString(3) %>' class="form-control" name="t3" /></td>
</tr>
<tr>
	<td>Mobile</td>
	<td><input type="text" readonly value='<%= rs.getString(4) %>' class="form-control" name="t4" /></td>
</tr>
<tr>
	<td>Password</td>
	<td><input type="text" value='<%= rs.getString(5) %>' class="form-control" name="t5" /></td>
</tr>

<tr>
	<td></td>
	<td><input type="submit" value="Update" name="b1" class="btn btn-primary" /></td>
</tr>
<tr>
<td colspan="2">
<%
if(request.getParameter("b1")!=null)
{
        try{
            String fname=request.getParameter("t1");
            String mname=request.getParameter("t2");
            String lname=request.getParameter("t3");
            String mob=request.getParameter("t4");
            String pass=request.getParameter("t5");
           // String cc=request.getParameter("t6");
            

                  Class.forName("com.mysql.jdbc.Driver");	
                  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
                  Statement st=cnn.createStatement();
                 String sql="update account1 set firstname='"+fname+"',middlename='"+mname+"',lastname='"+lname+"',mobile='"+mob+"',password='"+pass+"' where mobile='"+uid+"'";
                 int res=st.executeUpdate(sql);
                 if(res!=0)
                     response.sendRedirect("updatecustomerdatabase.jsp");
                 else
                     out.println("No Record Updated");
	}catch(Exception e)
	{
		out.println(e.toString());
	}

}
%>
</td>
</tr>
</table>
</form>

                
                
                </div>
            </div>
                
                
        </div>
    </body>
</html>

