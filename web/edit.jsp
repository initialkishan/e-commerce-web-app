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
                       
                 
                       Class.forName("com.mysql.jdbc.Driver");	
                        Connection cnn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mnnit","root","");
	      Statement stt=cnn.createStatement();  
                        ResultSet rs=stt.executeQuery("select * from mobile");
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
            <%
            String id=request.getParameter("id");
            //out.println(id);
            session.setAttribute("productid", id);
            %>
	<td>Product ID </td>
        <td><input type="text" value='<%= id %>' readonly class="form-control" name="t1" /></td>
</tr>
<tr>
	<td>Brand Name </td>
	<td><input type="text" value='<%= rs.getString(2) %>' class="form-control" name="t2"  /></td>
</tr>
<tr>
	<td>Price</td>
	<td><input type="text" value='<%= rs.getInt(3) %>' class="form-control" name="t3" /></td>
</tr>
<tr>
	<td>Discount</td>
	<td><input type="text" value='<%= rs.getInt(4) %>' class="form-control" name="t4" /></td>
</tr>
<tr>
	<td>Detail</td>
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

	String gid=request.getParameter("t1");
	String name=request.getParameter("t2");
	int price=Integer.parseInt(request.getParameter("t3"));
        int d=Integer.parseInt(request.getParameter("t4"));
	String detail=request.getParameter("t5");
        int disc=Integer.parseInt(request.getParameter("t4"));
        int offerprice=(price-((price*disc)/100));

                  Class.forName("com.mysql.jdbc.Driver");	
                  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mnnit","root","");
	Statement st=cnn.createStatement();
                 String sql="update mobile set brand_name='"+name+"',price="+price+",discount="+d+",offerprice="+offerprice+",detail='"+detail+"' where product_id="+gid+"";
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
