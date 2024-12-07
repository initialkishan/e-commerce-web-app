<%-- 
    Document   : testmobile2
    Created on : Jun 29, 2019, 3:52:07 PM
    Author     : admin
--%>

<%-- 
    Document   : testmobile1
    Created on : Jun 29, 2019, 3:30:25 PM
    Author     : admin
--%>

<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<html>
        <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="script/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
<body>
    <div class="panel-group">
  <div class="panel panel-default">
    <div class="panel-body">
       
	<form action="uploadmobile2.jsp" method="post" enctype="multipart/form-data">
             <%
            String id=request.getParameter("id");
           // out.println(id);
            session.setAttribute("productid", id);
            %>
	<table>
	
            <th>Please Select File For Upload</th>

            <tr>
        
        
        
		<td>
			 <input class="form-control" name="file" type="file" id="file" />
		</td>
	

	<tr>
		<td></td>
		<td>
		<input type="submit" name="b1" class="form-control" value="Submit"/>
		<input type="reset" name="Reset" class="form-control" value="Reset"/>
		</td>
	</tr>
	</table>
	</form>
    </div>
  </div>
    </div>                        
    
</body>

</html>

