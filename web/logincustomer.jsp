<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="script/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <img src="horizon.png" alt="Horizon 2019">
        <div class="container">
            
            <div class="row">
                <div class="col-lg-6">
                    <form method="get" action="">
                        <br>
                        <br>
                        <input type="text" class="form-control" name="t1" placeholder="User ID i.e. Mobile" />
                        <br>
                        <input type="password" class="form-control" name="t2" placeholder="Password" />
                        <br>
                        <input type="submit" value="Login" class="btn btn-primary" name="b1" />
                        <%
                        if(request.getParameter("b1")!=null)
                        {
                            String id=request.getParameter("t1");
                            String pw=request.getParameter("t2");
                            Connection con=null;
                            Statement st;
                            try{
		Class.forName("com.mysql.jdbc.Driver");	
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
		st=con.createStatement();
		String sql="select * from account1 where mobile="+id+" and password='"+pw+"'";
		ResultSet rs=st.executeQuery(sql);
		if(rs.next())
		{
                                                    session.setAttribute("firstname", rs.getString(1));
                                                    session.setAttribute("middlename", rs.getString(2));
                                                    session.setAttribute("lastname", rs.getString(3));
                                                    session.setAttribute("mobile", request.getParameter("t1"));
                                                    session.setAttribute("countrycode", rs.getString(6));
                                                    
			response.sendRedirect("index.jsp");
                        //String un=(String)session.getAttribute("username");
                           // out.println("Welcome "+un);
                        
		}
		else
		{
			out.println("Invalid User Name or Password");
		}
		
	}catch(Exception e)
	{
		out.println(e.toString());
	}

                        }
                        
                        %>
                        
                    </form>
                </div>
            </div>
            
        </div>
    </body>
</html>
