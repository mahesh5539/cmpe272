<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
</head>
<body>
	<h2>Hello World!</h2>

	<h3>
		List of Users <small> 
			<a href="#" class="btn btn-lg btn-success" data-toggle="modal" data-target="#addUserModal">Add new User</a>
			<a href="#" class="btn btn-lg btn-success btn-login" data-toggle="modal" data-target="#loginModal">Login</a>
		</small>
	</h3>
	<table class="table table-stripped user-list">
		<thead>
			<tr>
				<th>User Name</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>

	<div class="modal fade" id="addUserModal" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true"><i class="glyphicon glyphicon-remove"></i></button>
					<h4 class="modal-title" id="myModalLabel">Add User</h4>
				</div>
				<div class="modal-body">
					User: <input type="text" id="userName"><br/>
					Password: <input type="password" id="password"><br/>
					First Name: <input type="text" id="firstName"><br/>
				</div>
				<div class="modal-footer">
					<div class="create-user-response pull-left"></div>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="save-user btn btn-primary">Save</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true"><i class="glyphicon glyphicon-remove"></i></button>
					<h4 class="modal-title" id="myModalLabel">Login</h4>
				</div>
				<div class="modal-body">
					User: <input type="text" id="userName"><br/>
					Password: <input type="password" id="password"><br/>
				</div>
				<div class="modal-footer">
					<div class="login-user-response pull-left"></div>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="login-user btn btn-primary">Save</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
		
	<script>
		$(function(){
			fetchUsers();
			$(".save-user").click(function(event){
				event.preventDefault();
				$(".create-user-response").html();
				var user = {};
				user.userName = $("#userName").val();
				user.password = $("#password").val();
				user.firstName = $("#firstName").val();
				$.ajax({
				    url : "rest/User/create?",
				    type: "POST",
				    dataType: 'json',
				    contentType: "application/json; charset=utf-8",
				    data : JSON.stringify(user),
				    success: function(data, textStatus, jqXHR)
				    {
				        console.log(data);
				        $(".create-user-response").html("User saved successfully!");
				    },
				    error: function (jqXHR, textStatus, errorThrown)
				    {
				 
				    }
				});
			});

			$(".login-user").click(function(event){
				event.preventDefault();
				$(".login-user-response").html();
				var user = {};
				user.userName = $("#userName").val();
				user.password = $("#password").val();
				user.firstName = $("#firstName").val();
				$.ajax({
				    url : "rest/User/login?",
				    type: "POST",
				    dataType: 'json',
				    contentType: "application/json; charset=utf-8",
				    data : JSON.stringify(user),
				    success: function(data, textStatus, jqXHR)
				    {
				        console.log(data);
				        $(".create-user-response").html("User saved successfully!");
				    },
				    error: function (jqXHR, textStatus, errorThrown)
				    {
				 
				    }
				});
			});
		});
		function fetchUsers() {
			$.ajax({
			    url : "rest/User/list",
			    type: "GET",
			    success: function(data, textStatus, jqXHR)
			    {
			    	console.log(data);
			    	var response = "";
			    	data.forEach(function(entry) {
			    		response += "<tr><td>"+entry.userName+"</td><td>"+entry.firstName+"</td><td>"+entry.lastName+"</td><td>"+entry.email+"</td></tr>";
			    	});
			        
			        $(".user-list tbody").html(response);
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			 
			    }
			});
		}
	</script>
</body>
</html>
