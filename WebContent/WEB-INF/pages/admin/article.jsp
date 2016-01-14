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
        <section class="content" ng-app="myApp" ng-controller="myCtrl">
          
         	<div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Responsive Hover Table</h3>
                
                 
                
                
                  <div class="box-tools">
                    <div class="input-group" style="width: 150px;">
                      <input type="text" name="table_search" class="form-control input-sm pull-right" placeholder="Search">
                      <div class="input-group-btn">
                        <button class="btn btn-sm btn-default"><i class="fa fa-search" ></i></button>
                      </div>
                    </div>
                  </div>
                </div><!-- /.box-header -->
                
                
                <div class="box-footer clearfix">
                  <ul class="pagination pagination-sm no-margin pull-left">
                    <li> 
                    <select class="form-control select2" id="row"  >
                     
                      <option>10</option>
                    
                      <option>15</option>
                      <option>30</option>
                      <option>50</option>
                      <option>100</option>
                    </select>
               <!-- /.form-group --></li>
                   
                  </ul>
                </div>
               
                <div class="box-body table-responsive no-padding">
                  <table class="table table-hover">
                    <tr>
                      <th>Source</th>
                      <th>ID</th>
                      <th>Title</th>
                      <th>Date</th>
                      <th>View</th>
                      <th>Category</th>
                      <th>Status</th>
                    
                    </tr>
                   
                   <tr ng-repeat="article in articles">
                   		
                      <td><img class='logo-style' src='${pageContext.request.contextPath }/{{article.site.logo }}'  class="img-circle" title='{{article.site.name}}'/></td>
                      <td>{{article.id }}</td>
                      <td>{{mySplit(article.title)}}</td>
                       
                      <td>{{article.date}}</td>
                      <td>{{article.hit }}</td>
                      <td><span class="label label-warning"></span></td>
                      <td>{{article.status }}</td>
                    </tr>
                   
                  </table>
                </div><!-- /.box-body -->
                
                  <div class="box-footer clearfix">
                  <ul class="pagination pagination-sm no-margin pull-right">
                    <li><a href="#">&laquo;</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">&raquo;</a></li>
                  </ul>
                </div>
              </div><!-- /.box -->
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
	app.controller('myCtrl', function($scope, $window, $http){
		
		var domain = "http://localhost:8080/AKNnews/";
		
		$scope.listArticles = function(){
			
			
			$http({
                method: "GET",
                url: domain + "api/article/1/15/0/0/1/",
               /*  headers: {
                     'Authorization': 'Basic YXBpOmFrbm5ld3M='
                } */
            })
            .success(function (response) {
            	if(response.RESPONSE_DATA.length == 0){
            		console.log('no article..!');
					return;                    		
            	}
            	
		    		  $scope.articles=response.RESPONSE_DATA; 
		    	
		    });
			
		};
		
		$scope.listArticles();
		
		$scope.mySplit = function(string) {
		    var array = string.substring(0,50);
		    return array;
		}
		
		$scope.changeRow = function() {
			var data= $("#row").val();
			alert(data);
			
		}
		
	});
  
  </script>
  </body>
</html>
