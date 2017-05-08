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
      
</head>
<body>
<div id="container" style="left: 0px;">
<section id="content">    
<header>   
<img src="/static/img/logo2.png" alt="logo" />
    <br> 
	<h1>BING SPELL CHECK</h1>
   <h2 style ="line-height: 25px ;width : 700px"> The Spell Check API lets you perform contextual grammar and spell checking.It is a web-based spell-checker that leverages machine learning and statistical machine translation to dynamically train a constantly evolving and highly contextual algorithm. The spell-checker is based on a massive corpus of web searches and documents.
     </h2>
</header>

 <div id="our-work">
  <form action="/spellcheck" method="post" enctype="multipart/form-data">
   <h1>Enter text : </h1>
   <br>
   <br>

  <textarea id="spelltext" name="t"> </textarea>
  <h1>
  <input type="submit" value="Correct the sentence ! " />
  </h1>
</form>

 <div>
 <div id='output'>
 
 <p>
  <h2> Did you mean ? </h2>
  <br>
  <br>
  <h1> {{opstr}}  </h1>
 </p>
 
 </div>
</div>
</section>
 </div>
 <footer>
     © 2017 HARMAN Connected Services. 
 </footer>
</body>
</html>
