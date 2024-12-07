<%-- 
    Document   : buy
    Created on : Jul 1, 2019, 1:18:39 PM
    Author     : admin
--%>

<%@ page import="java.sql.*" %>
<html>
<head>
    
<title>My cart</title>
   <link href="css/bootstrap.min.css" rel="stylesheet">
   <script src="script/jquery.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
<script language = "javascript">
</script>
</head>
<body>
    <img src="horizon.png" alt="Horizon 2019">
           <% 
           if(session.getAttribute("firstname")!=null)
           {
           String un=(String)session.getAttribute("firstname");
      // if (un!=null)
       out.println("Welcome "+un);
           }
           else response.sendRedirect("customerlogin.jsp");
         %>
<div class="container">
<div class="row">
<div class="col-md-4">
<br>
<br>
<div class="panel-group">
  <div class="panel panel-default">
    <div class="panel-body">
        <%
            String pid=request.getParameter("pid");
             String pn=request.getParameter("pn");
        int p=Integer.parseInt(request.getParameter("p"));
        int d=Integer.parseInt(request.getParameter("d"));
        int op=Integer.parseInt(request.getParameter("op"));
        String detail=request.getParameter("detail");
        %>
<form name="f1" method="post" action="" >

	
Buy<br><br>
<table>
<tr>
	<td>Enter Quantity</td>
</tr>
<tr>
    <td><input type = "text" name = "Quantity" class="form-control" placeholder = "Quantity" required/></td>
    <td></td>
</tr>
<tr>
	<td>Enter Date</td>
</tr>
<tr>
	<td><input type = "text" class="form-control" name = "date" placeholder = "dd/mm/yyyy" required />
	<td></td>
</tr>
         
     Enter Address<br>
		<input type = "text" class="form-control" name = "DeliveryAddress" />
		</p>
		
		
<td colspan="2">
<%
if(request.getParameter("b1")!=null)
{
       
       
        String da=request.getParameter("DeliveryAddress");
        String q=request.getParameter("Quantity");
        String un=(String)session.getAttribute("firstname");
        String mn=(String)session.getAttribute("middlename");
        String ln=(String)session.getAttribute("lastname");
        String mob=(String)session.getAttribute("mobile");
        String cc=(String)session.getAttribute("countrycode");
        String date=request.getParameter("date");
        //out.println(pid);
         //out.println(pn);
         // out.println(p); 
          //out.println(d);
          
       // out.println(da);
        //out.println(mob);
       
	Connection con=null;
	Statement st;
	try{
		Class.forName("com.mysql.jdbc.Driver");	
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mnnit","root","");
		st=con.createStatement();
		String sql="insert into buy (product_id,brand_name,price,discount,offerprice,detail,firstname,middlename,lastname,mobile,countrycode,deliveryaddress,quantity,date)"
                        + " values('"+pid+"','"+pn+"',"+p+","+d+","+op+",'"+detail+"','"+un+"','"+mn+"','"+ln+"','"+mob+"','"+cc+"','"+da+"',"+q+",'"+date+"')";
		int res=st.executeUpdate(sql);
		if(res!=0)
		{
			out.println("Yay!!<br>Thank you for shopping with us.<br> Your Order is Placed!");
                        out.println("Your order will be shipped within 6 working days!");
                        
                }
		else
		{
			out.println("Order not Placed");
		}
		
	}catch(Exception e)
	{
		out.println(e.toString());
	}

}
%>
</table>
<br>
<input type = "submit" class="btn btn-warning btn-lg btn-block" name = "b1" value = "Buy" />
</form>
</div>
  </div>
  
</div>

</div>
</div>
</div> 	
</body>
</html>


