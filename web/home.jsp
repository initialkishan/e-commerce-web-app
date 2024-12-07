<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <br>Admin Menu<br>
                    <jsp:include page="header.jsp" />

                    
                    
                    <br>
                     <br>
        <jsp:include page="purchase.jsp" />
        <br>
        <jsp:include page="purchasemobile1.jsp" /><br>
        <jsp:include page="panel1.jsp" /><br>
        <jsp:include page="purchasemobile2.jsp" /><br>
        <jsp:include page="purchasemobile3.jsp" /><br>
        <jsp:include page="panel2.jsp" /><br>
                    
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
                                    <br>Customer Menu<br>
                    <jsp:include page="menucustomer.jsp" />
                </div>
            </div>
            
        </div>
    </body>
</html>
