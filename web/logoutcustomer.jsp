<%-- 
    Document   : logoutcustomer
    Created on : Jul 2, 2019, 9:50:09 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%
            request.setAttribute("firstname", null);
            request.setAttribute("middlename", null);
            request.setAttribute("lastname", null);
            request.setAttribute("mobile", null);
            request.setAttribute("countrycode", null);
            session.invalidate();
            response.sendRedirect("index.jsp");
            %>
    </body>
</html>
