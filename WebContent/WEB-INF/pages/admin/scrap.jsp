<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    	<meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<title>Admin AKN | Scrap</title>

	 	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css">
    	<!-- Font Awesome -->
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/fontawesome/css/font-awesome.min.css">
  
   
     	<!-- Select2 -->
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/select2/select2.min.css"> 
	    <!-- Ionicons -->
   		<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    	<!-- Theme style -->
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/dist/css/AdminLTE.min.css">
    	<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/dist/css/skins/_all-skins.min.css">
    	<!-- bootstrap wysihtml5 - text editor -->
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">  
    
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
       
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
			            	<li class="active">Article Management</li>
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
				                	<div class="col-md-12">
				                		<div class="col-md-12">
				                		     <div class="input-group">
						                     	 <span class="input-group-addon">Web Site</span>
							                     <select class="select2" style="width: 100%">
							                     	<option>A</option>
							                     	<option>A</option>
							                     	<option>A</option>
							                     </select>
						                  	 </div><br>
						                 </div>
				                	</div>
				                	<div class="col-md-12">
					                	<div class="col-md-10"></div>
				                		<div class="col-md-2">
				                			<button style="width:100%" class="btn btn-default">Scrap</button>
				                		</div>
				                	</div>
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
	var app = angular.module('myApp', []);
	app.controller('myCtrl', function($scope, $http){
		
		var domain = "http://localhost:8080/AKNnews/";
		
		angular.element(".select2").select2();
		
	});
  
    
    </script>
  
  </body>
</html>
