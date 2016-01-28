<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>ArticleMangement | AKNnews</title>
    <!-- Tell the browser to be responsive to screen width -->

	 <jsp:include page="import/header.jsp"></jsp:include> 

   
  </head>
  <body class="hold-transition skin-blue sidebar-mini"  ng-app="myApp" ng-controller="myCtrl">
 <%--  <input type="hidden" id="newsid" ng-model="newsid" value="${newsid }"/> --%>
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
            <small></small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home </a></li>
            <li >Article Management</li>
            <li class="active">Add Article</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
          	<div class="col-md-12">
          	    <!-- Input addon -->
              <div class="box ">
                <div class="box-header with-border">
                  <h3 class="box-title">Insert AKN News</h3>
                </div>
                <div class="box-body">
                	
                	<div class="col-md-12">
                		<div class="row">
	                		<div class="col-md-12">
	                		 <div class="form-group">
			                    <label id="ldes">Category</label>
			                     <select  id="filtercate" class=" select2 " style="width: 100%"  ng-options="category as category.name for category in categories track by category.id" ng-model="fcate"> </select> 
			                  </div>
			                 </div>
			             </div>
                	</div><br>
                	
                	<div class="col-md-12">
                		<div class="row">
	                		<div class="col-md-9">
	                		 	<div class="form-group">
	                      			<label id="ldes">Title</label>
	                      			<input type="text" class="form-control" ng-model="title" placeholder="Username">
	                   			</div>
			                  
			                  <!-- textarea -->
			                    <div class="form-group">
			                      <label id="ldes">Description</label>
			                      <textarea class="form-control" ng-model="description" rows="3" placeholder="Enter ..."></textarea>
			                    </div>
			                  <br>
	                		</div>
	                		<div class="col-md-3">
	                		    <div class="fileinput fileinput-new" data-provides="fileinput">
								  <div class="fileinput-preview thumbnail " id="thum" data-trigger="fileinput" ></div>
								  <div>
								    <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input id="newsthumbnail" 
								      type="file"  name="..." /></span>
								    <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
								  </div>
								</div>
				             </div>
				         </div>
                	</div>
                 
         			<div class="col-md-12">
         			 <div class="box">
		                <div class="box-header">
		                  <h3 class="box-title">Content <small>Advanced and full of features</small></h3>
		                  <!-- tools box -->
		                  <div class="pull-right box-tools">
		                    <button class="btn  btn-sm" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
		                    <button class="btn  btn-sm" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
		                  </div><!-- /. tools -->
		                </div><!-- /.box-header -->
		                <div class="box-body pad">		                 
		                    <textarea id="editor1" name="editor1" rows="100" cols="80"></textarea>		                
		                </div>
		              </div><!-- /.box -->
              		</div>
              		
              		<div class="col-md-12">
              			<div class="col-md-10"></div>
              			<div class="col-md-2">
              				<div class="row">
              					<button class="btn btn-danger" id="btnaction" ng-model="btnaction" ng-click="processInsertNews()" style="width: 100%">Insert</button>	
              				</div>
              			</div>	
              		</div>
              
                </div><!-- /.box-body -->
              </div><!-- /.box -->
          	
          	</div>
          </div><!-- ./row -->
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
      $(function () {
        // Replace the <textarea id="editor1"> with a CKEditor
        // instance, using default configuration.
        CKEDITOR.replace('editor1');
        //bootstrap WYSIHTML5 - text editor
        $(".textarea").wysihtml5();
      });
    </script>
    <script>
      $(function () {
        //Initialize Select2 Elements
        $(".select2").select2();

     
      });
   
    </script>
    
    <script>
	var app = angular.module('myApp', []);
	app.controller('myCtrl', function($scope, $http,$location){
		

		$scope.domain = $location.protocol()+"://"+$location.host()+":"+$location.port();

		$scope.webbaseurl = $scope.domain + "/AKNnewsWebs/";
		$scope.baseurl = $scope.domain + "/AKNnews/";

		$scope.categories = [];
		
		
		 $scope.listCategories = function(){
			
			$http({
                method: "GET",
                url: $scope.baseurl + "api/article/category/news/",
                headers: {
                     'Authorization': 'Basic YXBpOmFrbm5ld3M='
                }
            })
            .success(function (response) {
            	
            	angular.forEach(response.DATA, function(data, key) {
           		  $scope.categories.push(data);
		    	});
            	$scope.fcate = $scope.categories[0];    	
		    });
		}; 
		
		$scope.processInsertNews = function(){
			
			var json={
					"category":{
						"id" : $scope.fcate.id
					},
					"title" :  $scope.title,
					"description" : $scope.description,
					"content": CKEDITOR.instances.editor1.getData()
				};
			 var formData = new FormData();
		     var file = $('#newsthumbnail')[0].files[0];
		     if(typeof file === 'undefined'){
				 alert("Please Select New Image to Update");
					return;
			};
		     formData.append("file", file);
		     formData.append("json",JSON.stringify(json));//important: convert to JSON!
		     $http({
		    		  	url: $scope.baseurl + "api/article/",
				        method: 'POST',
				        headers: {'Content-Type': undefined , 'Authorization': 'Basic YXBpOmFrbm5ld3M='},
				        data: formData,
		        
		      }).success(function(response) {
			        console.log('Request finished', response);
			        alert(response.MESSAGE);
			     
			  }); 
		};
		
		 $scope.listCategories();

		
		

	});
  
    
    </script>
  
  </body>
</html>
