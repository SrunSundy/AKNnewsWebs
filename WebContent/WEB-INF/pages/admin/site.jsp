<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Website | ADMIN</title>
    <!-- Tell the browser to be responsive to screen width -->

	<jsp:include page="import/header.jsp"></jsp:include>
   <style>
   i.ion{
   		margin-top: 25px;
   }
	
	  .error{
      	color:red;
      }
      
      .img{
      	width: 30px;
      	height: 30px;
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
            Site Management
            <!-- <small>Version 2.0</small> -->
          </h1>
          <ol class="breadcrumb">
            <!-- <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li> -->
            <li class="active">Site Management</li>
          </ol>
        </section>


        <!-- Main content -->
        
        <section class="content">         	          
		<div ng-app="myApp" ng-controller="myCtrl" >
		
		  <!-- Modal ADD -->
		  <div class="modal fade " id="myAdd" role="dialog" data-keyboard="false" data-backdrop="static">
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
			              <span class='error' ng-show="myForm.$dirty && myForm.uname.$error.required">This is a required field</span>
			              <span class='error' ng-show="myForm.$dirty && myForm.uname.$error.minlength">Minimum length required is 3</span>
			              <span class='error' ng-show="myForm.$dirty && myForm.uname.$invalid">This field is invalid </span>
			          <h4>URL</h4>  
			          <input type="text" ng-model="site.url" name="url" placeholder="Enter site url" required ng-minlength="3" class='form-control'/>
			              <span class='error' ng-show="myForm.$dirty && myForm.url.$error.required">This is a required field</span>
			              <span class='error' ng-show="myForm.$dirty && myForm.url.$error.minlength">Minimum length required is 3</span>
			              <span class='error' ng-show="myForm.$dirty && myForm.url.$invalid">This field is invalid </span>  
			         
			         <h4>IMAGE PREFIX PATH</h4>     
			         <input type="text" ng-model="site.basepath" name="basepath" placeholder="Enter site basepath" class='form-control'/>
			         
			         <h4>IMAGE PREFIX ATTR</h4>
			         <input type="text" ng-model="site.prefixImg" name="prefixImg" placeholder="Enter site prefix img attribute" class='form-control'/><br/>
			          
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
			          		<th> URL</th>
			          		<td>{{ site.url }}</td>
			          	</tr>
			          	<tr ng-if="site.basepath!=''">
			          		<th>IMAGE PREFIX PATH</th>
			          		<td>{{ site.basepath}}</td>
			          	</tr>
			          	<tr ng-if="site.prefixImg!=''">
			          		<th>IMAGE PREFIX ATTR</th>
			          		<td>{{ site.prefixImg}}</td>
			          	</tr>
			          	<tr>
			          		<th> LOGO</th>
			          		<td><img class="img" style='width:100px;height:100px'  src='{{domain}}resources/images/logo/{{site.logo}}' data-toggle="modal"/></td>
			          	</tr>
			      	    <tr>
			          		<th class='active' colspan='2'><center> SITE SELECTOR  </center></th>
			          	</tr>
			          	
			          	<tr>
			          		<th>ROW SELECTOR</th>
			          		<td>{{ structure.rowsSelector }}</td>
			          	</tr>
			          	<tr>
			          		<th>TITLE SELECTOR</th>
			          		<td>{{ structure.titleSelector }}</td>
			          	</tr>
			          	<tr>
			          		<th>IMAGE SELECTOR</th>
			          		<td>{{ structure.imageSelector }}</td>
			          	</tr>
			          	<tr>
			          		<th>LINK SELECTOR</th>
			          		<td>{{ structure.linkSelector }}</td>
			          	</tr>
			          	<tr>
			          		<th>CONTENT SELECTOR</th>
			          		<td>{{ structure.contentSelector }}</td>
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
		  
					<!-- Modal Struce -->
		  <div class="modal fade " id="myStruct" role="dialog" data-keyboard="false" data-backdrop="static">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal" ng-click='resetStruct()'>&times;</button>
		          <h4 class="modal-title">{{!structure.id ? 'ADD NEW'  : 'UPDATE' }}</h4>
		        </div>
		        <div class="modal-body">
					<form ng-submit="submitStruct()" name="myFormStruc">
					<input type="hidden" ng-model="structure.id" name="id" ng-disabled=true />
					  <h4>ROW SELECTOR</h4>
			          <input type="text" ng-model="structure.rowsSelector" name="rowsSelector" placeholder="Enter site name" required  class='form-control'/>
			          
			          <h4>TITLE SELECTOR</h4>  
			          <input type="text" ng-model="structure.titleSelector" name="titleSelector" placeholder="Enter site url" required  class='form-control'/>
			          
			         <h4>IMAGE SELECTOR</h4>     
			         <input type="text" ng-model="structure.imageSelector" name="imageSelector" placeholder="Enter site basepath" required  class='form-control'/><br/>
		
			         <h4>LINK SELECTOR</h4>     
			         <input type="text" ng-model="structure.linkSelector" name="linkSelector" placeholder="Enter site basepath" required  class='form-control'/><br/>

			         <h4>CONTENT SELECTOR</h4>     
			         <input type="text" ng-model="structure.contentSelector" name="contentSelector" placeholder="Enter site basepath" required  class='form-control'/><br/>
			         			         		         
			          <input type="submit" value="{{!structure.id ? 'Add'  : 'Update' }}" ng-disabled="myFormStruc.$invalid" 
			          class="{{!site.id ? 'btn btn-success'  : 'btn btn-primary' }}" />
			      	</form>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal" ng-click='resetStruct()' >Close</button>
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
							<th> URL </th>	
							<th> LOGO </th>	
							<th> IMAGE PREFIX PATH </th>	
							<th> IMAGE PREFIX ATTR </th>
							<th> ACTION </th>							
						</tr>
						<tr ng-repeat="st in site_list">
							<td> {{st.id}}</td>
							<td> <button class='btn btn-xs btn-danger'>{{st.name}}</button></td>
							<td> {{st.url}}</td>
							<td> <img class="img"  src='{{domain}}resources/images/logo/{{st.logo}}' data-toggle="modal" data-target="#myUpload" ng-click='findsiteById(st.id)' />  
								 <!-- <button ng-click='findsiteById(st.id)' class='btn btn-warning' data-toggle="modal" data-target="#myUpload">change logo</button> -->
							</td>
							<td> {{st.basepath}}</td>
							<td> {{st.prefixImg}}</td>
							<td> 
								<button title="view this site" ng-click='findsiteById(st.id)' class='btn btn-info' data-toggle="modal" data-target="#myView"><i class="fa fa-eye"></i></button>
								<button title="add or edit structure of this website" ng-click='findStructureById(st.id)' class='btn btn-warning' data-toggle="modal" data-target="#myStruct"><i class="fa fa-file-code-o"></i></button>
								<button title="edit this website" ng-click='findsiteById(st.id)' class='btn btn-primary' data-toggle="modal" data-target="#myAdd"><i class="fa fa-edit"></i></button>
								<button title="delete this website" ng-click='findsiteById(st.id)' class='btn btn-danger' data-toggle="modal" data-target="#myDelete"><i class="fa fa-times"></i></button>
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
			
		    $scope.site={id:null,name:'',url:'',logo:'',basepath:'', prefixImg:''};		 
		    
		    $scope.submit = function() {
		    	if ( $scope.site.id == null){
		    		$scope.insertsite();
		    	}else{
		    		$scope.updatesite();
		    	}
		    	$scope.reset();
		    	angular.element('#myAdd').modal('hide');
		    };
		    
 		    $scope.findsiteById = function(id){
 		    	$scope.findStructureById(id);
                console.log('id to be edited', id);
                for(var i = 0; i < $scope.site_list.length; i++){
                    if( $scope.site_list[i].id === id) {
                    	$scope.site = angular.copy($scope.site_list[i]);
                    	console.log($scope.site);                    	
                       break;
                    }
                }
            } ;
		    
 		    $scope.reset = function(){
 		    	$scope.site={id:null,name:'',url:'',logo:'',basepath:'',prefixImg:'' };	
                $scope.myForm.$setPristine(); //reset Form
            };
		    
		    $scope.site_list = {};
		    
		    var config = {headers: {
	            'Authorization': 'Basic YXBpOmFrbm5ld3M=',
	            'Accept': 'application/json;odata=verbose'
	       		 }
	    	};
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
		    };
		    
		    $scope.listsite();
		    
		    $scope.insertsite = function(){
		    	console.log('site', $scope.site);
 			    $http.post(
						$scope.domain+'api/article/site/'
						,$scope.site
						,config
					).success(function(response){						
						$scope.site_list  = $scope.listsite();
						alert(response.MESSAGE);
						console.log( response ); 						
						console.log( $scope.site_list ); 
					}).error(function(response){
						console.log( response ); 
					});	  
		    };
		    
		    
		    $scope.updatesite = function(){
		    	console.log('site', $scope.site);
			    $http.put(
						$scope.domain+'api/article/site/'
						,$scope.site
						,config
					).success(function(response){						
						$scope.site_list  = $scope.listsite();
						console.log( response ); 	
						alert(response.MESSAGE);
						console.log( $scope.site_list );
					}).error(function(response){
						console.log( response ); 
					});	  
		    }; 
		    
		    $scope.detetesite = function(id){
		    	alert(id);
		    	$scope.deleteStructure(id);
		    	
 			    $http.delete(
						$scope.domain+'api/article/site/'+id
						,config
					).success(function(response){						
						$scope.site_list  = $scope.listsite();
						if (response.STATUS == 404){
							alert(response.MESSAGE +' site exit news');
						}else{
							alert(response.MESSAGE);
						}
						console.log( response ); 						
						console.log( $scope.site_list );
						$scope.reset();
					}).error(function(response){
						console.log( response ); 
					});	  
			     
		    }; 
		    
		    $scope.changeLogo = function(){
		    	var form_data = new FormData(document.getElementById('frmupload'));                     		    	
  			    $http.post(
						$scope.domain+'api/article/site/upload'
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
						alert(response.MESSAGE);
						console.log($scope.site);
						console.log( $scope.site_list );
					}).error(function(response){
						console.log( response ); 
					});	   
		    };
		    
		    // scraping structure  //http://localhost:8080/AKNnews/api/scrap/structure/
		    
 		    //var urlstrcture = 'http://localhost:8080/AKNnews/api/'
		    $scope.structure_list = {};
		    $scope.strucTmpId = null;
		    
		    $scope.structure = {id:null,siteId:null, imageSelector:'',linkSelector:'',titleSelector:'',contentSelector:'',rowsSelector:''};
		    
		    $scope.liststructure = function(){
			    $http.get(
			    		$scope.domain+'api/scrap/structure/'
						,config
					).success(function(response){
						$scope.structure_list = response.RESPONSE_DATA;
						console.log( $scope.structure_list );
						
					}).error(function(response){
						console.log(response);
					});	 
		    };
		    
 		    $scope.findStructureById = function(id){
 		        console.log(id);
 		        $scope.strucTmpId = id;
		    	for(var i=0;i<$scope.structure_list.length;i++){
		    		if ( $scope.structure_list[i].id == id){
		    			//console.log( $scope.structure_list[i] );
		    			$scope.structure = {
		    					id:$scope.structure_list[i].id, 
		    					imageSelector:$scope.structure_list[i].imageSelector,
		    					linkSelector:$scope.structure_list[i].linkSelector,
		    					titleSelector:$scope.structure_list[i].titleSelector,
		    					contentSelector:$scope.structure_list[i].contentSelector,
		    					rowsSelector:$scope.structure_list[i].rowsSelector
		    				};
		    			 
		    			 //$scope.sturcture = angular.compy($scope.structure_list[i]);
		    			console.log( $scope.structure );
		    			
		    			return true;
		    		}
		    	}
		    };
 		    
 		    $scope.resetStruct = function(){
 		    	$scope.structure = {id:null,siteId:null, imageSelector:'',linkSelector:'',titleSelector:'',contentSelector:'',rowsSelector:''};
 		    	$scope.strucTmpId = null;
                $scope.myFormStruc.$setPristine(); //reset Form
            };
 		    
 		    $scope.submitStruct = function(){
 		    	if ( $scope.structure.id == null ){
 		    		$scope.structure.siteId = $scope.strucTmpId;
 		    		console.log($scope.structure);
 		    		$scope.insertStructure();
 		    		$scope.resetStruct();
 		    	}else{
 		    		$scope.structure.siteId = $scope.strucTmpId;
 		    		console.log($scope.structure);
 		    		$scope.updateStructure();
 		    		$scope.resetStruct();
 		    	}
 		    	
 		    	angular.element('#myStruct').modal('hide');
 		    };
 		    
		    $scope.updateStructure = function(){
		    	$http.put(
						$scope.domain+'api/scrap/structure/'
						,$scope.structure
						,config
					).success(function(response){						
						console.log( response );
						$scope.liststructure();
					}).error(function(response){
						console.log( response ); 
					});	  
		    };
		    
		    $scope.insertStructure = function(){
		    	$http.post(
						$scope.domain+'api/scrap/structure/'
						,$scope.structure
						,config
					).success(function(response){						
						console.log( response );
						$scope.liststructure();
					}).error(function(response){
						console.log( response ); 
					});	  
		    };  
		    
		    $scope.deleteStructure = function(id){
		    	$http.delete(
						$scope.domain+'api/scrap/structure/'+id
						,config
					).success(function(response){						
						console.log( response );
						$scope.liststructure();
					}).error(function(response){
						console.log( response ); 
					});	  
		    }; 
		    
		    $scope.liststructure(); 
		    
		});
		</script>
  </body>
</html>
