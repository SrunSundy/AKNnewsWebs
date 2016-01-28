<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SCRAP URL | ADMIN</title>
    <!-- Tell the browser to be responsive to screen width -->

	<jsp:include page="import/header.jsp"></jsp:include>
   <style>
   i.ion{
   		margin-top: 25px;
   }
/*    	  .ng-required{
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
      } */
      
      .error{
      	color:red;
      }
 
  
   </style>
   
   
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
            Scrap Url Management
            <!-- <small>Version 2.0</small> -->
          </h1>
          <ol class="breadcrumb">
            <!-- <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li> -->
            <li class="active">Scrap Url Management</li>
          </ol>
        </section>

        <!-- Main content -->
        <!-- Main content -->
        
        <section class="content">         	          
		<div ng-app="myApp" ng-controller="myCtrl" >

		
		  <!-- Modal ADD -->
		  <div class="modal fade" id="myAdd" role="dialog" data-keyboard="false" data-backdrop="static">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal" ng-click='reset()'>&times;</button>
		          <h4 class="modal-title">{{!id ? 'ADD NEW'  : 'UPDATE' }}</h4>
		        </div>
		        <div class="modal-body">
		        	  <form name="myForm" ng-submit='submit()' ><!-- ng-click='submit()' -->
		        	   <h4>SITE NAME</h4>
					    <select name="s_select" id="s_select" ng-options="site.id as site.name for site in site_list" ng-model="sitedetail.s_id" required class='form-control'>
					      <option value="">---Please select---</option>
					      <option ng-repeat="site in site_list" value="{{site.id}}" selected="{{(site.id == sitedetail.s_id)? 'selected': '' }}">{{site.name}}</option>
					    </select>
					    <span class='error' ng-show="myForm.$dirty && myForm.s_select.$error.required">This is a required field</span>
					    <h4>CATEGORY NAME</h4>
					    <select name="c_select" id="c_select" ng-options="category.id as category.name for category in category_list"  ng-model="sitedetail.c_id" required class='form-control'>
					      <option value="">---Please select---</option>
					      <option ng-repeat="cate in category_list" value="{{cate.id}}" selected="{{(cate.id == sitedetail.c_id)? 'selected': '' }}">{{cate.name}}</option>
					    </select>
					    <span class='error' ng-show="myForm.$dirty && myForm.c_select.$error.required">This is a required field</span>
					    <h4>URL</h4>
					    <input type="text" ng-model="sitedetail.url" name="url" placeholder="Enter sitedetail url" ng-minlength="15" required class='form-control'/>
					      <span class='error' ng-show="myForm.$dirty && myForm.url.$error.required">This is a required field</span>
			              <span class='error' ng-show="myForm.$dirty && myForm.url.$error.minlength">Minimum length required is 15</span>
			              <span class='error' ng-show="myForm.$dirty && myForm.url.$invalid">This field is invalid </span><br/>
					    <input type="submit" value="{{!id ? 'Add'  : 'Update' }}" ng-disabled="myForm.$invalid" 
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
		          <h4 class="modal-title">VIEW</h4>
		        </div>
		        <div class="modal-body">
					<table class="table " >	
			            <tr>
			          		<th style="border-top: none !important; ">SITE NAME</th>
			          		<td style="border-top: none !important; ">{{ siteName(sitedetail.s_id) }}</td>
			          	</tr>
			          	<tr>
			          		<th>CATEGORY NAME</th>
			          		<td>{{ categoryName(sitedetail.c_id) }}</td>
			          	</tr>
			          	<tr>
			          		<th>URL</th>
			          		<td>{{ sitedetail.url }}</td>
			          	</tr>
			          	<tr>
			          		<th>STATUS</th>
			          		<td>{{ sitedetail.status }}</td>
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
						<h4> Delete this sitedetail ?</h4>
						<button type="button" class="btn btn-info" data-dismiss="modal" ng-click='reset()'>NO</button>					
						<button ng-click='detetesitedetail(sitedetail.s_id,sitedetail.c_id)' class='btn btn-danger' data-dismiss="modal">YES</button>
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
							<th> SITE </th>
							<th> CATEGORY </th>	
							<th> URL </th>
							<th> STATUS </th>	
							<th> ACTION </th>							
						</tr>
						<tr ng-repeat="cat in sitedetail_list" >
							<td> {{$index+1}} </td>
							<td> <button class='btn btn-xs btn-danger'>{{ siteName(cat.s_id) }}</button></td>
							<td> <button class='btn btn-xs btn-warning'>{{ categoryName(cat.c_id) }}</button></td>
							<td> {{cat.url}}</td>
							<td> 
								 <input type="checkbox" value={{cat.status}} ng-click="statusSiteDetail(cat.s_id,cat.c_id)" checked ng-if="cat.status == true " />
						         <input type="checkbox" value={{cat.status}} ng-click="statusSiteDetail(cat.s_id,cat.c_id)" ng-if="cat.status == false " />		
							</td>
							<td> 
								
								<button ng-click='findsitedetailById(cat.s_id,cat.c_id)' class='btn btn-danger' data-toggle="modal" data-target="#myDelete"><i class="fa fa-times"></i></button>
								<button ng-click='findsitedetailById(cat.s_id,cat.c_id)' class='btn btn-primary' data-toggle="modal" data-target="#myAdd"><i class="fa fa-edit"></i></button>
								<button ng-click='findsitedetailById(cat.s_id,cat.c_id)' class='btn btn-info' data-toggle="modal" data-target="#myView"><i class="fa fa-eye"></i></button>
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
			
			$scope.weburl = $location.protocol()+"://"+$location.host()+":"+$location.port();
			
			$scope.domain =  $scope.weburl  + "/AKNnews/";
			
			$scope.id=null;
		    $scope.sitedetail={c_id:'',s_id:'',url:'',status:''};		 
		    
		    $scope.submit = function() {
		    	if ( $scope.id == null){
		    		$scope.insertsitedetail();
		    		$scope.reset();
		    	}else{
		    		$scope.updatesitedetail();
		    		$scope.reset();
		    	}
		    	$scope.reset();
		    	angular.element('#myAdd').modal('hide');
		    }
		    
 		    $scope.findsitedetailById = function(s_id, c_id){
                console.log('id to be edited', s_id +"      "+c_id);
                for(var i = 0; i < $scope.sitedetail_list.length; i++){
                    if( $scope.sitedetail_list[i].s_id === s_id && $scope.sitedetail_list[i].c_id === c_id ) {
                    	$scope.sitedetail = angular.copy($scope.sitedetail_list[i]);
                    	console.log($scope.sitedetail);   
                    	$scope.id=100;
                       break;
                    }
                }
            } 
		    
 		    $scope.reset = function(){
 		    	$scope.id=null;
 		    	$scope.sitedetail={c_id:'',s_id:'',url:'',status:''};	
                $scope.myForm.$setPristine(); //reset Form
            }
		    
		    $scope.sitedetail_list = {};
		    
		    var config = {headers: {
	            'Authorization': 'Basic YXBpOmFrbm5ld3M=',
	            'Accept': 'application/json;odata=verbose'
	       		 }
	    	};
		    $scope.listsitedetail = function(){
			    $http.get(
						$scope.domain+'api/article/scrapurl/'
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
 		    	console.log('sitedetail', $scope.sitedetail);
 			    $http.post(
						$scope.domain+'/api/article/scrapurl/'
						,$scope.sitedetail
						,config
					).success(function(response){						
						$scope.listsitedetail();
						console.log( response ); 		
						alert(response.MESSAGE);
						console.log( $scope.sitedetail_list );
					}).error(function(response){
						alert('add exit site and categoy exist fail! try again!');
						console.log( response ); 
					});	  
		    }
		    
		    
		    $scope.updatesitedetail = function(){
		    	console.log('sitedetail', $scope.sitedetail);
 			    $http.put(
						$scope.domain+'api/article/scrapurl/'
						,$scope.sitedetail
						,config
					).success(function(response){						
						$scope.listsitedetail();
						console.log( response ); 						
						console.log( $scope.sitedetail_list );
						alert(response.MESSAGE);
					}).error(function(response){
						alert('update exit site and categoy exist fail! try again!');
						console.log( response ); 
					});	   
		    }  
		    
		    $scope.detetesitedetail = function(s_id,c_id){
			    $http.delete(
						$scope.domain+'api/article/scrapurl/'+s_id+'/'+c_id
						,config
					).success(function(response){						
						$scope.listsitedetail();
						console.log( response ); 						
						console.log( $scope.sitedetail_list );
						if ( response.STATUS == 404){
							alert(response.MESSAGE + '     STATUS TRUE!');
						}else{
							alert(response.MESSAGE);
						}
						$scope.reset();
					}).error(function(response){
						console.log( response ); 
					});	  
		    }  
		    
		    $scope.statusSiteDetail = function(s_id, c_id){
			    $http.patch(
						$scope.domain+'api/article/scrapurl/toggle/'+s_id+'/'+c_id
						,''
						,config
					).success(function(response){						
						$scope.listsitedetail();
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
						$scope.domain+'api/article/category/'
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
						$scope.domain+'api/article/site/'
						,config
					).success(function(response){
						$scope.site_list = response.DATA;
						console.log( $scope.site_list );
					}).error(function(response){
						$scope.site_list = response;
					});	 
		    }
		    
		    $scope.categoryName = function(id){		    	
		    	for(var i=0 ;i< $scope.category_list.length;i++){
		    		if ( $scope.category_list[i].id === id){
		    			return $scope.category_list[i].name;
		    		}
		    	}
		    }
		    
		    $scope.siteName = function(id){		    	
		    	for(var i=0 ;i< $scope.site_list.length;i++){
		    		if ( $scope.site_list[i].id === id){
		    			return $scope.site_list[i].name;
		    		}
		    	}
		    }
		   	
/*  		    $scope.selectCategory = function(id){
		    	//for (var i=0;i<$scope.category_list.length)
		    	alert(id);
		    }  */
		    
		    $scope.listcategory();
		    $scope.listsite();
		    
		    
		});
		</script>
  
  </body>
</html>
