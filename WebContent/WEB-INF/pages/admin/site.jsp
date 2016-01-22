<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>site | ADMIN</title>
    <!-- Tell the browser to be responsive to screen width -->

	<jsp:include page="import/header.jsp"></jsp:include>
   <style>
   i.ion{
   		margin-top: 25px;
   }
   	  .ng-required{
   	  	color:red;
   	  }
      .ng-invalid {
          color: red;
      }
      .ng-dirty.ng-invalid-required {
          color: red;
      }
      ng-dirty.ng-invalid-minlength {
          color: red;
      }
      
      .img{
      	width: 30px;
      	height: 30px;
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
            Site Management
            <!-- <small>Version 2.0</small> -->
          </h1>
          <ol class="breadcrumb">
            <!-- <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li> -->
            <li class="active">Site Management</li>
          </ol>
        </section>

        <!-- Main content -->
        <!-- Main content -->
        
        <section class="content">         	          
		<div ng-app="myApp" ng-controller="myCtrl" >
		<c:set var="base_url" value="http://localhost:8080/AKNnews/resources/images/"/>
		<br/>
		
		  <!-- Modal ADD -->
		  <div class="modal fade" id="myAdd" role="dialog" data-keyboard="false" data-backdrop="static">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal" ng-click='reset()'>&times;</button>
		          <h4 class="modal-title">{{!site.id ? 'ADD NEW'  : 'UPDATE' }}</h4>
		        </div>
		        <div class="modal-body">
					<form ng-submit="submit()" name="myForm">
					<input type="hidden" ng-model="site.id" name="id" ng-disabled=true />
					  <h4>Name</h4>
			          <input type="text" ng-model="site.name" name="uname" placeholder="Enter site name" required ng-minlength="3" class='form-control'/>
			          
			              <span ng-show="myForm.$dirty && myForm.uname.$error.required">This is a required field</span>
			              <span ng-show="myForm.$dirty && myForm.uname.$error.minlength">Minimum length required is 3</span>
			              <span ng-show="myForm.$dirty && myForm.uname.$invalid">This field is invalid </span><br/><br/>
			          <h4>URL</h4>  
			          <input type="text" ng-model="site.url" name="url" placeholder="Enter site url" required ng-minlength="3" class='form-control'/>
			          
			              <span ng-show="myForm.$dirty && myForm.url.$error.required">This is a required field</span>
			              <span ng-show="myForm.$dirty && myForm.url.$error.minlength">Minimum length required is 3</span>
			              <span ng-show="myForm.$dirty && myForm.url.$invalid">This field is invalid </span><br/><br/>    
			         <h4>BASEPATH</h4>     
			         <input type="text" ng-model="site.basepath" name="basepath" placeholder="Enter site basepath" class='form-control'/>
			         <br/>   
			          
			          <input type="submit" value="{{!site.id ? 'Add'  : 'Update' }}" ng-disabled="myForm.$invalid" 
			          class="{{!site.id ? 'btn btn-success'  : 'btn btn-primary' }}" />
			          
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
			          		<td style="border-top: none !important; ">{{ site.name }}</td>
			          	</tr>
			            <tr>
			          		<th>URL</th>
			          		<td>{{ site.url }}</td>
			          	</tr>
			          	<tr>
			          		<th>LOGO</th>
			          		<td><img class="img"  src='${base_url}{{site.logo}}' data-toggle="modal"/></td>
			          	</tr>
			      	    <tr>
			          		<th>BASEPATH</th>
			          		<td>{{ site.basepath }}</td>
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
						<h4> Delete this site : " {{site.name}}  " ?</h4>
						<button type="button" class="btn btn-info" data-dismiss="modal" ng-click='reset()'>NO</button>					
						<button ng-click='detetesite(site.id)' class='btn btn-danger' data-dismiss="modal">YES</button>
					</center>					
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal" ng-click='reset()'>Close</button>
		        </div>
		      </div>
		      
		    </div>
		  </div>
		  
		  	  <!-- Modal View -->
		  <div class="modal fade" id="myUpload" role="dialog" data-keyboard="false" data-backdrop="static">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal" ng-click='reset()'>&times;</button>
		          <h4 class="modal-title">UPLOAD LOGO</h4>
		        </div>
		        <div class="modal-body">
					<form id="frmupload" name="frm" ng-submit='changeLogo()' enctype="multipart/form-data">
						<input type="hidden" value='{{site.id}}' required name="id" id="id"/> 
						<input type="file" name="file" id="file" required class="form-control"/><br/>
						<input type="submit" value='upload' ng-disabled="frm.$invalid" class="btn btn-primary" />
					</form>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal" ng-click='reset()'>Close</button>
		        </div>
		      </div>
		      
		    </div>
		  </div>
		<br/>
		<div>
			<button class='btn btn-success' data-toggle="modal" data-target="#myAdd">ADD NEW</button> <br/><br/>
		</div>

		
		<div>
			<div class="box">
				<div class="box-body table-responsive no-padding">
					<table class="table table-condensed table-hover">
						<tr>
							<th> ID </th>
							<th> NAME </th>
							<th> URL </th>	
							<th> LOGO </th>	
							<th> BASEPATH </th>	
							<th> ACTION </th>							
						</tr>
						<tr ng-repeat="st in site_list">
							<td> {{st.id}}</td>
							<td> {{st.name}}</td>
							<td> {{st.url}}</td>
							<td> <img class="img"  src='${base_url}{{st.logo}}' data-toggle="modal" data-target="#myUpload" ng-click='findsiteById(st.id)' />  
								 <!-- <button ng-click='findsiteById(st.id)' class='btn btn-warning' data-toggle="modal" data-target="#myUpload">change logo</button> -->
							</td>
							<td> {{st.basepath}}</td>
							<td> 
								<button ng-click='findsiteById(st.id)' class='btn btn-danger' data-toggle="modal" data-target="#myDelete">DELETE</button>
								<button ng-click='findsiteById(st.id)' class='btn btn-primary' data-toggle="modal" data-target="#myAdd">UPDATE</button>
								<button ng-click='findsiteById(st.id)' class='btn btn-info' data-toggle="modal" data-target="#myView">VIEW</button>
							 </td>	
						</tr>
					 
					</table>
				</div>
				
			</div>
			
		</div>

		
		</div>

		<script>
		var app = angular.module('myApp', []);
		app.controller('myCtrl', function($scope,$http) {
		    $scope.site={id:null,name:'',url:'',logo:'',basepath:'' };		 
		    
		    $scope.submit = function() {
		    	//alert( $scope.site.id );
		    	if ( $scope.site.id == null){
		    		$scope.insertsite();
		    		$scope.reset();
		    	}else{
		    		$scope.updatesite();
		    		$scope.reset();
		    	}
                console.log('Form is submitted with following user', $scope.site);
                
                
		    }
		    
 		    $scope.findsiteById = function(id){
                console.log('id to be edited', id);
                for(var i = 0; i < $scope.site_list.length; i++){
                    if( $scope.site_list[i].id === id) {
                    	$scope.site = angular.copy($scope.site_list[i]);
                    	console.log($scope.site);                    	
                       break;
                    }
                }
            } 
		    
 		    $scope.reset = function(){
 		    	$scope.site={id:null,name:'',url:'',logo:'',basepath:'' };	
                $scope.myForm.$setPristine(); //reset Form
            }
		    
		    $scope.site_list = {};
		    var url = 'http://localhost:8080/AKNnews/api/';
		    
		    var config = {headers: {
	            'Authorization': 'Basic YXBpOmFrbm5ld3M=',
	            'Accept': 'application/json;odata=verbose'
	       		 }
	    	};
		    $scope.listsite = function(){
		    	////alert("list");
			    $http.get(
						url+'article/site/'
						,config
					).success(function(response){
						$scope.site_list = response.DATA;
						console.log( $scope.site_list );
					}).error(function(response){
						$scope.site_list = response;
					});	 
		    }
		    
		    $scope.listsite();
		    
		    $scope.insertsite = function(){
		    	//alert("insert");
		    	console.log('site', $scope.site);
			    $http.post(
						url+'article/site/'
						,$scope.site
						,config
					).success(function(response){						
						$scope.site_list  = $scope.listsite();
						console.log( response ); 						
						console.log( $scope.site_list );
					}).error(function(response){
						console.log( response ); 
					});	 
		    }
		    
		    
		    $scope.updatesite = function(){
		    	//alert("update");
		    	console.log('site', $scope.site);
			    $http.put(
						url+'article/site/'
						,$scope.site
						,config
					).success(function(response){						
						$scope.site_list  = $scope.listsite();
						console.log( response ); 						
						console.log( $scope.site_list );
					}).error(function(response){
						console.log( response ); 
					});	  
		    }  
		    
		    $scope.detetesite = function(id){
		    	////alert("delete");
			    $http.delete(
						url+'article/site/'+id
						,config
					).success(function(response){						
						$scope.site_list  = $scope.listsite();
						console.log( response ); 						
						console.log( $scope.site_list );
						$scope.reset();
					}).error(function(response){
						console.log( response ); 
					});	  
		    }  
		    
		    $scope.changeLogo = function(){
		    	var form_data = new FormData(document.getElementById('frmupload'));
		    	
  			    $http.post(
						url+'article/site/upload'
						,form_data
						,{
							transformRequest : angular.identity,
							headers: {
				            'Authorization': 'Basic YXBpOmFrbm5ld3M=',
				            'Accept': 'application/json;odata=verbose',
				            'Content-Type' : undefined
				       		 }
						}
					).success(function(response){						
						$scope.site_list  = $scope.listsite();
						console.log( response ); 	
						console.log($scope.site);
						console.log( $scope.site_list );
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
