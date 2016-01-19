<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SITE DETAIL | ADMIN</title>
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
 
  
   </style>
   
  <%--  <script src= "${pageContext.request.contextPath }/resources/angularjs/angular.min.js"></script> --%>
   
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
            Site Detail Management
            <!-- <small>Version 2.0</small> -->
          </h1>
          <ol class="breadcrumb">
            <!-- <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li> -->
            <li class="active">Site Detail Management</li>
          </ol>
        </section>

        <!-- Main content -->
        <!-- Main content -->
        
        <section class="content">         	          
		<div ng-app="myApp" ng-controller="myCtrl" >
		<br/>
		
		  <!-- Modal ADD -->
		  <div class="modal fade" id="myAdd" role="dialog" data-keyboard="false" data-backdrop="static">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal" ng-click='reset()'>&times;</button>
		          <h4 class="modal-title">{{!sitedetail.id ? 'ADD NEW'  : 'UPDATE' }}</h4>
		        </div>
		        <div class="modal-body">
					<form ng-submit="submit()" name="myForm">
					<input type="hidden" ng-model="sitedetail.id" name="id" ng-disabled=true />
					  <h4>Name</h4>
			          <input type="text" ng-model="sitedetail.name" name="uname" placeholder="Enter sitedetail name" required ng-minlength="3" class='form-control'/>
			          
			              <span ng-show="myForm.$dirty && myForm.uname.$error.required">This is a required field</span>
			              <span ng-show="myForm.$dirty && myForm.uname.$error.minlength">Minimum length required is 3</span>
			              <span ng-show="myForm.$dirty && myForm.uname.$invalid">This field is invalid </span><br/><br/>
			          
			          <input type="submit" value="{{!sitedetail.id ? 'Add'  : 'Update' }}" ng-disabled="myForm.$invalid" 
			          class="{{!sitedetail.id ? 'btn btn-success'  : 'btn btn-primary' }}" />
			          
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
		          <h4 class="modal-title">ADD NEW</h4>
		        </div>
		        <div class="modal-body">
					<table class="table " >	
			          	<tr>
			          		<th style="border-top: none !important; ">NAME</th>
			          		<td style="border-top: none !important; ">{{ sitedetail.name }}</td>
			          	</tr>
			            <tr>
			          		<th>IS_MENU</th>
			          		<td>{{ sitedetail.menu }}</td>
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
						<h4> Delete this sitedetail : " {{sitedetail.name}}  " ?</h4>
						<button type="button" class="btn btn-info" data-dismiss="modal" ng-click='reset()'>NO</button>					
						<button ng-click='detetesitedetail(sitedetail.id)' class='btn btn-danger' data-dismiss="modal">YES</button>
					</center>					
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal" ng-click='reset()'>Close</button>
		        </div>
		      </div>
		      
		    </div>
		  </div>
		  
          <form name="myForm2" ng-submit='submit()' ><!-- ng-click='submit()' -->
		    <label for="repeatSelect"> Repeat select: </label>
		    <select name="c_select" id="c_select" ng-model="sitedetail.c_id" required>
		      <option value="">---Please select---</option>
		      <option ng-repeat="cate in category_list" value="{{cate.id}}" >{{cate.name}}</option>
		    </select>
		    
		    <select name="s_select" id="s_select" ng-model="sitedetail.s_id" required>
		      <option value="">---Please select---</option>
		      <option ng-repeat="site in site_list" value="{{site.id}}">{{site.name}}</option>
		    </select>
		    <input type="text" ng-model="sitedetail.url" name="url" placeholder="Enter sitedetail url" required/>
		   <!--  <input type="submit" value='Add' /> -->
		    <input type="submit" value="{{!sitedetail.id ? 'Add'  : 'Update' }}" ng-disabled="myForm2.$invalid" 
			          class="{{!sitedetail.id ? 'btn btn-success'  : 'btn btn-primary' }}" />
		  </form>
		  <hr>
		  <tt>repeatSelect category = {{sitedetail.c_id}}</tt><br/>
		  <tt>repeatSelect site = {{sitedetail.s_id}}</tt><br/>
		
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
							<th> SITE </th>
							<th> CATEGORY </th>	
							<th> URL </th>
							<th> STATUS </th>	
							<th> ACTION </th>							
						</tr>
						<tr ng-repeat="cat in sitedetail_list">
							<td> xxx </td>
							<td> {{cat.s_id}}</td>
							<td> {{cat.c_id}}</td>
							<td> {{cat.url}}</td>
							<td> {{cat.status}}
								 <input type="checkbox" value={{cat.status}} ng-click="statusSiteDetail(cat.s_id,cat.c_id)" checked ng-if="cat.status == true " />
						         <input type="checkbox" value={{cat.status}} ng-click="statusSiteDetail(cat.s_id,cat.c_id)" ng-if="cat.status == false " />		
							</td>
							<td> 
							<button ng-click='findsitedetailById(cat.s_id,cat.c_id)'>test</button>
								<button ng-click='findsitedetailById(cat.s_id,cat.c_id)' class='btn btn-primary' data-toggle="modal" data-target="#myAdd">UPDATE</button>
								<button ng-click='findsitedetailById(cat.s_id,cat.c_id)' class='btn btn-info' data-toggle="modal" data-target="#myView">VIEW</button>
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
		    $scope.sitedetail={id:null,c_id:'',s_id:'',url:'',status:''};		 
		    
		    $scope.c_data = {c_repeat: null};
		    $scope.s_data = {s_repeat: null};
		    
		    $scope.submit = function() {
		    	//alert( $scope.sitedetail.id );
		    	if ( $scope.sitedetail.id == null){
		    		$scope.insertsitedetail();
		    		$scope.reset();
		    	}else{
		    		$scope.updatesitedetail();
		    		$scope.reset();
		    	}
                console.log('Form is submitted with following user', $scope.sitedetail);                
		    }
		    
 		    $scope.findsitedetailById = function(s_id, c_id){
                console.log('id to be edited', s_id +"      "+c_id);
                for(var i = 0; i < $scope.sitedetail_list.length; i++){
                	//alert(i);
                    if( $scope.sitedetail_list[i].s_id === s_id && $scope.sitedetail_list[i].c_id === c_id ) {
                    	$scope.sitedetail = angular.copy($scope.sitedetail_list[i]);
                    	console.log($scope.sitedetail);   
                    	$scope.sitedetail.id=100;
                       //alert(1);
                       break;
                    }
                }
            } 
		    
 		    $scope.reset = function(){
 		    	$scope.sitedetail={id:null,c_id:'',s_id:'',url:'',status:''};	
                $scope.myForm.$setPristine(); //reset Form
            }
		    
		    $scope.sitedetail_list = {};
		    var url = 'http://localhost:8080/AKNnews/api/';
		    
		    var config = {headers: {
	            'Authorization': 'Basic YXBpOmFrbm5ld3M=',
	            'Accept': 'application/json;odata=verbose'
	       		 }
	    	};
		    $scope.listsitedetail = function(){
		    	////alert("list");
			    $http.get(
						url+'article/sitedetail/'
						,config
					).success(function(response){
						$scope.sitedetail_list = response.DATA;
						console.log( $scope.sitedetail_list );
					}).error(function(response){
						$scope.sitedetail_list = response;
					});	 
		    }
		    
		    $scope.listsitedetail();
		    
		    $scope.insertsitedetail = function(){
		    	alert("insert");
 		    	console.log('sitedetail', $scope.sitedetail);
 			    $http.post(
						url+'article/sitedetail/'
						,$scope.sitedetail
						,config
					).success(function(response){						
						$scope.sitedetail_list  = $scope.listsitedetail();
						console.log( response ); 						
						console.log( $scope.sitedetail_list );
					}).error(function(response){
						console.log( response ); 
					});	  
		    }
		    
		    
		    $scope.updatesitedetail = function(){
		    	//alert("update");
		    	console.log('sitedetail', $scope.sitedetail);
			    $http.put(
						url+'article/sitedetail/'
						,$scope.sitedetail
						,config
					).success(function(response){						
						$scope.sitedetail_list  = $scope.listsitedetail();
						console.log( response ); 						
						console.log( $scope.sitedetail_list );
					}).error(function(response){
						console.log( response ); 
					});	  
		    }  
		    
		    $scope.detetesitedetail = function(id){
		    	////alert("delete");
			    $http.delete(
						url+'article/sitedetail/'+id
						,config
					).success(function(response){						
						$scope.sitedetail_list  = $scope.listsitedetail();
						console.log( response ); 						
						console.log( $scope.sitedetail_list );
						$scope.reset();
					}).error(function(response){
						console.log( response ); 
					});	  
		    }  
		    
		    $scope.statusSiteDetail = function(s_id, c_id){
		    	alert("status");
			    $http.patch(
						url+'article/sitedetail/toggle/'+s_id+'/'+c_id
						,''
						,config
					).success(function(response){						
						$scope.category_list  = $scope.sitedetail_list();
						console.log( response ); 						
						console.log( $scope.sitedetail_list );
					}).error(function(response){
						console.log( response ); 
					});	  
		    }
		    
		    /**
		    	Drop down category and site
		    */
		    $scope.category_list = {};
		    $scope.listcategory = function(){
			    $http.get(
						url+'article/category/'
						,config
					).success(function(response){
						$scope.category_list = response.DATA;
						console.log( $scope.category_list );
					}).error(function(response){
						$scope.category_list = response;
					});	 
		    }
		    $scope.site_list = {};
		    $scope.listsite = function(){
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
		    
		    $scope.listcategory();
		    $scope.listsite();
		    
		    
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
