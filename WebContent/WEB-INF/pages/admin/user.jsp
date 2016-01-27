<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Dashboard</title>
<!-- Tell the browser to be responsive to screen width -->
<%-- 
	<jsp:include page="import/header.jsp"></jsp:include> --%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/fontawesome/css/font-awesome.min.css">


<!-- Select2 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/select2/select2.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/dist/css/skins/_all-skins.min.css">

<style>
ul.pagination li.active a {
	background: #F44336;
	border: 1px solid #E0E0E0;
}

ul.pagination li.active a:hover {
	background: #F44336;
	border: 1px solid #E0E0E0;
}

td.nodata {
	text-align: center;
}

td.nodata p {
	font-weight: bold;
	font-size: 16px;
}

i.action {
	text-align: center;
	font-size: 17px;
	color: #9E9E9E;
	margin-right: 5px;
	cursor: pointer;
}

i.action:hover {
	color: #F44336;
}

.err {
	color: red;
}

.modal-body {
	overflow: hidden;
}
</style>

</head>
<body class="hold-transition skin-blue sidebar-mini" ng-app="myApp"
	ng-controller="myCtrl">
	
	<div class="wrapper">
		<header class="main-header">
			<jsp:include page="element/topheader.jsp"></jsp:include>
		</header>

		<jsp:include page="element/leftslidebar.jsp"></jsp:include>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>AKN ADMIN DASHBORD</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Admin</a></li>
					<li class="active">User Management</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">


				<!--model for form insert new user  -->
				<!-- Modal ADD -->
				<div class="modal fade" id="myAdd" role="dialog"
					data-keyboard="false" data-backdrop="static">
					<div class="modal-dialog">
						<!-- Modal content-->
						<div class="modal-content">

							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									ng-click='reset()'>&times;</button>
								<h4 class="modal-title">ADD NEW</h4>
							</div>

							<div class="modal-body">
								<form ng-submit="submit()" name="myForm">					
									<h4>Name</h4>
									<input type="text" ng-model="user.username" name="uname"
										placeholder="Enter user name" required ng-minlength="3"
										class='form-control' />
									<!--Agular Validation Form  -->
									<span ng-show="myForm.$dirty && myForm.uname.$error.required"
										class="err">This is a required field</span> <span
										ng-show="myForm.$dirty && myForm.uname.$error.minlength"
										class="err">Minimum length required is 3</span> <span
										ng-show="myForm.$dirty && myForm.uname.$invalid" class="err">This
										field is invalid </span><br />
									<br />

									<!--Use For Control Condition for form register user or form update user  -->
										<h4>Email</h4> <input type="email" ng-model="user.email"
										name="email" placeholder="Enter email" required
										class='form-control' /> <!--Agular Validation Form  --> <span
										ng-show="myForm.$dirty && myForm.email.$error.required"
										class="err">This is a required field</span> <span
										ng-show="myForm.$dirty && myForm.email.$error.email"
										class="err">email format form</span> <span
										ng-show="myForm.$dirty && myForm.email.$invalid" class="err">This
											field is invalid </span><br />
									<br />

										<h4>Password</h4> <input type="password"
										ng-model="user.password" name="password"
										placeholder="Enter site password" required ng-minlength="5"
										class='form-control' /> <!--Agular Validation Form  --> <span
										ng-show="myForm.$dirty && myForm.uname.$error.required" class="err">This
											is a required field</span> <span
										ng-show="myForm.$dirty && myForm.uname.$error.minlength" class="err">Minimum
											length required is 5</span> <span
										ng-show="myForm.$dirty && myForm.uname.$invalid" class="err">This
											field is invalid </span><br />
									<br />

								       <input type="submit" value="Add"
										ng-disabled="myForm.$invalid"
										class="btn btn-success pull-right" />

								</form>
							</div>
						</div>
					</div>
				</div>
				<!--End Modal for register  -->
				
                <!--model for form update user name  -->
				<!-- Modal ADD -->
				<div class="modal fade" id="myupdate" role="dialog"
					data-keyboard="false" data-backdrop="static">
					<div class="modal-dialog">
						<!-- Modal content-->
						<div class="modal-content">

							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									ng-click='reset()'>&times;</button>
								<h4 class="modal-title">UPDATE</h4>
							</div>

							<div class="modal-body">
								<form ng-submit="submitupdate()" name="myForm1">
									<input type="hidden" ng-model="user.id" name="id"
										ng-disabled=true />
									<h4>Name</h4>
									<input type="text" ng-model="user.username" name="uname"
										placeholder="Enter user name" required ng-minlength="3"
										class='form-control' />
									<!--Agular Validation Form  -->
									<span ng-show="myForm1.$dirty && myForm1.uname.$error.required"
										class="err">This is a required field</span> <span
										ng-show="myForm1.$dirty && myForm1.uname.$error.minlength"
										class="err">Minimum length required is 3</span> <span
										ng-show="myForm1.$dirty && myForm1.uname.$invalid" class="err">This
										field is invalid </span><br />
									<br />
						
									    <input type="submit" value="Update"
										ng-disabled="myForm1.$invalid"
										class="btn btn-primary pull-right" />

								</form>
							</div>
						</div>
					</div>
				</div>
				<!--End Modal for update user -->
				<!-- Modal View -->
				<div class="modal fade" id="myUpload" role="dialog"
					data-keyboard="false" data-backdrop="static">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									ng-click='reset()'>&times;</button>
								<h4 class="modal-title">UPLOAD PROFILE</h4>
							</div>
							<div class="modal-body">

								<form id="frmupload" name="frm" ng-submit='changeProfile()'
									enctype="multipart/form-data">
									<input type="hidden" value='{{user.id}}' required name="id"
										id="id" /> <input type="file" name="file" id="file" required
										class="form-control" /><br /> <input type="submit"
										value='upload' ng-disabled="frm.$invalid"
										class="btn btn-primary" />
								</form>
							</div>
						</div>
					</div>
				</div>
				<!--End Modal for upload image  -->


				<!-- Main Data Table Show -->
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">

								<!-- Button For pop up form for register user -->
								<button class='btn btn-success' data-toggle="modal" data-target="#myAdd">
									<i class="fa fa-users"></i>
								</button>

								<div class="box-tools">
									<form>
										<!-- Search Box -->
										<div class="input-group" style="width: 150px;">
											<input id="searchbox" type="text" name="table_search"
												class="form-control input-sm pull-right"
												placeholder="Search" ng-model="searchkey">
											<div class="input-group-btn">
												<button class="btn btn-sm btn-default"
													ng-click="searchUser(searchkey)">
													<i class="fa fa-search"></i>
												</button>
											</div>

										</div>
									</form>
								</div>
							</div>
							<!-- /.box-header -->

							<!-- row option to show data -->
							<div class="div-filter col-md-12">
								<div class="row">
									<div class="box-footer clearfix col-md-3">
										<ul class="pagination pagination-sm no-margin pull-left">
											<li><select id="setrow" class="form-control select3"
												ng-options="item as item.label for item in items track by item.id"
												ng-model="selected" ng-change="changeRow(selected)">

											</select> <!-- /.form-group --></li>

										</ul>

									</div>
								</div>
								<!-- row -->
							</div>
							<!-- Show Result Of Total Record -->
							<div class="col-md-12">
								<h4 class="box-title" style="margin-right: 10px;">
									<i>Result:</i> <small>{{Totalrecord}} records</small>
								</h4>
							</div>

							<!-- Data Table -->
							<div class="box-body table-responsive no-padding col-md-12">
								<table class="table table-hover">
									<tr>
										<th>ID</th>
										<th>Name</th>
										<th>Email</th>
										<th>Profile</th>
										<th>Status</th>
										<th>Action</th>
									</tr>

									<!-- For Loop Data Respon by Server in angular -->
									<tr ng-repeat="user in users">
										<td>{{user.id }}</td>
										<td>{{ user.username }}</td>
										<td>{{ user.email }}</td>
										<td><img class='logo-style'
											src='{{domain}}/resources/images/user/{{ user.image }}'
											class="img-circle" data-toggle="modal"
											data-target="#myUpload" ng-click='findUserById(user.id)' /></td>
										<td ng-show="user.enabled == true"><button
												ng-click='chnageUserStatus(user.id)'>
												<i class="fa fa-fw fa-check"></i>
											</button></td>
										<td ng-show="user.enabled == false"><button
												ng-click='chnageUserStatus(user.id)'>
												<i class="fa fa-fw fa-close"></i>
											</button></td>
										<td>
											<button ng-click='findUserById(user.id)'
												class='btn btn-primary' data-toggle="modal"
												data-target="#myupdate">
												<i class="fa fa-edit"></i>
											</button>
										</td>
									</tr>
								</table>
							</div>
							<!-- /.box-body -->
							<div class="box-footer clearfix">
								<div ng-hide="!users.length" id="display"></div>
							</div>
						</div>
						<!-- /.box -->
					</div>

				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<footer class="main-footer">
			<jsp:include page="element/footer.jsp"></jsp:include></footer>

		<jsp:include page="element/rightslidebar.jsp"></jsp:include>
		<!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<%--  <jsp:include page="import/footer.jsp"></jsp:include> --%>


	<!-- jQuery 2.1.4 -->
	<script
		src="${pageContext.request.contextPath }/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/angularjs/angular.min.js"></script>
	<!-- Bootstrap 3.3.5 -->
	<script
		src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>
	<!-- Select2 -->
	<script
		src="${pageContext.request.contextPath }/resources/plugins/select2/select2.full.min.js"></script>
	<!-- InputMask -->
	<script
		src="${pageContext.request.contextPath }/resources/plugins/input-mask/jquery.inputmask.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/plugins/input-mask/jquery.inputmask.extensions.js"></script>


	<!-- SlimScroll 1.3.0 -->
	<script
		src="${pageContext.request.contextPath }/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script
		src="${pageContext.request.contextPath }/resources/plugins/fastclick/fastclick.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath }/resources/dist/js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery.bootpag.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/dist/js/demo.js"></script>
	<script>
		$(function() {
			//Initialize Select2 Elements
			$(".select2").select2();
		});
	</script>
	<script>
		var app = angular.module('myApp', []);
	        app.controller('myCtrl',function($scope, $http) {
							//Variable for Configuration

							$scope.domain = "http://localhost:8080/AKNnews/";


							//for set header with http wehn request 
							$http.defaults.headers.common.Authorization = 'Basic YXBpOmFrbm5ld3M=';

							//for store user for user to search and get user for update 
							$scope.users = {};
					
							$scope.usersupdate={};
							//for clear user object after edit
							$scope.reset = function() {
								$scope.user = {
									id:'',
									username : '',
									email:'',
									password:'',
									image : ''
								};

							}

							//use for pagination
							$scope.row = 15;
							$scope.page = 1;
							$scope.triggerpage = 0;

							//Function find user in angular for update user
							$scope.findUserById = function(id) {
								for (var i = 0; i < $scope.users.length; i++) {
									if ($scope.users[i].id == id) {
										$scope.user = angular
												.copy($scope.users[i]);
										break;
									}
								}
							}

							//Funotion for list to table
							$scope.listUser = function(page) {
								var key;
								if ($scope.searchkey == ''
										|| $scope.searchkey == null) {
									key = "*";
								} else {
									key = $scope.searchkey;
								}
								$scope.triggerpage++;

								$http
										.get(
												$scope.domain + 'api/user/'
														+ page + '/'
														+ $scope.row + '/'
														+ key)
										.success(
												function(response) {
													$scope.users = response.DATA;
													$scope.Totalrecord = response.TOTALRECORD;
													//set page to bootpage
													$('#display')
															.bootpag(
																	{
																		total : response.TOTALPAGE
																	});
													//for protect bootpage run only one time
													if ($scope.triggerpage > 1) {
														return;
													}
													$scope.loadpagination();
												}).error(function(response) {
											console.log(response);
										});
							}
							

							//Function bootpage Pagination 
							$scope.loadpagination = function() {

								$('#display').bootpag({
									maxVisible : 5,
									leaps : true,
									firstLastUse : true,
									first : '&#8592;',
									last : '&#8594;',
									wrapClass : 'pagination',
									activeClass : 'active',
									disabledClass : 'disabled',
									nextClass : 'next',
									prevClass : 'prev',
									lastClass : 'last',
									firstClass : 'first'
								}).on(
										"page",
										function(event, /* page number here */
												num) {
											$scope.page = num;
											$scope.listUser(num);
										});
							};

							//Function for search user by name
							$scope.searchUser = function() {
								$scope.listUser(1);
							}

							//Function for change row option
							$scope.changeRow = function(row) {
								$("#setrow").blur();
								$scope.page = 1;
								$('#display').bootpag({
									page : '1'
								});
								//for set row value remember current page 
								$scope.row = row.label;
								$scope.listUser(1);

							};

							//Function  for change user status
							$scope.chnageUserStatus = function(id) {
								$http
										.patch(
												$scope.domain
														+ 'api/user/toggle/'
														+ id)
										.success(function(response) {
											$scope.listUser($scope.page);
										});
							}
							

							//Function for submit and update user infor 
							$scope.submit = function() {
								//insert user infor
									console.log($scope.user);
									$http.post($scope.domain + 'api/user/',
											$scope.user).success(
											function(response) {
												console.log(response);
												alert(response.MESSAGE);
												$("#myAdd").modal('hide');
												$scope.listUser(1);
											}).error(function(response) {
										console.log(response);
									});	
							}
							$scope.submitupdate = function() {
								//update user infor
								$scope.usersupdate={
									id: $scope.user.id,
							        username:$scope.user.username
							      };
							$http.put(
										$scope.domain + 'api/user/update/',
										$scope.usersupdate).success(
										function(response) {
											console.log(response);
											alert(response.MESSAGE);
											$( "#foo" ).trigger( "click" );
											$("#myupdate").modal('hide');
											$scope.listUser(1);
										}).error(function(response) {
									console.log(response);
								}); 
							}
						
							
							//Function for upload user image profile
							$scope.changeProfile = function() {
								//for get data from form format formdata (use to include image)
								var form_data = new FormData(document
										.getElementById('frmupload'));

								$http
										.post(
												$scope.domain
														+ 'api/user/editupload',
												form_data,
												{
													transformRequest : angular.identity,
													headers : {
														'Accept' : 'application/json;odata=verbose',
														'Content-Type' : undefined
													}
												}).success(function(response) {
											alert(response.MESSAGE);
											$("#myUpload").modal('hide');
											$scope.listUser($scope.page);
										}).error(function(response) {
											console.log(response);
										});
							}

							//call funtion list user first time load page 
							$scope.listUser(1);

							//initialize value to select box
							$scope.items = [ {
								id : 1,
								label : '15',
							}, {
								id : 2,
								label : '30',
							}, {
								id : 3,
								label : '50',
							}, {
								id : 4,
								label : '100',
							} ];

							//set defualt select value of combo box
							$scope.selected = $scope.items[0];

						});
	</script>
</body>
</html>
