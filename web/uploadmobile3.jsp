<%-- 
    Document   : uploadmobile3
    Created on : Jun 29, 2019, 4:32:36 PM
    Author     : admin
--%>

<%-- 
    Document   : uploadmobile2
    Created on : Jun 29, 2019, 3:52:58 PM
    Author     : admin
--%>

<%-- 
    Document   : uploadmobile1
    Created on : Jun 29, 2019, 3:31:35 PM
    Author     : admin
--%>

<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>

<%

try
{
	String saveFile="";
	String path="";
	String contentType = request.getContentType();
	if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) 
	{
		DataInputStream in = new DataInputStream(request.getInputStream());
		int formDataLength = request.getContentLength();
		byte dataBytes[] = new byte[formDataLength];
		int byteRead = 0;
		int totalBytesRead = 0;
		while (totalBytesRead < formDataLength) 
		{
			byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
			totalBytesRead += byteRead;
		}
		String file = new String(dataBytes);
		saveFile = file.substring(file.indexOf("filename=\"") + 10);
		saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
		saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
		int lastIndex = contentType.lastIndexOf("=");
		String boundary = contentType.substring(lastIndex + 1,contentType.length());
		int pos;
		pos = file.indexOf("filename=\"");
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		int boundaryLocation = file.indexOf(boundary, pos) - 4;
		int startPos = ((file.substring(0, pos)).getBytes()).length;
		int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
		path="usrupload/"+saveFile;
		saveFile=config.getServletContext().getRealPath("/")+"usrupload/"+saveFile;
		File f = new File(saveFile);
		FileOutputStream fileOut = new FileOutputStream(f);
		fileOut.write(dataBytes, startPos, (endPos - startPos));
		fileOut.flush();
		fileOut.close();
                                   out.println("<br>File Uploaded");
                                   
                                   try{
                                    Class.forName("com.mysql.jdbc.Driver");	
                                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mnnit","root","");
        		
		Statement st=con.createStatement();
                String id=(String)session.getAttribute("productid");    
                out.println("Product Id="+id);
		String sql="update mobile3 set photourl='"+path+"' where product_id='"+id+"'";
		int res=st.executeUpdate(sql);
		if(res!=0)
		{
			out.println("<br>Profile Photo Updated");
		}
		else
		{
			out.println("<br>Product Photo Not Updated");
                        out.println("<br>Confirmation of getting product Id "+id);
		}
		
	}catch(Exception e)
	{
		out.println(e.toString());
	}
                                   
	}
}catch(Exception e)
{
	out.println(e.toString());
}
%>



