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
    <link href="static/css/main.css" rel="stylesheet" media="screen, print" type="text/css">
    <script src="static/js/modernizr-2.6.2.js"></script>
     <script src="static/js/jquery-1.11.0.min.js"></script>
    <script src="static/js/pyaari-main.1.0.js"></script>
    <script src="static/js/pyaari-menu.1.0.js"></script>
     <script src="  static/js/speechToText.js" type="text/javascript"></script>
    <script src="static/js/speech.1.0.0.js" type="text/javascript"></script>    
</head>
<body>
<div id="container" style="left: 0px;">
<section id="content">    
<header>    
  <h1>    
        Speech API 
  </h1>
</header>


 <div id="our-work">
  
 
    <div id="main-wrap">
     <div id="leftside">
      <h1>Microsoft Cognitive Services : Text To Speech </h1>
      <br>
        <form action="/tts" method="post" enctype="multipart/form-data">
        <h3> Enter text : <input type="text" name="t"/></h3>
        <br>
        <input type="submit" value="Generate Speech" />
        <br>
        </form>
      
     </div>

    <div id="rightside">

    <h1>Microsoft Cognitive Services : Speech To Text</h1>
    <br>

    <button onclick="start()">Start Talking!</button>  
    <br>
    <br>
     <textarea id="output" style='width:400px;height:200px'></textarea>
    </div>
  </div>

  
</div>
</section>
 </div>
</body>
</html>
