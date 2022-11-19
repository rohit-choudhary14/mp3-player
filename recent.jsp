<%-- 
    Document   : recent
    Created on : 21 Mar, 2022, 12:27:20 AM
    Author     : rohit
--%>
<%@page contentType="text/html" import="java.sql.*,java.util.*"pageEncoding="UTF-8"%> 
<%
    
    
    String song_code=" ";
    String album_code=" ";
    String title=" ";
                     if(request.getParameter("song_code").length()!=0  && request.getParameter("album_code").length()!=0 && request.getParameter("title").length()!=0){
                          song_code=request.getParameter("song_code"); 
                          album_code=request.getParameter("album_code");
                          title=request.getParameter("title");
                         try{
                              
                               Class.forName("com.mysql.jdbc.Driver");
                               Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mp3","root","");
                               Statement st=cn.createStatement();
                               ResultSet rs=st.executeQuery("select  * from  recent where album_code='"+album_code+"' AND song_code='"+song_code+"'");
                               if(rs.next()){
                                    
                                 
                              }
                               else{
                                     if(st.executeUpdate("insert into recent values('"+song_code+"','"+album_code+"','"+title+"')")>0){
                                        
                                        
                                    }
                               }
                             
                         }
                         catch(Exception e){
                            
                         }
                     }
   
                         %>