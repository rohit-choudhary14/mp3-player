<%-- 
    Document   : Add_music
    Created on : 13 Mar, 2022, 3:25:52 AM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*,java.util.*"pageEncoding="UTF-8"%> 
<%
    
    
    String title=" ";
    String album_code=" ";
    String email=" ";
   
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("login")){
            email=c[i].getValue(); 
        }
        
        
    }
    if(email!=null){
                     if(request.getParameter("title").length()!=0  && request.getParameter("code").length()!=0){
                          title=request.getParameter("title"); 
                          album_code=request.getParameter("code");
                         try{
                              int sn=0;
                              String song_code=""; 
                              Class.forName("com.mysql.jdbc.Driver");
                              Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mp3","root","");
                              Statement st=cn.createStatement();
                              ResultSet rs=st.executeQuery("select MAX(sn) from song");
                              if(rs.next()){
                                  
                                  sn=rs.getInt(1); 
                              }
                              sn++;
                              LinkedList l=new LinkedList(); 
                                for(int i=1;i<=9;i++){
                                    l.add(new Integer(i));
                                }
                                for(char i='A';i<='Z';i++){
                                    l.add(i+"");
                                }
                                for(char i='a';i<='z'; i++){
                                    l.add(i+"");
                                }
                                Collections.shuffle(l);
                                for(int i=1;i<=5;i++){
                                          song_code=song_code+l.get(i);
                                 }
                               java.util.Date date=new java.util.Date();
                               java.sql.Date sqlDate=new java.sql.Date(date.getTime()); 
                               String dat=sqlDate+"";  
                               int status=1;
                               if(st.executeUpdate("insert into song values('"+sn+"','"+album_code+"','"+song_code+"','"+title+"','"+dat+"','"+email+"','"+status+"')")>0){
                                   
                                   response.sendRedirect("upload_music_picture.jsp?code="+song_code+"&album_code="+album_code);  
                                   
                                   
                                   
                               }
                             
                         }
                         catch(Exception e){
                             out.print(e.getMessage()); 
                         }
                     }
                    
    }
    
    %>
