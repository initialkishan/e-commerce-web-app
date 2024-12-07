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
                <div class="col-lg-6">
                
                    
                    <form method="get" action="">
<table class="table">
<tr>
    <td colspan="2" class="bg-primary">
	Record Insert Window
	</td>
</tr>
<tr>
	<td>User ID </td>
        <td><input type="text" class="form-control" name="t1" required /></td>
</tr>
<tr>
	<td>Name </td>
	<td><input type="text" class="form-control" name="t2" required /></td>
</tr>
<tr>
	<td>Age</td>
	<td><input type="text" class="form-control" name="t3" /></td>
</tr>
<tr>
	<td>Address</td>
	<td><input type="text" class="form-control" name="t4" /></td>
</tr>
<tr>
	<td></td>
	<td><input type="submit" value="Insert" name="b1" class="btn btn-primary" /></td>
</tr>
<tr>
<td colspan="2">
<%
if(request.getParameter("b1")!=null)
{
	int gid=Integer.parseInt(request.getParameter("t1"));
	String name=request.getParameter("t2");
	int age=Integer.parseInt(request.getParameter("t3"));
	String addr=request.getParameter("t4");

	Connection con=null;
	Statement st;
	try{
		Class.forName("com.mysql.jdbc.Driver");	
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mnnit","root","");
		st=con.createStatement();
		String sql="insert into student(id,name,age,address) values("+gid+",'"+name+"',"+age+",'"+addr+"')";
		int res=st.executeUpdate(sql);
		if(res!=0)
		{
			out.println("Record Inserted. <br> <a href='jdbc2.jsp'>For Detail Click Here</a>");
		}
		else
		{
			out.println("Record Not Inserted");
		}
		
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
