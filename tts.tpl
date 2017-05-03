<!DOCTYPE html>
<html class="no-js">
<head>


    <!-- Meta info -->
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Microsoft Cognitve Services</title>
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
  <h1> Bing Speech API   </h1>
   <h2 style ="line-height: 25px ;width : 700px">  
   The Bing Speech API has two components.A speech recognition API for converting spoken words to text. 
   And a text to speech API for converting text into spoken words.
   </h2>
</header>


 <div id="our-work">
  
 
    <div id="main-wrap">
     <div id="leftside">
      <h2>Text To Speech </h2>
      <br>
      <br>
        <form action="/tts" method="post" enctype="multipart/form-data">
        <h2> Enter text : <br><br><textarea name="t" style='width:400px;height:200px;padding: 20px'> {{x}}</textarea></h2>
        <br>
        <br>
        <input type="submit" value="Generate Speech" />
        <br>
        </form>
      
     </div>

    <div id="rightside">

    <h2>Speech To Text</h2>
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
