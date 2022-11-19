<%-- 
    Document   : all_song
    Created on : 17 Mar, 2022, 10:32:05 PM
    Author     : rohit
--%>
<%
      String album_code=" ";
     String email=null;
     Cookie c[]=request.getCookies();
     for(int i=0;i<c.length;i++){
         if(c[i].getName().equals("user")){
             email=c[i].getValue(); 
         }
         
        
     }
     
                      if(request.getParameter("code").length()!=0){
                          album_code=request.getParameter("code");
                      
    
    
    %>




<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    
    <title>Mp3</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon.png">
    <link rel="stylesheet" href="./vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="./vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="./vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="./css/style.css" rel="stylesheet">
   <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

  
 <script src="js/jquery2.0.3.min.js"></script>  
 <style>
 
#abc{
 background-color:#B284BE;
  
}
.card{
 
   box-shadow:5px 5px 20px rgba(0,0, 0, 0.4);
    border-radius:25px;
    background-color:#C0E8D5;
    height:200px;
   
}

#card{
 
  
   box-shadow:5px 5px 20px rgba(0,0, 0, 0.4);
    border-radius:10px;
    
   
}
#album{
     box-shadow:5px 5px 20px rgba(0,0, 0, 0.4);
    border-radius:10px;
    margin-top:4%;
    margin-bottom:4%;
}

audio{ 
  
   box-shadow:5px 5px 20px rgba(0,0, 0, 0.4);
   border-radius:90px;
   height:30px;
   width:300px;
   margin-left:50px;
   
}
#album_image{
     box-shadow:5px 5px 20px rgba(0,0, 0, 0.4);
     border-radius:10px;
     margin-top:3%;
}

#title{
    padding:50px;
    
}
#img{
   margin-top:5%;
    box-shadow:5px 5px 20px rgba(0,0, 0, 0.4);
    border-radius:25px;
    
}
#cardx{
      box-shadow:2px 2px 2px rgba(0,0, 0, 0.4);
    border-radius:10px;
}
@media only screen and (max-width:500px) {
   .audio{
      margin-right:10px;
    }
   
 }
</style>

   <script>
       
       $(document).ready(function(){
       $(".img-fluid").on("click",function(){
          
        var song_code=$(this).attr("rel");
          var title=$(this).attr("rel1");
          var album_code=$(this).attr("rel2");
          
           var src="mp3_song/"+song_code+".mp3";
            var src1="mp3_picture/"+song_code+".jpg";
          
            $("#fixed-content-expand").html("<div class='card'><table ><tr><td><center><img src='' style='width:300px;height:100px;'class='img-fluid' alt='Cinque Terre'  id='img'></center></td></tr><tr><td><audio  class='audio' controls autoplay><source src='' type='audio/mpeg'  id='play'></audio></tr></td><tr><td><div class='col-sm-12' style='background-color:black;height:2px'></div></td></tr> <tr style='width:50px'><td ><span id='title' style='color:black;font-size:25px'></span><i class='fa fa-heart'style='color:white;font-size:25px' rel='' rel1=''></i></td></tr></table></div>");
            $("#play").attr("src",src);
            $("#img").attr("src",src1);
            $("#title").text(title);
            $(".fa.fa-heart").attr("rel",song_code);
            $(".fa.fa-heart").attr("rel1",album_code);
            $.post(
                  "recent.jsp",{album_code:album_code,song_code:song_code},function(data){
              
                  }
            );
             
              $(".fa.fa-heart").on("click",function(){
                if(<%=email%>!=null){
                    var song_code=$(this).attr("rel");
                    var album_code=$(this).attr("rel1");
                    
                    $.post(

                          "fav.jsp",{song_code:song_code,album_code:album_code},function(data){

                     });
                  
               }
            else{
              
               $("#myModal").modal();
            
            }
            });
       });
       
      
       
       });
       
   </script>
  
       
       
       
       
       
       
       
       
       
</head>

<body>


    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="sk-three-bounce">
            <div class="sk-child sk-bounce1"></div>
            <div class="sk-child sk-bounce2"></div>
            <div class="sk-child sk-bounce3"></div>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->


    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

        <!--**********************************
            Nav header start
        ***********************************-->
        <div class="nav-header" style="background-color:#232B2B">
           
               <i class="fa fa-user-circle" style="font-size:24px;padding:20px"></i>
                <a href="#"  class="navx-header brand-title" style="font-size:15px"  data-toggle="modal" data-target="#myModal">Login</a>
                <span class="navx-header brand-title">/</span>
                <a href="#" class="navx-header brand-title" style="font-size:15px"  data-toggle="modal" data-target="#myModal1">Sign Up</a>
          
            <div class="nav-control">
                <div class="hamburger">
                    <span class="line"></span><span class="line"></span><span class="line"></span>
                </div>
            </div>
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start
        ***********************************-->
        <div class="header" style="background-color:" id="abc">
            <div class="header-content">
                <nav class="navbar navbar-expand">
                    <div class="collapse navbar-collapse justify-content-between">
                        <div class="header-left">
                            <div class="search_bar dropdown">
                                <span class="search_icon p-3 c-pointer" data-toggle="dropdown">
                                    <i class="mdi mdi-magnify"></i>
                                </span>
                                <div class="dropdown-menu p-0 m-0">
                                    <form method="post" action="search.jsp">
                                        <input class="form-control" type="search"  name="text"placeholder="Search..." aria-label="Search" id="search" >
                                    </form>
                                </div>
                            </div>
                        </div>

                        <ul class="navbar-nav header-right">
                            <li class="nav-item dropdown notification_dropdown">
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                                    <i class="mdi mdi-bell" style="font-size:30px;color:white"></i>
                                    <div class="pulse-css"></div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <ul class="list-unstyled">
                                        <li class="media dropdown-item">
                                            <span class="success"><i class="ti-user"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong>Martin</strong> has added a <strong>customer</strong> Successfully
                                                    </p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                        <li class="media dropdown-item">
                                            <span class="primary"><i class="ti-shopping-cart"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong>Jennifer</strong> purchased Light Dashboard 2.0.</p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                        <li class="media dropdown-item">
                                            <span class="danger"><i class="ti-bookmark"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong>Robin</strong> marked a <strong>ticket</strong> as unsolved.
                                                    </p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                        <li class="media dropdown-item">
                                            <span class="primary"><i class="ti-heart"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong>David</strong> purchased Light Dashboard 1.0.</p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                        <li class="media dropdown-item">
                                            <span class="success"><i class="ti-image"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong> James.</strong> has added a<strong>customer</strong> Successfully
                                                    </p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                    </ul>
                                    <a class="all-notification" href="#">See all notifications <i
                                            class="ti-arrow-right"></i></a>
                                </div>
                            </li>
                            <li class="nav-item dropdown header-profile">
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                                    <i class="mdi mdi-account" style="font-size:30px;color:white"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a  class="dropdown-item"style="cursor:pointer">
                                        <i class="icon-user"></i>
                                        <span class="ml-2" data-toggle="modal" data-target="#myModal">Login </span>
                                    </a>
                                   
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
           
        </div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
        <div class="quixnav" style="background-color:#232B2B">
            <div class="quixnav-scroll">
                <ul class="metismenu" id="menu">
                  
                    <li><a class="has-arrow" href="index.jsp" aria-expanded="false">
                            <i class="fa fa-home"></i><span class="nav-text">Home</span></a>
                       
                    </li>
                   
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
                           <i class="material-icons">&#xe03e;</i><span class="nav-text" data-toggle="modal" data-target="#myModal">Radio</span></a>
                       
                    </li>
                   
                     <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
                             <i class="fa fa-music"></i>
                             <span class="nav-text" data-toggle="modal" data-target="#myModal">My Music</span></a>
                        
                    </li>
                   
                     <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
                        <i class="fa fa-star"></i>
                           <span class="nav-text" data-toggle="modal" data-target="#myModal">Favorite</span></a>
                          
                      </li>
                </ul>
            </div>
           

        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body" style="background-color:white">
            <!-- row -->
               <!-- login modal start!--->             
             <div class="modal" id="myModal">
                                              <div class="modal-dialog">
                                                <div class="modal-content">

                                                  <!-- Modal Header -->
                                                  <div class="modal-header">
                                                    <h4 class="modal-title">Sign in</h4>
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                  </div>

                                                  <!-- Modal body -->
                                                  <div class="modal-body">
                                                   
                                                           <div class="login-form">
                                                                        <form action="user_login.jsp"  method="post">
                                                                            <div class="form-group">
                                                                                <label>Email:</label>
                                                                                <input type="email"  name="email"class="form-control"required="required">
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Password:</label>
                                                                                <input type="password" name="password" class="form-control" required="required">
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <button type="submit" class="btn btn-primary btn-block">Log in</button>
                                                                            </div>
                                                                            <div class="clearfix">
                                                                                <label class="float-left form-check-label"><input type="checkbox"> Remember me</label>
                                                                                <a href="#" class="float-right">Forgot Password?</a>
                                                                            </div>        
                                                                        </form>
                                                                       
                                                                    </div>
							
						 </div>
						
						
                                                       
						 </div>
						 
                                                 

                                                  <!-- Modal footer -->
                                                  <div class="modal-footer">
                                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                                  </div>

                                                 </div>
                                              </div>
                                        <!-- login modal end!--->                                      
                                                                            
                                      <!-- register modal start!--->                                        
                                  <div class="modal" id="myModal1">
                                              <div class="modal-dialog">
                                                <div class="modal-content">

                                                  <!-- Modal Header -->
                                                  <div class="modal-header">
                                                    <h4 class="modal-title">Sign Up</h4>
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                  </div>

                                                  <!-- Modal body -->
                                                  <div class="modal-body">
                                                   
                                                           <div class="login-form">
                                                                        <form action="user_register.jsp"  method="post">
                                                                            <div class="form-group">
                                                                                <label>Name:</label>
                                                                                <input type="text"  name="user"class="form-control"required="required">
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Email:</label>
                                                                                <input type="email"  name="email"class="form-control"required="required">
                                                                            </div>
                                                                            
                                                                            <div class="form-group">
                                                                                <label>Password:</label>
                                                                                <input type="password" name="pass" class="form-control"  required="required">
                                                                            </div>
                                                                             <div class="form-group">
                                                                                <label>Confirm-Password:</label>
                                                                                <input type="password" name="cpass" class="form-control" required="required">
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <button type="submit" class="btn btn-success btn-block">Sign Up</button>
                                                                            </div>
                                                                                    
                                                                        </form>
                                                                       
                                                                    </div>
							
						 </div>
						
						
                                                       
						 </div>
						 
                                                 

                                                  <!-- Modal footer -->
                                                  <div class="modal-footer">
                                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                                  </div>

                                                 </div>
                                              </div>
                                       <!-- register modal end!--->
                                                                            
                                                                            
                                                                            
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-8" style="color:black">
                        <span style="font-size:25px">Albums | Movie Songs</span> 
                    </div>
                    <div class="col-sm-4">
                  
       
                    </div>
                     <%
        
                                                                 
                                                                 int status=1; 
                                                                 String album_name=" ";
                                                                        try{
                                                                            String album_dt=" "; 
                                                                            String cat=" ";
                                                                            int total_track=0;
                                                                            String title=" ";
                                                                            String song_code=" ";                                                                       
                                                                            Class.forName("com.mysql.jdbc.Driver");
                                                                            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mp3","root","");
                                                                             Statement st=cn.createStatement();
                                                                             Statement st1=cn.createStatement();
                                                                             Statement st2=cn.createStatement();
                                                                             ResultSet rs=st.executeQuery("select count(*) from song where album_code='"+album_code+"' AND status='"+status+"'"); 
                                                                             if(rs.next()){
                                                                                 total_track=rs.getInt(1); 
                                                                             }
                                                                            ResultSet rs1=st1.executeQuery("select * from album where album_code='"+album_code+"' AND status='"+status+"'"); 
                                                                            if(rs1.next()){
                                                                                album_name=rs1.getString("title");
                                                                                album_dt=rs1.getString("dt");
                                                                                cat=rs1.getString("category");
                                                                                title=rs1.getString("title");
                                                                                album_code=rs1.getString("album_code");

                                                                            }
                                                                         
                                     %> 
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                       <div class="col-sm-3" style="margin-top:3%" >
                                            <div class="col-sm-12" id="card">
                                            <a href="all_song.jsp?code=<%=album_code%>"> 
                                            
                                            <img src="album/<%=album_code%>.jpg" style="width:200px;height:200px" id="album" class="img-responsive" >
                                           </a>   
                                       </div>
                                       </div>
                                          <div class="col-sm-4" style="margin-top:4%;font-size:20px">
                                                <table>
                                                <tr><td colspan="2">  <span style="color:black;">Album</span></td><td><%=title%></td></tr>
                                           
                                             
                                               <tr><td colspan="2"> <span style="color:black;">Upload</span></td><td><%=album_dt%></td></tr>  
                                                 
                                              
                                                       
                                               <tr><td colspan="2"> <span style="color:black;" >Group</span></td><td><%=cat%></td><td></td></tr>   
                                                     <%
                                                       if(total_track <=9){                     
                                                        %>                    
                                                            <tr><td colspan="2">    <span style="color:black;">Track</span></td><td> 0<%=total_track%>Tracks</td></tr>                 
                                                        <% 
                                                       }
                                                       else{
                                                        %>
                                                
                                                       
                                                      <tr><td colspan="2"><span style="color:black;">Total track</span></td><td> <%=total_track%>Tracks</td></tr>   
                                                     <%
                                                           
                                                           
                                                       }   
                                                           
                                                           %>
                                                       <tr><td>  <button class="btn btn-danger btn-block">Play All</button> </td></tr>
                                                </table>
                                                  
                                            </div>
                                                   <div class="col-sm-5" id="fixed-content-expand" style="margin-top:3%">
                                                                </div>
                                                   
                                     <% 
                                                                         }
                                                                    
                                                                    catch(Exception e){} 
                                                                    
                                                                    %>
                                                                     <div class="clearfix"> </div>
                                                          
                                                                     <div class="col-sm-12" style="background-color:black;margin-top:2%;color:black"></div>
                                                                   
                                                                        <div class="col-sm-1" style="color:black"></div>  
                                                                         <div class="col-sm-3"style="color:black;font-size:20px">Track</div>  
                                                                          <div class="col-sm-4"style="color:black;font-size:20px">Title</div>  
                                                                          <div class="col-sm-2" style="color:black;font-size:20px">Album</div>  
                                                                          <div class="col-sm-2" style="color:black;font-size:20px">Artist</div>  
                                                                     <div class="col-sm-12" style="background-color:black;margin-top:2%;height:1px"></div>
                                                                      <div class="col-sm-12" style="background-color:black;margin-top:2%;"></div>
                                                                        
                                                                      <%
        
                                                                 
                                                                
                                                                  String song_code=" ";
                                                                    try{   
                                                                           int count=1; 
                                                                
                                                                            String title=" "; 
                                                                            
                                                                             Class.forName("com.mysql.jdbc.Driver");
                                                                             Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mp3","root","");
                                                                             Statement st=cn.createStatement();
                                                                             Statement st1=cn.createStatement();
                                                                             Statement st2=cn.createStatement();
                                                                            
                                                                            ResultSet rs1=st1.executeQuery("select * from song where album_code='"+album_code+"' AND status='"+status+"'"); 
                                                                            while(rs1.next()){
                                                                                title=rs1.getString("title");
                                                                                song_code=rs1.getString("song_code");

                                                                            
                                                                         
                                     %> 
                                       <div class="col-sm-12" style="background-color:#F5F5F5" id="cardx">
                                         <div class="row">                            
                                     
                                     <div class="col-sm-1" style="color:black;margin-top:2%">
                                                                           <%
                                                                         if(count<= 9){
                                                                          %> 
                                                                            0 <%=count%>
                                                                            <%
                                                                          }
                                                                         else{
                                                                            %> 
                                                                            
                                                                            <%=count%>
                                                                         <%   
                                                                         }
                                                                            %>
                                                                        </div>
                                                                        <div class="col-sm-3" style="color:black;margin-top:1%;margin-bottom:1%" >
                                                                          <img src="mp3_picture/<%=song_code%>.jpg" style="width:60px;height:60px"  class="img-fluid" id="img/<%=song_code%>" rel="<%=song_code%>" rel1="<%=title%>" rel2="<%=album_code%>">
                                                                        </div>  
                                                                         <div class="col-sm-4"style="color:black;margin-top:2%">
                                                                            <%=title%> 
                                                                         </div>  
                                                                          <div class="col-sm-2"style="color:black;margin-top:2%">
                                                                              <a href="#" style="color:blue"> <%=album_name%></a> 
                                                                          </div>  
                                                                          <div class="col-sm-2" style="color:black;margin-top:2%">
                                                                              <span> Arjit</span>
                                                                          </div>
                                         </div>
                                                                          </div>
                                                                          <div class="col-sm-12" style="margin-top:3%"></div>     
                                                                           
                                                                       
                                                                          <%
                                                                                
                                                                           count++;
                                                                            }
                                                                           %> 
                                                                     
                                                                          
                                                                           
                                                                  <%  
                                                                    }
                                                                    catch(Exception e){
                                                                        
                                                                    }


%>       

  
                                                          
            </div> 
            <div class="clearfix"> </div> 
                      
                       
        </div>
 </div>
        <!--**********************************
            Content body end
        ***********************************-->


        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer" style=" background-color:#B284BE;margin-top:auto;margin-bottom:0px;color:white"> 
           
          <div class="copyright">
                <p>Copyright © Designed &amp; Developed by <a href="#" target="_blank">Quixkit</a> 2019</p>
                <p>Distributed by <a href="https://themewagon.com/" target="_blank">Themewagon</a></p> 
            </div>
    </div> 
       
 </div>
    <!--********************************** 
        Main wrapper end 
    ***********************************-->

    <!--**********************************
        Scripts 
    ***********************************-->
    <!-- Required vendors --> 
    <script src="./vendor/global/global.min.js"></script> 
    <script src="./js/quixnav-init.js"></script> 
    <script src="./js/custom.min.js"></script> 


    <!-- Vectormap -->
    <script src="./vendor/raphael/raphael.min.js"></script> 
    <script src="./vendor/morris/morris.min.js"></script> 


    <script src="./vendor/circle-progress/circle-progress.min.js"></script> 
    <script src="./vendor/chart.js/Chart.bundle.min.js"></script> 

    <script src="./vendor/gaugeJS/dist/gauge.min.js"></script> 
 
    <!--  flot-chart js --> 
    <script src="./vendor/flot/jquery.flot.js"></script> 
    <script src="./vendor/flot/jquery.flot.resize.js"></script> 

    <!-- Owl Carousel --> 
    <script src="./vendor/owl-carousel/js/owl.carousel.min.js"></script> 

    <!-- Counter Up --> 
    <script src="./vendor/jqvmap/js/jquery.vmap.min.js"></script> 
    <script src="./vendor/jqvmap/js/jquery.vmap.usa.js"></script> 
    <script src="./vendor/jquery.counterup/jquery.counterup.min.js"></script> 


    <script src="./js/dashboard/dashboard-1.js"></script> 

</body>
<% 
                                                               
                      }                                                                  
                                                                    
                                                                    
                                                                    
                                                                    %> 
</html>