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
                        <br>
                        <br>
                        <input type="text" class="form-control" name="t1" placeholder="New Password" />
                        <br>
                        <input type="submit" value="Change Password" class="btn btn-primary" name="b1" />
                        <%
                        if(request.getParameter("b1")!=null)
                        {
                            String pass=request.getParameter("t1");
                            Connection con=null;
                            Statement st;
                            try{
		Class.forName("com.mysql.jdbc.Driver");	
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mnnit","root","");
		st=con.createStatement();
		String uid=(String)session.getAttribute("usrid");
                                  out.println(uid);	
                                   String sql="update student set passwd='"+pass+"' where id="+Integer.parseInt(uid)+"";
                                   int res=st.executeUpdate(sql);
                                   if(res!=0)
                                       out.println("Password Changed");
                                   else
                                       out.println("Password Not Change");

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
