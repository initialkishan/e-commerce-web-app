<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="script/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <img src="horizon.png" alt="Horizon 2019" align="center">
        <div class="container">
            
            <div class="row">
                <div class="col-lg-6">
                    <form method="get" action="">
                        <br>
                        <br>
                        <input type="text" class="form-control" name="t1" placeholder="User ID" />
                        <br>
                        <input type="password" class="form-control" name="t2" placeholder="Password" />
                        <br>
                        <input type="submit" value="Login" class="btn btn-primary" name="b1" />
                        <%
                        if(request.getParameter("b1")!=null)
                        {
                            int id=Integer.parseInt(request.getParameter("t1"));
                            String pw=request.getParameter("t2");
                            Connection con=null;
                            Statement st;
                            try{
		Class.forName("com.mysql.jdbc.Driver");	
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mnnit","root","");
		st=con.createStatement();
		String sql="select * from student where id="+id+" and passwd='"+pw+"'";
		ResultSet rs=st.executeQuery(sql);
		if(rs.next())
		{
                                                    session.setAttribute("username", rs.getString(2));
                                                    session.setAttribute("usraddress", rs.getString(4));
                                                    session.setAttribute("usrid", request.getParameter("t1"));
			response.sendRedirect("home.jsp");
		}
		else
		{
			out.println("Invalid User Name or Passwd");
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
