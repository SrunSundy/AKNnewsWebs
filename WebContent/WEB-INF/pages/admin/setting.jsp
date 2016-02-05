<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Setting | AKNnews</title>
    <!-- Tell the browser to be responsive to screen width -->

	 <jsp:include page="import/header.jsp"></jsp:include> 
<style>
	.text-setting{
		font-weight: bold;
		font-style : italic;
	}
</style>
   
  </head>
  <body class="hold-transition skin-blue sidebar-mini"  ng-app="myApp" ng-controller="myCtrl">

    <div class="wrapper">
      <header class="main-header">
    	<jsp:include page="element/topheader.jsp"></jsp:include>
	  </header>
	  <jsp:include page="element/leftslidebar.jsp"></jsp:include>
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
   
        <!-- Main content -->
        <section class="content" style="margin-top:-15px;">
			<div class="row">
						<div class="col-md-12 wrapper-cover" >
							<div class="row">
							
								<div class="col-md-12 background-cover"  id="background-cover" style="background: url('${pageContext.request.contextPath }/resources/images/user/bguser.jpg');	background-size: 100% 310px;"> 
									<div class="col-md-2 box-background" >
										<div class="col-md-12 box-space"  >
											<div class="wrapper-btn">
												<div  class="fileUpload btn btn-primary btn-upload" >
													<span><i class="fa fa-camera setting"></i>Update Cover</span>
													<input type="file" class="upload" id="backgroudFeild"/>
												</div>
											</div>
										</div>
										<div class="col-md-12" align="center" >
											<!--load image-->
											<div  class="box-img" id="img-box">
											
												 <img  src="http://api.khmeracademy.org/resources/upload/file/${sessionScope.SessionUser.userImageUrl}" alt="User Avatar" class="profile-image" id="profile-image">
												<div id="img-change" class="change-img"></div>
												<div class="fileUpload">
													<span><i class="fa fa-camera icon-camera"></i></span>
													<input type="file" class="upload" id="picField" name="picField" onchange="angular.element(this).scope().updateProfile(this)"/>
												</div>
												<h5 class="update-profile-string">Update Profile <br>Picture</h5>
											</div>
											<!--close load image-->
										</div>
									</div>
									<div class="col-md-10"></div>
								</div>
								
								
								<div class="col-md-12 box-setting-menu" > 
									<div class="col-xs-12">
										<div class="row"><div class="row">
									<div class="" style="overflow: hidden;"><br>
				
										
											<div class="nav-tabs-custom">
												<ul class="nav nav-tabs">
													<li class="active"><a href="#profile" data-toggle="tab" class="text-setting"
													aria-expanded="true"><i class="setting fa fa-user"></i>Profile & Update</a></li>
													<li class=""><a href="#chpass" data-toggle="tab" class="text-setting"
														aria-expanded="false"><i class="setting fa fa-key"></i>Change Password</a></li>
													
												</ul>
												
												<div class="tab-content">
													<br>
													<div class="tab-pane active" id="profile">
														<!-- Post -->
														<div class="col-md-12">
															<div class="post">
																<div class="user-block">
																	 <img style="border-radius:100%" src="http://api.khmeracademy.org/resources/upload/file/${sessionScope.SessionUser.userImageUrl}" alt="User Avatar" >
																	<span class="username"><a>${sessionScope.SessionUser.username}</a></span> 
																	<span class="description">Admin</span>
																	<span class="description">${sessionScope.SessionUser.email}</span> 
																</div>
																<!-- /.user-block -->
															</div>
														</div>
														
														<form class="form-horizontal" ng-submit="submit()" name="myForm">
															<div class="form-group">
																<div class="col-md-12"><div class="col-md-12">
																	<label for="inputName" class="">Name</label>																
																	<input type="text" name="uname" ng-model="user.username"
																			placeholder="Enter user name" required ng-minlength="3"
																			class='form-control' />
																			<span style="font-style:italic;color:#BDBDBD;">Update Name will effect after you Re Login</span><br>
																		<!--Agular Validation Form  -->
																	<span ng-show="myForm.$dirty && myForm.uname.$error.required"
																			class="err">This is a required field</span> <span
																			ng-show="myForm.$dirty && myForm.uname.$error.minlength"
																			class="err">Minimum length required is 3</span> <span
																			ng-show="myForm.$dirty && myForm.uname.$invalid" class="err">This
																			field is invalid </span>												
																</div></div>
															</div>
															<div class="form-group">
																<div class="col-md-12"><div class="col-md-12">
																	<input type="submit" value=" Update" ng-disabled="myForm.$invalid" class="btn btn-primary" />
																</div></div>
															</div>
														</form>
														<!-- /.post -->
													</div>
													<br>
													<div class="tab-pane" id="chpass">
														<form class="form-horizontal"  ng-submit="submitpss()" name="myForm1">
															<div class="form-group">
																<div class="col-md-12"><div class="col-md-12">
																	<label for="inputEmail" class="">Old Password</label>															
															        <input type="password" ng-model="chpass.oldpass" name="oldpass"
																			placeholder="Enter user name" required ng-minlength="3"
																			class='form-control' />
																		<!--Agular Validation Form  -->
																	<span ng-show="myForm1.$dirty && myForm1.oldpass.$error.required"
																			class="err">This is a required field</span> <span
																			ng-show="myForm1.$dirty && myForm1.oldpass.$error.minlength"
																			class="err">Minimum length required is 3</span> <span
																			ng-show="myForm1.$dirty && myForm1.oldpass.$invalid" class="err">This
																			field is invalid </span>
																</div></div>
															</div>
															<div class="form-group">
																<div class="col-md-12"><div class="col-md-12">
																	<label for="password" class="">New Password</label>																				
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
																</div></div>
															</div>
															<div class="form-group">
																<div class="col-md-12"><div class="col-md-12">
																	<button type="submit" class="btn btn-primary">Change</button>
																</div></div>
															</div>
														</form>
													</div>
													<!-- /.tab-pane -->
													
												    <!-- /.tab-pane -->
												<!-- 	<div class="tab-pane" id="updateinfo">
															<form class="form-horizontal" ng-submit="submit()" name="myForm">
															<div class="form-group">
																<div class="col-md-12"><div class="col-md-12">
																	<label for="inputName" class="">Name</label>																
																	<input type="text" name="uname" ng-model="user.username"
																			placeholder="Enter user name" required ng-minlength="3"
																			class='form-control' />
																			<span style="font-style:italic;color:#BDBDBD;">Update Name Will Effect After Will Re Login</span><br>
																		Agular Validation Form 
																	<span ng-show="myForm.$dirty && myForm.uname.$error.required"
																			class="err">This is a required field</span> <span
																			ng-show="myForm.$dirty && myForm.uname.$error.minlength"
																			class="err">Minimum length required is 3</span> <span
																			ng-show="myForm.$dirty && myForm.uname.$invalid" class="err">This
																			field is invalid </span>												
																</div></div>
															</div>
															<div class="form-group">
																<div class="col-md-12"><div class="col-md-12">
																	<input type="submit" value=" Update" ng-disabled="myForm.$invalid" class="btn btn-primary" />
																</div></div>
															</div>
														</form>
													</div> -->
													<!-- /.tab-pane -->
												</div>
												<!-- /.tab-content -->
											</div>
											<!-- /.nav-tabs-custom -->
										
									</div></div>
									</div>
									<!-- /.box -->
								</div>
								</div> 
								
								
								
							</div>
						</div>
		
			</div>
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
     <footer class="main-footer">
	      <jsp:include page="element/footer.jsp"></jsp:include>
	</footer>
    
    <jsp:include page="element/rightslidebar.jsp"></jsp:include>
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
      <div class="control-sidebar-bg"></div>

		
    </div><!-- ./wrapper -->

   <jsp:include page="import/footer.jsp"></jsp:include> 
  

	<script>
	var app = angular.module('myApp', []);
	app.controller('myCtrl',function($scope, $http,  $location,$window) {
		//for set header with http wehn request 
		 $http.defaults.headers.common.Authorization = 'Basic S0FBUEkhQCMkOiFAIyRLQUFQSQ==';
		 
		
		 
		$scope.domain = $location.protocol() + "://"+ $location.host() + ":" + $location.port();
		$scope.webbaseurl = $scope.domain + "/AKNnewsWebs/";
	    $scope.baseurl = $scope.domain + "/AKNnews/";
		
	    //user when edit user
		$scope.user = {
				userId : '${sessionScope.SessionUser.userId}',
				username : ''
		};
		$scope.chpass = {
				userId : '${sessionScope.SessionUser.userId}',
				newPassword : '',
				oldPassword : ''
		};
	

		//Function for upload user image profile
		$scope.updateProfile = function(evt){
	
					var userid ="<c:out value='${sessionScope.SessionUser.userId}'></c:out>";
					var data1;
				    data1 = new FormData();
				    data1.append('file', $('#picField')[0].files[0]);
				    data1.append("url",userid);
				    data1.append("filename",userid);
				    
				    //confirmed alert
				    swal({   title: "Are you sure?",   
				    		 text: "Your profile image will be changed", 
				    		 type: "warning",   showCancelButton: true,   
				    		 confirmButtonColor: "#DD6B55",   
				    		 confirmButtonText: "Yes, do it!",   
				    		 cancelButtonText: "No, cancel plx!",   
				    		 closeOnConfirm: false,  
				    		 closeOnCancel: false 
				    	  }, 
				    	  function(isConfirm){   
				    		  if (isConfirm) {     
				    			  $http({
						    		  	url: "http://api.khmeracademy.org/api/uploadfile/update",
								        method: 'POST',
								        headers: {
								        	'Content-Type': undefined ,
								        },
								        data: data1,
						        
								     }).success(function(response) {
								    	 
									        console.log('Request finished', response);
											document.getElementById("profile-image").src = fr.result;
									        $window.location.reload();
								     }).error(function (response) {
											swal("Fail to update profile", "", "error");
								   });
				    		} else {    
				    			swal("Cancelled", "Your imaginary file is safe :)", "error");   
				    		} 
				    });
				    
				
		};
		//Function for update user infor 
		$scope.submit = function() {
			$http.put($scope.baseurl + 'api/user/update/',$scope.user).success(function(response) {
				alert(response.MESSAGE);
			}).error(function(response) {
				console.log(response);
			});

		};
		//Function for update user infor 
		$scope.submitpss = function() {
			$http.put($scope.baseurl+ 'api/user/changepwd',$scope.chpass).success(function(response) {
				console.log(response);
				if(response.MESSAGE=="FAILD TO CHANGE PASSWORD"){
					swal("Fail to update password", "your old password might be wrong", "error");
					return;
				}
				//swal("Fail to update password", "", "success");
				window.location.replace("${pageContext.request.contextPath }/login");
			}).error(function(response) {
				swal("Fail to update password", "your old password might be wrong", "error");
			});

		}

	});
	</script>
  </body>
</html>
