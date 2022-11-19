<%-- 
    Document   : fav
    Created on : 19 Mar, 2022, 5:04:11 PM
    Author     : rohit
--%>
<%@page contentType="text/html" import="java.sql.*,java.util.*"pageEncoding="UTF-8"%> 
<%
    
    
    String song_code=" ";
    String album_code=" ";
    String email=" ";
   
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("user")){
            email=c[i].getValue(); 
        }
        
        
    }
    if(email!=null){
                     if(request.getParameter("song_code").length()!=0  && request.getParameter("album_code").length()!=0){
                          song_code=request.getParameter("song_code"); 
                          album_code=request.getParameter("album_code");
                         try{
                               String color="red";
                               Class.forName("com.mysql.jdbc.Driver");
                               Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mp3","root","");
                               Statement st=cn.createStatement();
                               ResultSet rs=st.executeQuery("select  * from  fav where album_code='"+album_code+"' AND email='"+email+"' AND song_code='"+song_code+"' ");
                               if(rs.next()){
                                    if(st.executeUpdate("delete from fav where album_code='"+album_code+"' AND email='"+email+"' AND song_code='"+song_code+"'")>0){
                                        
                                        out.print("white");
                                    }
                                 
                              }
                               else{
                                     if(st.executeUpdate("insert into fav values('"+album_code+"' ,'"+song_code+"','"+email+"','"+color+"')")>0){
                                        
                                        out.print("red");
                                    }
                               }
                             
                         }
                         catch(Exception e){
                            
                         }
                     }
    }
    else{
        
    }
                         %>