<!DOCTYPE html>
<html>
<head>
<title><%- name %></title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, minimal-ui" />
<style> @-ms-viewport { width: device-width; } </style>
<link rel="stylesheet" href="vendor/reset.min.css">
<link rel="stylesheet" href="style.css">
</head>
<body class="<%- scenes.length > 1 ? 'multiple-scenes' : 'single-scene' %> <%- settings.viewControlButtons ? 'view-control-buttons' : '' %>">

  <div class="mz-container">
    <div id="pano"></div>
    <button id="close" class="close close-button-white"></button>

    <div id="titleBar">
      <h1 class="sceneName"></h1>
    </div>
  </div>

<script type="text/javascript" src="https:////cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<script src="vendor/es5-shim.js"></script>
<script src="vendor/eventShim.js"></script>
<script src="vendor/classList.js"></script>
<script src="vendor/requestAnimationFrame.js" ></script>
<script src="vendor/screenfull.min.js" ></script>
<script src="vendor/bowser.min.js" ></script>
<script src="vendor/marzipano.js" ></script>

<script src="data.js"></script>
<script src="index.js"></script>

</body>
</html>
