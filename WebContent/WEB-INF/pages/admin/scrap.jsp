<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    	<meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1" />
    	<title>Admin AKN | Scrap News From Website</title>
    	<jsp:include page="import/header.jsp"></jsp:include> 
       <style>
       	  .error{
	   	  	color:red;
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
        		<!-- Content Header (Page header) -->
		        <section class="content-header">
			          <h1>Scraping Management <small>Version 2.0</small></h1>
			          <ol class="breadcrumb">
			            	<li><a href="#"><i class="fa fa-dashboard"></i> Scrap </a></li>
			            	<li>Scrap Management</li>
			            	<li class="active">Scrap Management</li>
			          </ol>
		        </section>
		        <!-- Main content -->
		        <section class="content">
		          	<div class="row">
						<div class="col-md-12">
				              <div class="box ">
				                <div class="box-header with-border">
				                  <h3 class="box-title">Scraping</h3>
				                </div>
				                <div class="box-body"> 
				                	<form name="myForm" ng-submit='scrapSite()' >
				                	<div class="col-md-12">
				                		<div class="col-md-12">
				                		     <div class="input-group">
						                     	 <span class="input-group-addon">Web Site</span>
												    <select name="s_select" id="s_select" ng-model="id" required class='form-control'>
												      <option value="">Choose Website</option>
												      <option ng-repeat="site in site_list" value="{{site.id}}" ng-hide="{{site.name=='AKNnews'}}">{{site.name}}</option>
												    </select>
						                  	 </div><br>
						                 </div>
				                	</div>
				                	<div class="col-md-12">
					                	<div class="col-md-10">
					                	 	<span class='error' ng-show="myForm.$dirty && myForm.s_select.$error.required">This is a required field</span>
					                	</div>
				                		<div class="col-md-2">
				                			<input style="width:100%" type="submit" value="SCRAP" ng-disabled="myForm.$invalid" class="btn btn-success" />
				                		</div>
				                	</div>
								</form>
								<center >
									<img ng-if="loadingStatus" src='${pageContext.request.contextPath }/resources/images/loading.gif'/>
								</center>
				                </div><!-- /.box-body -->
				              </div><!-- /.box -->
          				</div>	          		
		          	</div>
		            <div class="col-md-12"></div><!-- /.col-->
		        </section><!-- /.content -->
    		</div><!-- /.content-wrapper -->
    		
    				 
    		<footer class="main-footer">
	      		<jsp:include page="element/footer.jsp"></jsp:include>
			</footer>
    
   			<jsp:include page="element/rightslidebar.jsp"></jsp:include>
      		<div class="control-sidebar-bg"></div>
    </div><!-- ./wrapper -->
  
  <jsp:include page="import/footer.jsp"></jsp:include>
    <script>
	var app = angular.module('myApp', []);
	
	app.controller('myCtrl', function($scope, $http, $location){

		$scope.domain = $location.protocol()+"://"+$location.host()+":"+$location.port();

		$scope.webbaseurl = $scope.domain + "/AKNnewsWebs/";
		
		$scope.baseurl = $scope.domain + "/AKNnews/";
		
		
		$http.defaults.headers.common.Authorization = 'Basic YXBpOmFrbm5ld3M=';
		
		angular.element(".select2").select2();
		
		$scope.loadingStatus = false;
		
		$scope.show_loading = true;
		$scope.id = null;
		$scope.effected = null;
		$scope.site_list = {};
	    $scope.listsite = function(){
		    $http.get(
		    		$scope.baseurl+'api/article/site/'					
				).success(function(response){
					$scope.site_list = response.DATA;
					console.log( $scope.site_list );
				}).error(function(response){
					$scope.site_list = response;
				});	 
	    };
	    
	    $scope.scrapSite = function(){
	    	$scope.loadingStatus = true;
	    	
  		    $http.get(
  		    		$scope.baseurl+'api/scrap/site/'+$scope.id
				).success(function(response){
					alert(response.CONTENT + " Row(s) Affected..!");
					$scope.loadingStatus = false;
					
				}).error(function(response){
					console.log( response );
				});	 
	    };
	    
	    $scope.listsite();
	});
  
    
    </script>
  
  </body>
</html>
