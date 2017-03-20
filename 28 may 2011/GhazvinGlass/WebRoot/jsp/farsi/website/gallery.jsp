<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title></title>
		
		<link href="css/nf.lightbox.css" rel="stylesheet" type="text/css" media="screen" />
		<script src="jquery/NFLightBox.js" type="text/javascript"></script>
		<script type="text/javascript">
	        $(function() {
	       		var settings = { 
	        	containerResizeSpeed: 300
	            };
	            $('#gallery a').lightBox(settings);
	        });
	    </script>
	    <style type="text/css">
	    	img{
	    		text-decoration: none;
	    		border: none;
	    	}
	    	#slider1 li{
	    		padding: 10px;
	    		width: 180px;
				height: 270px;
				background: #fff;
	    	}
	    	#slider1 li a {
	    		padding: 10px;
	    		width: 180px;
				height: 270px;
				background: #fff;
	    	}
	    </style>
    	<link href="jquery/scroll/jquery.hoverscroll.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="jquery/scroll/jquery.hoverscroll.js"></script>
		<script type="text/javascript" src="jquery/reflection.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#slider1').hoverscroll({
					width: 700,
					height: 450,
		            fixedArrows: true
		        });
		        var direction = 1,
		            speed = 3;
		        $("#slider1")[0].startMoving(direction, speed);
		        $(".reflect").reflect();
			});
		</script>
	    
	    
	    
	    
	</head>
	<body>
		<table>
			<tr>
<!--				<td><img src="images/arrows/next0.png"></img></td>-->
				<td>
					<div id="gallery">
						<ul id="slider1">
							<li>
								<a href="images/gallery/1.jpg" title=""> 
									<img src="images/gallery/0-1.jpg" alt="" class="reflect" /> 
								</a>
							</li>
							<li>	
								<a href="images/gallery/2.jpg" title=""> 
									<img src="images/gallery/0-2.jpg" alt="" class="reflect"/> 
								</a>
							</li>
							<li>	
								<a href="images/gallery/3.jpg" title=""> 
									<img src="images/gallery/0-3.jpg" alt="" class="reflect"/> 
								</a>
							</li>
							<li>	
								<a href="images/gallery/4.jpg" title=""> 
									<img src="images/gallery/0-4.jpg" alt="" class="reflect"/> 
								</a>
							</li>
							<li>	
								<a href="images/gallery/5.jpg" title=""> 
									<img src="images/gallery/0-5.jpg" alt="" class="reflect"/> 
								</a>
							</li>
							<li>	
								<a href="images/gallery/6.jpg" title=""> 
									<img src="images/gallery/0-6.jpg" alt="" class="reflect"/> 
								</a>
							</li>
							<li>	
								<a href="images/gallery/7.jpg" title=""> 
									<img src="images/gallery/0-7.jpg" alt="" class="reflect"/> 
								</a>
							</li>
							<li>
								<a href="images/gallery/8.jpg" title=""> 
									<img src="images/gallery/0-8.jpg" alt="" class="reflect"/> 
								</a>
							</li>
							<li>
								<a href="images/gallery/9.jpg" title=""> 
									<img src="images/gallery/0-9.jpg" alt="" class="reflect"/> 
								</a>
							</li>
							<li>
								<a href="images/gallery/10.jpg" title=""> 
									<img src="images/gallery/0-10.jpg" alt="" class="reflect"/> 
								</a>
							</li>
							<li>
								<a href="images/gallery/11.jpg" title=""> 
									<img src="images/gallery/0-11.jpg" alt="" class="reflect" /> 
								</a>
							</li>
							<li>
								<a href="images/gallery/12.jpg" title=""> 
									<img src="images/gallery/0-12.jpg" alt="" class="reflect"/> 
								</a>
							</li>
							<li>
								<a href="images/gallery/13.jpg" title=""> 
									<img src="images/gallery/0-13.jpg" alt="" class="reflect"/> 
								</a>
							</li>
							<li>
								<a href="images/gallery/14.jpg" title=""> 
									<img src="images/gallery/0-14.jpg" alt="" class="reflect"/> 
								</a>
							</li>
							<li>
								<a href="images/gallery/15.jpg" title=""> 
									<img src="images/gallery/0-15.jpg" alt="" class="reflect"/> 
								</a>
							</li>
						</ul>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>