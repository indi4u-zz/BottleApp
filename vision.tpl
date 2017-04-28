<!DOCTYPE html>
<html class="no-js">
<head>


    <!-- Meta info -->
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Computer Vision API</title>
    <meta content="" name="description">
    <meta name="author" content="">
    <meta name="format-detection" content="">

    <!-- Styles -->
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600' rel='stylesheet' type='text/css'>
    <link href="../static/css/main.css" rel="stylesheet" media="screen, print" type="text/css">
    <script src="../static/js/modernizr-2.6.2.js"></script>
    <script src="../static/js/jquery-1.11.0.min.js"></script>
    <script src="../static/js/pyaari-main.1.0.js"></script>
    <script src="../static/js/pyaari-menu.1.0.js"></script>
    <script src="../static/js/app.js"></script>    
    <script type="text/javascript">
      $(document).ready(function() {    
        v = '{{img}}'
        alert(v)
       url = window.location.href ;
        
      if(url.endsWith("show")){
        document.getElementById("rightside").style.display = "block";
      } else 
      {        
        document.getElementById("rightside").style.display = "none";        
      }
      })
     </script>
</head>
<body>
<div id="container" style="left: 0px;">
<section id="content">
    
<header>
    
	<h1>		
         Computer Vision API
	</h1>
</header>
 <div id="our-work">
  <h1>
    We have used Computer Vision API to analyze an image and output feature analysis of the image uploaded. 
    </h1>
  
   <div id="main-wrap">
     <div id="leftside">
<div id="details">
   
  <form action="/vision/show" method="post" enctype="multipart/form-data">
   <h1>Demo : </h1>
  
 <h1> Select a file: <input type="file" name="upload" id="imgInput" />  <input type="submit" value="Start upload" /> </h1>
 
</form>
</div>
<div id="output">
  <img src = '{{img}}' />
</div>
</div>
<div id='rightside'>
  <table id= "visiontble" style="width:100% ;padding-top: 100px ">

  %for key, value in datadic.iteritems():
    <tr>
        <td>{{key}} </td>
        <td>{{value}} </td>
    </tr>
  %end
  
</table>
</div>
</div>
</div>
</section>
 </div>
</body>
</html>
