<%--
    Document   : index
    Created on : Jun 29, 2019, 5:37:39 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body><img src="horizon.png" alt="Horizon 2019">
       <% 
           if(session.getAttribute("firstname")!=null)
           {
           String un=(String)session.getAttribute("firstname");
      // if (un!=null)
       out.println("Welcome "+un);
         %>
             <jsp:include page="menucustomer.jsp" />
        
        <%
            }
            else
    {
%>

 <jsp:include page="menuguest.jsp" /><br>
 <%
     }
%>
        <jsp:include page="purchase.jsp" /><br>
        <jsp:include page="purchasemobile1.jsp" /><br>
        <jsp:include page="panel1.jsp" /><br>
        <jsp:include page="purchasemobile2.jsp" /><br>
        <jsp:include page="purchasemobile3.jsp" /><br>
        <jsp:include page="panel2.jsp" /><br>
        <a href="adminindex.jsp">Devloper Login</a>
    </body>
</html>

