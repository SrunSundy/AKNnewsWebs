<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Category | ADMIN</title>
    <!-- Tell the browser to be responsive to screen width -->

	<jsp:include page="import/header.jsp"></jsp:include>
   <style>
   i.ion{
   		margin-top: 25px;
   }
  
   </style>
   
   <script src= "${pageContext.request.contextPath }/resources/angularjs/angular.min.js"></script>
   
  </head>
  <body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
    
      <header class="main-header">
    	<jsp:include page="element/topheader.jsp"></jsp:include>
	  </header>
	  
		 <jsp:include page="element/leftslidebar.jsp"></jsp:include>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Article Management
            <small>Version 2.0</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Article Management</li>
          </ol>
        </section>

        <!-- Main content -->
        <!-- Main content -->
        <section class="content">
          
         	
         	this is category!
         	
         	
		<div ng-app="myApp" ng-controller="myCtrl">
		<br/>
		
		<form ng-submit="submit()" name="myForm">
		<input type="text" ng-model="category.id" name="id" ng-disabled=true />
          <input type="text" ng-model="category.name" name="uname" placeholder="Enter your name" required ng-minlength="3"/>
          
              <span ng-show="myForm.$dirty && myForm.uname.$error.required">This is a required field</span>
              <span ng-show="myForm.$dirty && myForm.uname.$error.minlength">Minimum length required is 4</span>
              <span ng-show="myForm.$dirty && myForm.uname.$invalid">This field is invalid </span><br/><br/>
          
          <input type="submit" value="{{!category.id ? 'Add' : 'Update'}}" ng-disabled="myForm.$invalid" >
      	</form>
		<br/>
		
		<button ng-click='insertCategory()'>insert</button>
		<table border="1">
			<tr>
				<td> ID </td>
				<td> NAME </td>
				<td> MENU </td>	
				<td> ACTION </td>							
			</tr>
			<tr ng-repeat="cat in category_list">
				<td> {{cat.id}}</td>
				<td> {{cat.name}}</td>
				<td> {{cat.menu}}
				
					 <input type="checkbox" value={{cat.menu}} ng-click="menuCategory(cat.id)" checked ng-if="cat.menu == true " />
			         <input type="checkbox" value={{cat.menu}} ng-click="menuCategory(cat.id,cat.status)" ng-if="cat.menu == false " />
			               
				</td>
				<td> 
					<button ng-click='deteteCategory(cat.id)'>delete</button>
					<button ng-click='findCategoryById(cat.id)'>view</button>
				 </td>	
			</tr>
		
		</table>
		
		</div>

		<script>
		var app = angular.module('myApp', []);
		app.controller('myCtrl', function($scope,$http) {
		    $scope.category={id:null,name:''};		 
		    
		    $scope.submit = function() {
		    	alert( $scope.category.id );
		    	if ( $scope.category.id == null){
		    		$scope.insertCategory();
		    		$scope.reset();
		    	}else{
		    		$scope.updateCategory();
		    		$scope.reset();
		    	}
                console.log('Form is submitted with following user', $scope.category);
		    }
		    
 		    $scope.findCategoryById = function(id){
                console.log('id to be edited', id);
                for(var i = 0; i < $scope.category_list.length; i++){
                    if( $scope.category_list[i].id === id) {
                    	$scope.category = angular.copy($scope.category_list[i]);
                    	console.log($scope.category);                    	
                       break;
                    }
                }
            } 
		    
 		    $scope.reset = function(){
 		    	$scope.category={id:null,name:''};
                $scope.myForm.$setPristine(); //reset Form
            }
		    
		    $scope.category_list = {};
		    var 
		    
		    var config = {headers: {
	            'Authorization': 'Basic YXBpOmFrbm5ld3M=',
	            'Accept': 'application/json;odata=verbose'
	       		 }
	    	};
		    $scope.listCategory = function(){
		    	alert("list");
			    $http.get(
						'http://localhost:8080/AKNnews/api/article/category/'
						,config
					).success(function(response){
						$scope.category_list = response.DATA;
						console.log( $scope.category_list );
					}).error(function(response){
						$scope.category_list = response;
					});	 
		    }
		    
		    $scope.listCategory();
		    
		    $scope.insertCategory = function(){
		    	alert("insert");
		    	console.log('category', $scope.category);
			    $http.post(
						'http://localhost:8080/AKNnews/api/article/category/'
						,$scope.category
						,config
					).success(function(response){						
						$scope.category_list  = $scope.listCategory();
						console.log( response ); 						
						console.log( $scope.category_list );
					}).error(function(response){
						console.log( response ); 
					});	 
		    }
		    
		    
		    $scope.updateCategory = function(){
		    	alert("update");
		    	console.log('category', $scope.category);
			    $http.put(
						'http://localhost:8080/AKNnews/api/article/category/'
						,$scope.category
						,config
					).success(function(response){						
						$scope.category_list  = $scope.listCategory();
						console.log( response ); 						
						console.log( $scope.category_list );
					}).error(function(response){
						console.log( response ); 
					});	  
		    }  
		    
		    $scope.deteteCategory = function(id){
		    	alert("delete");
			    $http.delete(
						'http://localhost:8080/AKNnews/api/article/category/'+id
						,config
					).success(function(response){						
						$scope.category_list  = $scope.listCategory();
						console.log( response ); 						
						console.log( $scope.category_list );
					}).error(function(response){
						console.log( response ); 
					});	  
		    }  
		    
		    $scope.menuCategory = function(id){
		    	alert("menu");
			    $http.patch(
						'http://localhost:8080/AKNnews/api/article/category/toggle/'+id
						,''
						,config
					).success(function(response){						
						$scope.category_list  = $scope.listCategory();
						console.log( response ); 						
						console.log( $scope.category_list );
					}).error(function(response){
						console.log( response ); 
					});	  
		    }
		    
		    
		});
		</script>
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	
         	
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
  
  
  </body>
</html>
