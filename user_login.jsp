<%-- 
    Document   : user_login
    Created on : 19 Mar, 2022, 4:33:39 AM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    
    String email=" ";
    String password=" ";
   
    if(request.getParameter("email").length()==0 || request.getParameter("password").length()==0){
        
        response.sendRedirect("index.jsp?All field required");
        
    }
    else{
        
         email=request.getParameter("email");
         password=request.getParameter("password");
        
          try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mp3","root","");
                Statement st=cn.createStatement(); 
                ResultSet rs=st.executeQuery("select * from user_login where email='"+email+"' AND password='"+password+"'");
                if(rs.next()){  
                    if(rs.getString("email").equals(email)){
                        if(rs.getString("password").equals(password)){
                            Cookie c=new Cookie("user",email);
                            c.setMaxAge(36000);
                            response.addCookie(c);
                            response.sendRedirect("user_index.jsp");
                        }
                        else{
                            
                             response.sendRedirect("index.jsp?invalid_password");
                        }
                      
                    }
                    else{
                        
                        
                         response.sendRedirect("index.jsp?invalid_email");
                    }
                }
                else{
                     response.sendRedirect("index.jsp?email_does't_exit");
                    
                }
              
              
              
          }
          catch(Exception e){
              out.print(e.getMessage()); 
          }
        
        
        
        
    }
    
    
    
    
    %>