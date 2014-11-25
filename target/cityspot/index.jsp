<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
</head>
<body>
	<h2>Hello World!</h2>

	<h3>List of Users <small>
			<a href="#" class="btn btn-lg btn-success" data-toggle="modal" data-target="#addUserModal">Add new User</a>
		</small></h3>
	<table class="table table-stripped">
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

	<div id="addUserModal" class="modal hide fade" tabindex="-1"
		data-width="760">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3>Insert user Details</h3>
		</div>
		<div class="modal-body">
			<div class="row-fluid">
				<div class="span6">
					<h4>Some Input</h4>
					<p>
						<input class="span12" type="text">
					</p>
					<p>
						<input class="span12" type="text">
					</p>
					<p>
						<input class="span12" type="text">
					</p>
					<p>
						<input class="span12" type="text">
					</p>
					<p>
						<input class="span12" type="text">
					</p>
					<p>
						<input class="span12" type="text">
					</p>
					<p>
						<input class="span12" type="text">
					</p>
				</div>
				<div class="span6">
					<h4>Some More Input</h4>
					<p>
						<input class="span12" type="text">
					</p>
					<p>
						<input class="span12" type="text">
					</p>
					<p>
						<input class="span12" type="text">
					</p>
					<p>
						<input class="span12" type="text">
					</p>
					<p>
						<input class="span12" type="text">
					</p>
					<p>
						<input class="span12" type="text">
					</p>
					<p>
						<input class="span12" type="text">
					</p>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" data-dismiss="modal" class="btn">Close</button>
			<button type="button" class="btn btn-primary">Save changes</button>
		</div>
	</div>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
</body>
</html>
