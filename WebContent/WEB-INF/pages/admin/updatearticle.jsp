<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Dashboard</title>
    <!-- Tell the browser to be responsive to screen width -->

	<%-- <jsp:include page="import/header.jsp"></jsp:include> --%>
	 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/fontawesome/css/font-awesome.min.css">
  
   
     <!-- Select2 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/select2/select2.min.css"> 
    <!-- Ionicons -->
   <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/dist/css/skins/_all-skins.min.css">
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">  
     
     <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/jasny-bootstrap/css/jasny-bootstrap.min.css">  
    
    
    
       <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
       
       
       <style>
       .text-show{
       		
       		word-break: break-all;
       		 word-wrap:break-word;
       }
       #thum{
       width: 320px; height: 150px;
       }
       		@media (max-width: 1600px) {
			  
			   
			    #thum{
			     
			    	width: 100%;
			    	height: 100%;
			    	
			    }
			}
			
       </style>
  </head>
  <body class="hold-transition skin-blue sidebar-mini"  ng-app="myApp" ng-controller="myCtrl">
  <input type="hidden" id="newsid" ng-model="newsid" value="${newsid }"/>
  <input type="hidden" id="newscate" ng-model="newscate" value="${newscate }"/>
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
            <li><a href="#"><i class="fa fa-dashboard"></i> Home </a></li>
            <li class="active">Article Management</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
          	
          	<div class="col-md-12">
          	    <!-- Input addon -->
              <div class="box ">
                <div class="box-header with-border">
                  <h3 class="box-title">Input Addon</h3>
                </div>
                <div class="box-body">
                	<div class="col-md-12">
         				<div class="box bdis" >
			                <div class="box-header">
				                  <h3 class="box-title">Category <small>Advanced and full of features</small></h3>
				                  <!-- tools box -->
				                  <div class="pull-right box-tools">
				                    <button class="btn  btn-sm" data-widget="collapse" data-toggle="tooltip" title="Collapse" ng-click="loadCategories()"><i class="fa fa-minus iconshow" id=""></i></button>
				                  
				                  </div><!-- /. tools -->
			                </div><!-- /.box-header -->
			                <div class="box-body pad  dis" id="">  
			                
			                  	<div class="box box-success">
						            <div class="box-header with-border">
						               <h3 class="box-title">Current Category</h3>
						              
						               <div class="box-tools pull-right">
						                  <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
						                </div><!-- /.box-tools -->
						            </div><!-- /.box-header -->
						          	 <div class="box-header">
						               		 <div ng-bind="showcate" class="text-show"></div>
						                </div><!-- /.box-body -->
						         </div><!-- /.box -->
						              
						              
		                		 <div class="input-group">
				                    <span class="input-group-addon" >Category</span>
				                     <select  id="filtercate" class=" select2 " style="width: 100%"  ng-options="category as category.name for category in categories track by category.id" ng-model="fcate">
			                    	 </select> 
			                    
				                  </div>
			                   	 <br>
	              				 <button class="btn btn-danger update-btn" style="width:100px;float:right;" id="btnaction" ng-model="btnaction" ng-click="processActionNews()" style="width: 100%">Insert</button>
			             	
			             	 </div><!-- /.box -->
		             	
              			</div>
              		</div>
              		
              		<div class="col-md-12">
         				<div class="box bdis" >
			                <div class="box-header">
				                  <h3 class="box-title">Title <small>Advanced and full of features</small></h3>
				                  <!-- tools box -->
				                  <div class="pull-right box-tools">
				                    <button class="btn  btn-sm" data-widget="collapse" data-toggle="tooltip" title="Collapse" ng-click="loadTitle()"><i class="fa fa-minus iconshow" id=""></i></button>
				                  
				                  </div><!-- /. tools -->
			                </div><!-- /.box-header -->
			                <div class="box-body pad  dis" id=""> 
			                
			                
			                		
						              <div class="box box-success">
						                <div class="box-header with-border">
						                  <h3 class="box-title">Current Title</h3>
						                  <div class="box-tools pull-right">
						                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
						                  </div><!-- /.box-tools -->
						                </div><!-- /.box-header -->
						                <div class="box-header">
						               		<div ng-bind="showtitle" class="text-show"></div>
						                </div><!-- /.box-body -->
						              </div><!-- /.box -->
						      
     
						            
		                		  <div class="input-group">
				                    <span class="input-group-addon">New Title</span>
				                    <input type="text" class="form-control" ng-model="title" placeholder="Username">
				                  
				                  </div>
				                  <br>
			                   	 
	              				 <button class="btn btn-danger update-btn" style="width:100px;float:right;" id="btnaction" ng-model="btnaction" ng-click="processActionNews()" style="width: 100%">Insert</button>
			             	
			             	 </div><!-- /.box -->
		             	
              			</div>
              		</div>
              		
              		<div class="col-md-12">
         				<div class="box bdis" >
			                <div class="box-header">
				                  <h3 class="box-title">Description <small>Advanced and full of features</small></h3>
				                  <!-- tools box -->
				                  <div class="pull-right box-tools">
				                    <button class="btn  btn-sm" data-widget="collapse" data-toggle="tooltip" title="Collapse" ng-click="loadDescription()"><i class="fa fa-minus iconshow" id=""></i></button>
				                  
				                  </div><!-- /. tools -->
			                </div><!-- /.box-header -->
			                <div class="box-body pad  dis" id="">  
			                
			                   <div class="box box-success">
						                <div class="box-header with-border">
						                  <h3 class="box-title" >Current Description</h3>
						                  <div class="box-tools pull-right">
						                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
						                  </div><!-- /.box-tools -->
						                </div><!-- /.box-header -->
						                <div class="box-header">
						               		<div ng-bind="showdes" class="text-show"></div>
						                </div><!-- /.box-body -->
						              </div><!-- /.box -->
						              
						              
		                		   <div class="form-group">
			                      <label id="ldes">New Description</label>
			                      <textarea class="form-control" ng-model="description" rows="3" placeholder="Enter ..."></textarea>
			                    </div>
				                  <br>
			                   	 
	              				 <button class="btn btn-danger update-btn" style="width:100px;float:right;" id="btnaction" ng-model="btnaction" ng-click="processActionNews()" style="width: 100%">Insert</button>
			             	
			             	 </div><!-- /.box -->
		             	
              			</div>
              		</div>
              		
              		<div class="col-md-12">
         				<div class="box bdis" >
			                <div class="box-header">
				                  <h3 class="box-title">Thumbnail <small>Advanced and full of features</small></h3>
				                  <!-- tools box -->
				                  <div class="pull-right box-tools">
				                    <button class="btn  btn-sm" data-widget="collapse" data-toggle="tooltip" title="Collapse" ng-click="loadThumbnail()"><i class="fa fa-minus iconshow" id=""></i></button>
				                  
				                  </div><!-- /. tools -->
			                </div><!-- /.box-header -->
			                <div class="box-body pad  dis" id="">  
		                		  <div class="fileinput fileinput-new" data-provides="fileinput">
							  <div class="fileinput-preview thumbnail " id="thum" data-trigger="fileinput" >
							  
							  </div>
							  <div>
							    <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input id="newsthumbnail" 
							      type="file"  name="..." /></span>
							    <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
							  </div>
							</div>
				                  <br>
			                   	 
	              				 <button class="btn btn-danger update-btn" style="width:100px;float:right;" id="btnaction" ng-model="btnaction" ng-click="" style="width: 100%">Insert</button>
			             	
			             	 </div><!-- /.box -->
		             	
              			</div>
              		</div>
                	
                
                 
       
         			
         			<div class="col-md-12" >
         			 <div class="box bdis" >
		                <div class="box-header">
		                  <h3 class="box-title">CK Editor <small>Advanced and full of features</small></h3>
		                  <!-- tools box -->
		                  <div class="pull-right box-tools">
		                    <button class="btn  btn-sm" data-widget="collapse" data-toggle="tooltip" title="Collapse" ng-click="loadContent()"><i class="fa fa-minus iconshow" ></i></button>
		                  
		                  </div><!-- /. tools -->
		                </div><!-- /.box-header -->
		                <div class="box-body pad dis" >
		                		                    <textarea id="editor1" name="editor1" rows="10" cols="80">
		                                          
		                    </textarea>
		                    <br>
		                     <button class="btn btn-danger update-btn" style="width:100px;float:right;" id="btnaction" ng-model="btnaction" ng-click="processActionNews()" style="width: 100%">Insert</button>
			             	
		                
		                </div>
		              </div><!-- /.box -->
		              
              		</div>
              		
              		
              
                </div><!-- /.box-body -->
              </div><!-- /.box -->
          	
          	</div>
            
            <div class="col-md-12">
             

            </div><!-- /.col-->
            
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

<%--   <jsp:include page="import/footer.jsp"></jsp:include> --%>
  
   <!-- jQuery 2.1.4 -->
    <script src="${pageContext.request.contextPath }/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    
      <script src= "${pageContext.request.contextPath }/resources/angularjs/angular.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>
    
    <script src="${pageContext.request.contextPath }/resources/plugins/select2/select2.full.min.js"></script>
    <!-- FastClick -->
    <script src="${pageContext.request.contextPath }/resources/plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="${pageContext.request.contextPath }/resources/dist/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="${pageContext.request.contextPath }/resources/dist/js/demo.js"></script>
    <!-- CK Editor -->
    <script src="${pageContext.request.contextPath }/resources/plugins/ckeditor/ckeditor.js"></script>
    <!-- Bootstrap WYSIHTML5 -->
    <script src="${pageContext.request.contextPath }/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
    
     <script src="${pageContext.request.contextPath }/resources/plugins/jasny-bootstrap/js/jasny-bootstrap.min.js"></script>
    
    <script>
    	
    </script>
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
	app.controller('myCtrl', function($scope, $http){
		
		var domain = "http://localhost:8080/AKNnews/";
		
		$scope.newid = $("#newsid").val();
		$scope.newcate = $("#newscate").val();
		
		$scope.categories = [];
		$scope.catetrigger = 0;
		
		$scope.showtitle ="";
		$scope.titletrigger = 0;
		
		$scope.showdes ="";
		$scope.destrigger = 0;
		
		$scope.showthumbnail = "";
		$scope.thumbtrigger = 0;
		
		$scope.showcontent = "";
		$scope.contenttrigger = 0;
		
		$scope.loadCategories = function(){
			$scope.displayBox();
			if($scope.catetrigger > 0 && !($scope.categories.length == 0)){
				
				return;
			}
			$scope.showcate = $scope.newcate;
			alert($scope.showcate);
			$http({
                method: "GET",
                url: domain + "api/article/category/news/",
                headers: {
                     'Authorization': 'Basic YXBpOmFrbm5ld3M='
                }
            })
            .success(function (response) {
            	
            	$scope.catetrigger=1;
            	angular.forEach(response.DATA, function(data, key) {
           		  $scope.categories.push(data);
		    	});
            	$scope.fcate = $scope.categories[0];    	
		    });
		};
		
		$scope.loadTitle = function(){
		
			$scope.displayBox();
			
			if($scope.titletrigger > 0 && !($scope.showtitle == "")){
				
				return;
			}
			$http({
                method: "GET",
                url: domain + "api/article/title/"+$scope.newid,
                headers: {
                     'Authorization': 'Basic YXBpOmFrbm5ld3M='
                }
            })
            .success(function (response) {
            	$scope.titletrigger=1;
            	$scope.showtitle = response.RESPONSE_DATA;	
		    });
		};
		
		$scope.loadDescription = function(){
			
			$scope.displayBox();
			if($scope.thumbtrigger > 0 && !($scope.show == "")){
				return;
			}
			$http({
                method: "GET",
                url: domain + "api/article/description/"+$scope.newid,
                headers: {
                     'Authorization': 'Basic YXBpOmFrbm5ld3M='
                }
            })
            .success(function (response) {
            	$scope.destrigger=1;
            	$scope.showdes = response.RESPONSE_DATA;	
		    });
		};
		
		$scope.loadThumbnail = function(){
			
			$scope.displayBox();
			if($scope.thumbtrigger > 0 && !($scope.showthumbnail == "")){
				return;
			}
			$http({
                method: "GET",
                url: domain + "api/article/image/"+$scope.newid,
                headers: {
                     'Authorization': 'Basic YXBpOmFrbm5ld3M='
                }
            })
            .success(function (response) {
            	$scope.thumbtrigger=1;
            	$scope.showthumbnail = response.RESPONSE_DATA;	
            	$("#thum").html("<img src="+domain+"resources/images/"+$scope.showthumbnail+" />");
            	
		    });
		};
		
		$scope.loadContent = function(){
			
			$scope.displayBox();
			if($scope.contenttrigger > 0 && !($scope.showcontent == "")){
				return;
			}
			$http({
                method: "GET",
                url: domain + "api/article/content/"+$scope.newid,
                headers: {
                     'Authorization': 'Basic YXBpOmFrbm5ld3M='
                }
            })
            .success(function (response) {
            	$scope.contenttrigger=1;
            	$scope.showcontent = response.RESPONSE_DATA;	
            	 CKEDITOR.instances["editor1"].setData($scope.showcontent); 
            	
            	
		    });
		};
		
		$scope.displayBox = function(){
			  
	    	  $(".dis").css("display","none");
	    	  $(".bdis").attr("class","box collapsed-box bdis");
	    	  $(".iconshow").attr("class","fa fa-plus iconshow");
		};
		$scope.displayBox();
	

	});
  
    
    </script>
  
  </body>
</html>
