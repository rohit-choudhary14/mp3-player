<%-- 
    Document   : logout
    Created on : 20 Mar, 2022, 8:55:00 AM
    Author     : rohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   Cookie c=new Cookie("user"," ");
   c.setMaxAge(0);
   response.addCookie(c);
    response.sendRedirect("index.jsp");
    
    
    
    %>