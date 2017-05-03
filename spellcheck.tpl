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
	<h1>		
        Bing Spell Check Demo 
	</h1>
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
</body>
</html>
