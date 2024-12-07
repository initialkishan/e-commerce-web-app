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
                        int id=Integer.parseInt(request.getParameter("id"));
                 
                       Class.forName("com.mysql.jdbc.Driver");	
                        Connection cnn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mnnit","root","");
	      Statement stt=cnn.createStatement();  
                        ResultSet rs=stt.executeQuery("select * from student where id="+id+"");
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
	<td>User ID </td>
        <td><input type="text" value='<%= rs.getInt(1) %>' readonly class="form-control" name="t1" /></td>
</tr>
<tr>
	<td>Name </td>
	<td><input type="text" value='<%= rs.getString(2) %>' class="form-control" name="t2"  /></td>
</tr>
<tr>
	<td>Age</td>
	<td><input type="text" value='<%= rs.getInt(3) %>' class="form-control" name="t3" /></td>
</tr>
<tr>
	<td>Address</td>
	<td><input type="text" value='<%= rs.getString(4) %>' class="form-control" name="t4" /></td>
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

	int gid=Integer.parseInt(request.getParameter("t1"));
	String name=request.getParameter("t2");
	int age=Integer.parseInt(request.getParameter("t3"));
	String addr=request.getParameter("t4");

                  Class.forName("com.mysql.jdbc.Driver");	
                  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mnnit","root","");
	Statement st=cnn.createStatement();
                 String sql="update student set name='"+name+"',age="+age+",address='"+addr+"' where id="+gid+"";
                 int res=st.executeUpdate(sql);
                 if(res!=0)
                     response.sendRedirect("update.jsp");
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
