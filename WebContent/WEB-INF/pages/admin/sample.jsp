<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Dashboard</title>
    <!-- Tell the browser to be responsive to screen width -->

	<jsp:include page="import/header.jsp"></jsp:include>
   <style>
   i.ion{
   		margin-top: 25px;
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
	app.controller('myCtrl', function($scope, $window, $http){
		
		var domain = "http://localhost:8080/AKNnews/";
		
		
		
		
		$scope.listArticles = function(){
			alert();
			
			$http({
                method: "GET",
                url: domain + "api/article/1/15/0/0/1/",
               /*  headers: {
                     'Authorization': 'Basic YXBpOmFrbm5ld3M='
                } */
            })
            .success(function (response) {
            	if(response.RESPONSE_DATA.length == 0){
            		console.log('no more article..!');
					return;                    		
            	}
            	
		    		  $scope.articles=response.RESPONSE_DATA; 
		    		 /*  angular.forEach(response.RESPONSE_DATA, function(data, key) {
		    			  console.log(key + ': ' + data);
			    		  $scope.articles.push(data);
			    	}); */
		    	
		    });
			
		};
		
		$scope.listArticles();
		
	});
  
  </script>
  </body>
</html>
