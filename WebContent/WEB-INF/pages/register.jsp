<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<!-- CSS -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/form-elements.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/sweetalert.css">
<style>
input[type="email"],select{
    width: 100%;
	height: 50px;
    margin: 0;
    padding: 0 20px;
    vertical-align: middle;
    background: #fff;
    font-family: 'Roboto', sans-serif;
    font-size: 16px;
    font-weight: 300;
    line-height: 50px;
    color: #888;
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px;
    border-radius: 4px;
    -moz-box-shadow: none;
    -webkit-box-shadow: none;
    box-shadow: none;
    -o-transition: all .3s;
    -moz-transition: all .3s;
    -webkit-transition: all .3s;
    -ms-transition: all .3s;
    transition: all .3s;
}
.form-group {
    margin-bottom: 0px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src= "${pageContext.request.contextPath }/resources/angularjs/angular.min.js"></script>
</head>
<body ng-app="myApp" ng-controller="myCtrl">
    <!-- Top content -->
        <div class="top-content">
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>AKN LOGIN</h3>
                            		<p>Register Information:</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-key"></i>
                        		</div>
                            </div>
                            <div class="form-bottom" >
			                    <form role="form" ng-submit="submit()" name="myForm">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">Username</label>
			                        	<input type="text"  ng-model="user.username" name="uname" placeholder="User Name..." required ng-minlength="3"  class="form-username form-control" style="border-radius: 0px !important;">
			                        	<!--Agular Validation Form  -->
										<span ng-show="myForm.$dirty && myForm.uname.$error.required" class="err">This is a required field</span>
										<span ng-show="myForm.$dirty && myForm.uname.$error.minlength" class="err">Minimum length required is 3</span>
									    <span ng-show="myForm.$dirty && myForm.uname.$invalid" class="err">This field is invalid </span><br />			                        
			                        </div>
			                        <div class="form-group" >
			                    		<label class="sr-only" for="form-username">Gender</label>
			                        	<select ng-model="selected" ng-options="opt as opt for opt in data" ng-init="selected='Female'" style="border-radius: 0px !important;"></select>									 
			                        </div>
			                        <div class="form-group" style="margin-top: 30px;">
			                    		<label class="sr-only" for="form-username">Email</label>
			                        	<input  type="email" ng-model="user.email" name="email" placeholder="Email..." required ng-minlength="3"  class="form-username form-control" style="border-radius: 0px !important;">
			                        	<!--Agular Validation Form  -->
			                        	<span ng-show="myForm.$dirty && myForm.email.$error.required" class="err">This is a required field</span>
										<span ng-show="myForm.$dirty && myForm.email.$error.minlength" class="err">Minimum length required is 3</span>
										<span ng-show="myForm.$dirty && myForm.email.$error.email" class="err">email format form</span>
									    <span ng-show="myForm.$dirty && myForm.email.$invalid" class="err">This field is invalid </span><br />		                        
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Password</label>
			                        	<input type="password" ng-model="user.password" required ng-minlength="5" name="password" placeholder="Password..." class="form-password form-control" ng-change='checkPassword()' style="border-radius: 0px !important;">
			                        	<!--Agular Validation Form  -->
										<span ng-show="myForm.$dirty && myForm.password.$error.required" class="err">This is a required field</span>
										<span ng-show="myForm.$dirty && myForm.password.$error.minlength" class="err">Minimum length required is 3</span>
									    <span ng-show="myForm.$dirty && myForm.password.$invalid" class="err">This field is invalid </span><br />		
			                        </div>
			                         <div class="form-group">
			                        	<label class="sr-only" for="form-password">Confirm Password</label>
			                        	<input type="password" ng-model='conpwd' required ng-minlength="5" name="confirmpassword" placeholder="Confirm Password..." class="form-password form-control" ng-change='checkPassword()' style="border-radius: 0px !important;">			                    		                   
			                        	<span ng-show="myForm.$dirty && myForm.confirmpassword.$error.required" class="err">This is a required field</span>
										<span ng-show="myForm.$dirty && myForm.confirmpassword.$error.minlength" class="err">Minimum length required is 3</span>
									    <span ng-show="myForm.$dirty && myForm.confirmpassword.$invalid" class="err">This field is invalid </span><br />
									    <span class='error'ng-show="statusShow">Password Not Match</span>	
			                        </div>
			                        <button type="submit" class="btn" ng-disabled="myForm.$invalid || status == false " style="border-radius: 0px !important;">Register</button>
			                    </form>
		                    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<script src="${pageContext.request.contextPath}/resources/assets/bootstrap/js/bootstrap.min.js"></script>        
<script src="${pageContext.request.contextPath}/resources/assets/sweetalert-dev.js"></script>
<script>
		var app = angular.module('myApp', []);
	        app.controller('myCtrl',function($scope, $http, $location) {			
				
	        	//for set header with http wehn request 
				$http.defaults.headers.common.Authorization = 'Basic YXBpOmFrbm5ld3M=';
	        	
	        	//Variable for Configuration
                
				$scope.weburl = $location.protocol()+"://"+$location.host()+":"+$location.port();
	
				$scope.domain =  $scope.weburl  + "/AKNnews/";
				
				$scope.conpwd = null;
				$scope.status = false;
				$scope.statusShow = false;
				
				 $scope.data =['Male','Female'];
				
	        	$scope.user={
	        			username:'',
	        			email:'',
	        			password:'',
	        			gender:''
	        	};
				//submit register user information
				$scope.submit=function(){
					$scope.user.gender=$scope.selected;
					$http.post($scope.domain + 'api/user/',
							$scope.user).success(
							function(response) {
								console.log(response);
								alert(response.MESSAGE);
							}).error(function(response) {
						console.log(response);
					});
				}
				
				//check password 
				$scope.checkPassword = function(){
					if ($scope.conpwd != $scope.user.password){
						$scope.status = false;
						$scope.statusShow = true;
						return;
					}
					$scope.statusShow = false;
					$scope.status = true;
				};
				
	        });
</script>
</body>
</html>


