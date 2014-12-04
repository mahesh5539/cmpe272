<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<title>CitizenSpot</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/citizenspot.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/menu.css">
<body>

<header>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	  <div class="navbar-header">
	    <a class="navbar-brand" id="brand-name" href="#">Citizen Spot</a>
	  </div>
	  <div class="search">
	    <div class="input-group">
	      <span class="input-group-addon">Search</span>
	      <input type="text" class="form-control" placeholder= "search by address or ZIP"> <!--manami-->
	      <span class="input-group-addon search-icon glyphicon glyphicon-search"></span>
	    </div>
	  </div>
	  <div class="navbar-collapse collapse">
	    <ul class="nav navbar-nav navbar-left">
	    </ul>
	    <ul class="nav navbar-nav navbar-right">
	      <li><a data-toggle="modal" href="#loginModal" data-event-id=""><i class="glyphicon glyphicon-log-in"></i> Login to upload a problem</a></li>
	      <li><a data-toggle="modal" href="#registerModal" data-event-id=""><i class="glyphicon glyphicon-cloud-upload"></i>Register</a></li>
	      <li>
	      <!--  <div class="demo"><span id="demo-setting"><i class="fa fa-cog txt-color-blueDark"></i></span></div> -->
	      </li>
	    </ul>
	  </div>
	</nav>
	<hr/>
</header>

<div id="main" class="container-fluid">
	<div class="row fixed-row">
		<div class="col-md-8 map" id="mapPlaceholder"><img src="<%=request.getContextPath()%>/images/busy.gif"></div>
		<div class="col-md-4">
			<div id="local-spot-list">
				<div class="section-heading">Recent incidents near your current location</div>
				<div class="incident-list">
				
				  <div class="media">
				      <a href="#" class="pull-left">
				          <img src="<%=request.getContextPath()%>/images/problems/pothole1.jpg" class="thumb-pic" alt="Sample Image">
				      </a>
				      <div class="media-body">
				          <h4>Pothole <small>i280 & Central Exp.</small></h4>
				          <div class="post-date">Posted on: January 10, 2014</div>
				          <p class="short-desc">A big pothole and water logging near San J.....
				            <a data-toggle="modal" href="#bigViewModal" data-event-id="">more</a></p>
				      </div>
				  </div>
				  <hr/>
				
				</div>
			</div>
		</div>
	</div>
	<div class="row" id="thumbs">
		<%
			for(int i=0; i<20; i++) {
		%>
		<div class="item">
		  <div class="thumb">
		    <div class="row rating-share">
		      <span class="severity pull-left">
		        <i class="glyphicon glyphicon-star"></i><i class="glyphicon glyphicon-star"></i>
		        <i class="glyphicon glyphicon-star"></i><i class="glyphicon glyphicon-star-empty"></i>
		        <i class="glyphicon glyphicon-star-empty"></i>
		      </span>
		      <span class="actions pull-right"><i class="fa fa-share-alt"></i></span>
		    </div>
		    <div class="row">
		      <img src="<%=request.getContextPath()%>/images/problems/pothole1_bg.jpg">
		    </div>
		    <div class="row">
		      <p>blah blah blah blah blah blah blah blah blah blah blah blahblah b.....
		        <a data-toggle="modal" href="#myModal1" data-event-id="">more</a>
		      </p>
		    </div>
		  </div>
		</div>
		<%
			}
		%>
	</div>
</div>
<footer></footer>

<!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="uploadModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><i class="glyphicon glyphicon-remove"></i></button>
        <h4 class="modal-title">Please Log In</h4>
      </div>
   <div class="modal-body">
		<form class="form-horizontal" role="form" action="rest/User/login" method="post">
		  <div class="form-group">
		    <label for="username" class="col-sm-3 control-label">Username</label>
		    <div class="col-sm-9">
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="Enter your Username">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="password" class="col-sm-3 control-label">Password</label>
		    <div class="col-sm-9">
		      <input type="password" class="form-control" id="password" name="password" placeholder="Password">
		    </div>
		  </div>
		  
      
      <div class="modal-footer">
      	<button type="submit" id="login" class="btn btn-default pull-right">Log In</button></div>
      	</form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- Modal -->
<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="uploadModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><i class="glyphicon glyphicon-remove"></i></button>
        <h4 class="modal-title">Please Register</h4>
      </div>
      
		    <div class="modal-body">
		<form class="form-horizontal" role="form" action="rest/User/register" method="post">
		  
		  <div class="form-group">
		    <label for="firstname" class="col-sm-3 control-label">First Name</label>
		    <div class="col-sm-9">
		      <input type="text" class="form-control" id="firstName" name="firstName" placeholder="First Name">
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="lastname" class="col-sm-3 control-label">Last Name</label>
		    <div class="col-sm-9">
		      <input type="text" class="form-control" id="lastname" name="lastName" placeholder="Last Name">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="email" class="col-sm-3 control-label">Email</label>
		    <div class="col-sm-9">
		      <input type="text" class="form-control" id="email" name="email" placeholder="Enter your Email Id">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="username" class="col-sm-3 control-label">Username</label>
		    <div class="col-sm-9">
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="Choose a Username">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-3 control-label">Password</label>
		    <div class="col-sm-9">
		      <input type="password" class="form-control" id="password" name="password" placeholder="Password">
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="password" class="col-sm-3 control-label">Password</label>
		    <div class="col-sm-9">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="Re enter Password">
		    </div>
		  </div>
		    
      <div class="modal-footer">
      	<button type="submit" id="register" class="btn btn-default pull-right">Register</button></div>
      	</form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Modal -->
<div class="modal fade" id="bigViewModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><i class="glyphicon glyphicon-remove"></i></button>
        <h4 class="modal-title">Title</h4>
      </div>
      <div class="modal-body">
				<div class="row">
					<div class="col-md-6"><img src="<%=request.getContextPath()%>/images/problems/pothole1_bg.jpg"></div>
					<div class="col-md-6">
						<div><span class="col-label">Location: </span><span class="col-value">asds</span></div>
						<div><span class="col-label">Uploaded on: </span><span class="col-value">asds</span></div>
						<div><span class="col-label">Uploaded by: </span><span class="col-value">asds</span></div>
						<div><span class="col-label">Comment: </span><span class="col-value">asds</span></div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<p> Description , big description big description big description big description big description
							big description big description big description
							big description big description big description big description big description big description
							big description big description
							big description big description big description big description big description big description big description big description
							big description big description big description big description big description big description
							big description big description big description big description big description big description
							big description big description big description big description big description big description</p>
					</div>
				</div>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script src="<%=request.getContextPath()%>/js/jquery-2.1.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/moment.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker.js"></script>
<script src="<%=request.getContextPath()%>/js/citizenspot.js"></script>
<script type="text/javascript">
    $(function () {
        $('#problem-date').datetimepicker();
        
    });
</script>
<script src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script>
		if (navigator.geolocation)
		{
				navigator.geolocation.getCurrentPosition(showCurrentLocation);
		}
		else
		{
			alert("Geolocation API not supported.");
		}

		function showCurrentLocation(position)
		{
				var latitude = position.coords.latitude;
				var longitude = position.coords.longitude;
				var coords = new google.maps.LatLng(latitude, longitude);

				var mapOptions = {
				zoom: 15,
				center: coords,
				mapTypeControl: true,
				mapTypeId: google.maps.MapTypeId.ROADMAP
		};

		//create the map, and place it in the HTML map div
		map = new google.maps.Map(
		document.getElementById("mapPlaceholder"), mapOptions
		);

		//place the initial marker
		var marker = new google.maps.Marker({
		position: coords,
		map: map,
		title: "Current location!"
		});
		}
</script>
</body>
</html>