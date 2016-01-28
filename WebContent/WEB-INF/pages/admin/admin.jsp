<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Dashboard</title>
<!-- Tell the browser to be responsive to screen width -->
<jsp:include page="import/header.jsp"></jsp:include>

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

.widget-user .widget-user-image {
	position: absolute;
	top: 70px;
	left: 4%;
	margin-left: -45px;
}

.widget-user .widget-user-image>img {
	width: 167px;
	height: auto;
	border: 3px solid #fff;
}

.description-block {
	text-align: left;
}
</style>

</head>
<body class="hold-transition skin-blue sidebar-mini" ng-app="myApp"
	ng-controller="myCtrl">
	<div class="wrapper">
		<header class="main-header"> <jsp:include
			page="element/topheader.jsp"></jsp:include> </header>
		<jsp:include page="element/leftslidebar.jsp"></jsp:include>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>
				Article Management <small>Version 2.0</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li class="active">Article Management</li>
			</ol>
			</section>

			
			<div class="row">
				<div class="col-xs-12">
					<div class="box" style="overflow: hidden;"><br/><br/>

						<div class="col-md-12">
							<div class="nav-tabs-custom">
								<ul class="nav nav-tabs">
									<li class="active"><a href="#profile" data-toggle="tab"
										aria-expanded="true">Profile</a></li>
									<li class=""><a href="#chpicture" data-toggle="tab"
										aria-expanded="false">Change Profile Image</a></li>
									<li class=""><a href="#chpass" data-toggle="tab"
										aria-expanded="false">Change Password</a></li>
									<li class=""><a href="#updateinfo" data-toggle="tab"
										aria-expanded="false">Update Name</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="profile">
										<!-- Post -->
										<div class="post">
											<div class="user-block">
												 <img  src="http://localhost:8080/AKNnews/resources/images/user/${sessionScope.SessionUser.image}" alt="User Avatar" >
												<span class="username"><a>${sessionScope.SessionUser.username}</a></span> 
												<span class="description">Admin</span>
												<span class="description">${sessionScope.SessionUser.email}</span> 
											</div>
											<!-- /.user-block -->
										</div>
										<!-- /.post -->
									</div>
									<!-- /.tab-pane -->
									<div class="tab-pane" id="chpicture">
											<form class="form-horizontal" id="frmupload" name="frm" ng-submit='changeProfile()' enctype="multipart/form-data">
											<div class="form-group">
												<input type="hidden" value='${sessionScope.SessionUser.id}' required name="id" id="id" />
												<label for="inputName" class="col-sm-2 control-label">File</label>
												<div class="col-sm-10">
													 <input type="file" name="file" id="file" required class="form-control" />
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-offset-2 col-sm-10">
													<input type="submit" value='upload' ng-disabled="frm.$invalid" class="btn btn-primary" />
												</div>
											</div>
										</form>
									</div>
									<!-- /.tab-pane -->

									<div class="tab-pane" id="chpass">
										<form class="form-horizontal"  ng-submit="submitpss()" name="myForm1">
											<div class="form-group">
												<label for="inputEmail" class="col-sm-2 control-label">Old Password</label>
												<div class="col-sm-10">
													<input type="password" ng-model="chpass.oldpass" name="oldpass"
														placeholder="Enter user name" required ng-minlength="3"
														class='form-control' />
													<!--Agular Validation Form  -->
													<span ng-show="myForm1.$dirty && myForm1.oldpass.$error.required"
														class="err">This is a required field</span> <span
														ng-show="myForm1.$dirty && myForm1.oldpass.$error.minlength"
														class="err">Minimum length required is 3</span> <span
														ng-show="myForm1.$dirty && myForm1.oldpass.$invalid" class="err">This
														field is invalid </span><br />
													<br />
												</div>
											</div>
											<div class="form-group">
												<label for="password" class="col-sm-2 control-label">New Password</label>

												<div class="col-sm-10">
													<input type="password" ng-model="chpass.newpass" name="newpass"
														placeholder="Enter user name" required ng-minlength="3"
														class='form-control' />
													<!--Agular Validation Form  -->
													<span ng-show="myForm1.$dirty && myForm1.newpass.$error.required"
														class="err">This is a required field</span> <span
														ng-show="myForm1.$dirty && myForm1.newpass.$error.minlength"
														class="err">Minimum length required is 3</span> <span
														ng-show="myForm1.$dirty && myForm1.newpass.$invalid" class="err">This
														field is invalid </span>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-offset-2 col-sm-10">
													<button type="submit" class="btn btn-primary">Submit</button>
												</div>
											</div>
										</form>
									</div>
									<!-- /.tab-pane -->
									
								    <!-- /.tab-pane -->
									<div class="tab-pane" id="updateinfo">
											<form class="form-horizontal" ng-submit="submit()" name="myForm">
											<div class="form-group">
												<label for="inputName" class="col-sm-2 control-label">Name</label>
												<div class="col-sm-10">
													<input type="text" name="uname" ng-model="user.username"
														placeholder="Enter user name" required ng-minlength="3"
														class='form-control' />
														<span>Update Name Will Effect After Will Re Login</span>
													<!--Agular Validation Form  -->
													<span ng-show="myForm.$dirty && myForm.uname.$error.required"
														class="err">This is a required field</span> <span
														ng-show="myForm.$dirty && myForm.uname.$error.minlength"
														class="err">Minimum length required is 3</span> <span
														ng-show="myForm.$dirty && myForm.uname.$invalid" class="err">This
														field is invalid </span>												
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-offset-2 col-sm-10">
													<input type="submit" value=" Update" ng-disabled="myForm.$invalid" class="btn btn-success" />
												</div>
											</div>
										</form>
									</div>
									<!-- /.tab-pane -->
								</div>
								<!-- /.tab-content -->
							</div>
							<!-- /.nav-tabs-custom -->
						</div>
					</div>
					<!-- /.box -->
				</div>

			</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<footer class="main-footer"> <jsp:include
			page="element/footer.jsp"></jsp:include> </footer>

		<jsp:include page="element/rightslidebar.jsp"></jsp:include>
		<!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>

	</div>
	<!-- ./wrapper -->

	 <jsp:include page="import/footer.jsp"></jsp:include>

	<script>
		var app = angular.module('myApp', []);
		app
				.controller(
						'myCtrl',
						function($scope, $http,  $location) {
							//Variable for Configuration

							
							$scope.weburl = $location.protocol()+"://"+$location.host()+":"+$location.port();
				
							$scope.domain =  $scope.weburl  + "/AKNnews/";
							
							//user when edit user
							$scope.user = {
								id :'${sessionScope.SessionUser.id}',
								username : ''
							};
							
							$scope.chpass={
								id :'${sessionScope.SessionUser.id}',
								newpass: '',
								oldpass:''
							}

							//for set header with http wehn request 
							$http.defaults.headers.common.Authorization = 'Basic YXBpOmFrbm5ld3M=';

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
											location.reload(true);
										}).error(function(response) {
											console.log(response);
										});
							}
							
		                /*      $scope.refereshsession=function(id){		             
		                    	 $http.get(
											$scope.domain + 'api/user/getuser/'+id).success(
											function(response) {
												console.log(response.DATA);
											}).error(function(response) {
										console.log(response);
									}); 
		                     } */
							
							//Function for update user infor 
							$scope.submit = function() {								
								$http.put(
											$scope.domain + 'api/user/update/',
											$scope.user).success(
											function(response) {
												alert(response.MESSAGE);
												
											}).error(function(response) {
										console.log(response);
									}); 

								}
							
							//Function for update user infor 
							$scope.submitpss = function() {	
								$http.put(
											$scope.domain + '/api/user/changepwd',
											$scope.chpass).success(
											function(response) {
												console.log(response);
												alert(response.MESSAGE);
												window.location.replace("${pageContext.request.contextPath }/login");
											}).error(function(response) {
										console.log(response);
									}); 

								}

						});
	
	</script>
</body>
</html>
