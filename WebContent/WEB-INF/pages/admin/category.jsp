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
   	  .error{
   	  	color:red;
   	  }
   	  
    	  .alert-success {
	    color: #31708F;
	    background-color: #D9EDF7;
	    border-color: #BCE8F1;
	} 

   </style>
   
   
  </head>
  <body class="hold-transition skin-blue sidebar-mini"   ng-app="myApp" ng-controller="myCtrl" >
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
            Category Management
            <!-- <small>Version 2.0</small> -->
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Category Management</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">         	          
		<div>
		
		  <!-- Modal ADD -->
		  <div class="modal fade" id="myAdd" role="dialog" data-keyboard="false" data-backdrop="static">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal" ng-click='reset()'>&times;</button>
		          <h4 class="modal-title">{{!category.id ? 'ADD NEW'  : 'UPDATE' }}</h4>
		        </div>
		        <div class="modal-body">
					<form ng-submit="submit()" name="myForm">
					<input type="hidden" ng-model="category.id" name="id" ng-disabled=true />
					  <h4>Name</h4>
			          <input type="text" ng-model="category.name" name="uname" placeholder="Enter category name" required ng-minlength="3" class='form-control'/>
			              <span class='error' ng-show="myForm.$dirty && myForm.uname.$error.minlength">Minimum length required is 3</span>
			          <h4>INDEX RANGE</h4>
			          <input type="number" ng-model="category.index" required class='form-control'/><br/>
			          
			          <input type="submit" value="{{!category.id ? 'Add'  : 'Update' }}" ng-disabled="myForm.$invalid" 
			          class="{{!category.id ? 'btn btn-success'  : 'btn btn-primary' }}" />
			          
			      	</form>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal" ng-click='reset()' >Close</button>
		        </div>
		      </div>
		      
		    </div>
		  </div>
		  
		  		  <!-- Modal View -->
		  <div class="modal fade" id="myView" role="dialog" data-keyboard="false" data-backdrop="static">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal" ng-click='reset()'>&times;</button>
		          <h4 class="modal-title">VIEW</h4>
		        </div>
		        <div class="modal-body">
					<table class="table " >	
			          	<tr>
			          		<th style="border-top: none !important; ">NAME</th>
			          		<td style="border-top: none !important; ">{{ category.name }}</td>
			          	</tr>
			          	<tr>
			          		<th>INDEX</th>
			          		<td>{{ category.index }}</td>
			          	</tr>
			            <tr>
			          		<th>IS_MENU</th>
			          		<td>{{ category.menu }}</td>
			          	</tr>
		          	</table>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal" ng-click='reset()'>Close</button>
		        </div>
		      </div>
		      
		    </div>
		  </div>
		  
		  		<!-- Modal Delete Msg -->
		  <div class="modal fade" id="myDelete" role="dialog" data-keyboard="false" data-backdrop="static">
		    <div class="modal-dialog">		    
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal" ng-click='reset()'>&times;</button>
		          <h4 class="modal-title">DELETE</h4>
		        </div>
		        <div class="modal-body">
		        	<center>
						<h4> Delete this category : " {{category.name}}  " ?</h4>
						<button type="button" class="btn btn-info" data-dismiss="modal" ng-click='reset()'>NO</button>					
						<button ng-click='deteteCategory(category.id)' class='btn btn-danger' data-dismiss="modal">YES</button>
					</center>					
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal" ng-click='reset()'>Close</button>
		        </div>
		      </div>
		      
		    </div>
		  </div>
		  
		<div>
			<button class='btn btn-success' data-toggle="modal" data-target="#myAdd"><i class="fa fa-plus"></i></button> <br/><br/>
		</div>
		
		<div>
			<div class="box">
				<div class="box-body table-responsive no-padding">
					<table class="table table-condensed table-hover">
						<tr>
							<th> ID </th>
							<th> NAME </th>
							<th> ORDER </th>	
							<th> STATUS  </th>	
							<th> ACTION </th>							
						</tr>
						<tr ng-repeat="cat in category_list">
							<td> {{cat.id}}</td>
							<td> <button class='btn btn-xs btn-warning'>{{cat.name}}</button></td>
							<td> <span class='text text-danger'> {{cat.index}} </span></td>
							<td> 							
								 <input type="checkbox"  value={{cat.menu}} ng-click="menuCategory(cat.id)" checked ng-if="cat.menu == true " />
						         <input type="checkbox" value={{cat.menu}} ng-click="menuCategory(cat.id,cat.status)" ng-if="cat.menu == false " />						               
							</td>
							<td> 
								<button ng-click='findCategoryById(cat.id)' class='btn btn-danger' data-toggle="modal" data-target="#myDelete"><i class="fa fa-times"></i></button>
								<button ng-click='findCategoryById(cat.id)' class='btn btn-primary' data-toggle="modal" data-target="#myAdd"><i class="fa fa-edit"></i></button>
								<button ng-click='findCategoryById(cat.id)' class='btn btn-info' data-toggle="modal" data-target="#myView"><i class="fa fa-eye"></i></button>
							 </td>	
						</tr>
					 
					</table>
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
		app.controller('myCtrl', function($scope,$http,$location) {
		    	 
		    // web base url 
			$scope.weburl = $location.protocol()+"://"+$location.host()+":"+$location.port();
			
			$scope.domain =  $scope.weburl  + "/AKNnews/";
			
			// parameter 
			
			// all category
			$scope.category={id:null,name:''};	
			// one category
			$scope.category_list = {};
			// http basic send header
		    var config = {headers: {
	            'Authorization': 'Basic YXBpOmFrbm5ld3M=',
	            'Accept': 'application/json;odata=verbose'
	       		 }
	    	};
		    
			// func update or insert category
		    $scope.submit = function() {
		    	if ( $scope.category.id == null){
		    		$scope.insertCategory();
		    	}else{
		    		$scope.updateCategory();
		    	}
		    	$scope.reset();
		    	angular.element('#myAdd').modal('hide');
		    }
		    
			// find cateogry exist in category_list by id
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
		    
			// reset form
 		    $scope.reset = function(){
 		    	$scope.category={id:null,name:''};
                $scope.myForm.$setPristine(); //reset Form
            }
		    
			// list all category
		    $scope.listCategory = function(){
			    $http.get(
						$scope.domain+'api/article/category/'
						,config
					).success(function(response){
						$scope.category_list = response.DATA;
						console.log( $scope.category_list );
					}).error(function(response){
						$scope.category_list = response;
					});	 
		    }
		    
		    $scope.listCategory();
		    
		    // insert category
		    $scope.insertCategory = function(){
		    	console.log('category', $scope.category);
			    $http.post(
						$scope.domain+'api/article/category/'
						,$scope.category
						,config
					).success(function(response){						
						$scope.category_list  = $scope.listCategory();
						console.log( response ); 	
						if ( response.STATUS == 404 ){
							swal( response.MESSAGE , "", "error");
						}else {
							swal( response.MESSAGE , "", "success");
						}
						console.log( $scope.category_list );
					}).error(function(response){
						console.log( response ); 
					});	 
		    }
		    
		    // update category
		    $scope.updateCategory = function(){
		    	console.log('category', $scope.category);
			    $http.put(
						$scope.domain+'api/article/category/'
						,$scope.category
						,config
					).success(function(response){						
						$scope.category_list  = $scope.listCategory();
						if ( response.STATUS == 404 ){
							swal( response.MESSAGE , "", "error");
						}else {
							swal( response.MESSAGE , "", "success");
						}
						console.log( $scope.category_list );
					}).error(function(response){
						console.log( response ); 
					});	  
		    }  
		    
		    // delete category
		    $scope.deteteCategory = function(id){
			    $http.delete(
						$scope.domain+'api/article/category/'+id
						,config
					).success(function(response){						
						$scope.category_list  = $scope.listCategory();
						if ( response.STATUS == 404 ){
							swal( response.MESSAGE , "", "error");
						}else {
							swal( response.MESSAGE , "", "success");
						}
						console.log( $scope.category_list );
						$scope.reset();
					}).error(function(response){
						console.log( response ); 
					});	  
		    }  
		    
		    // toggle category for show on top menu 
		    $scope.menuCategory = function(id){
			    $http.patch(
						$scope.domain+'api/article/category/toggle/'+id
						,''
						,config
					).success(function(response){						
						if ( response.STATUS == 404 ){
							swal( response.MESSAGE , "", "error");
						}else {
							swal( response.MESSAGE , "", "success");
						}
						console.log( $scope.category_list );
					}).error(function(response){
						console.log( response ); 
					});	  
		    }
		    
		    
		});
		</script>
  </body>
</html>
