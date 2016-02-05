<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    	<meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1" />
    	<title>Admin AKN | Scrap</title>

	 	<jsp:include page="import/header.jsp"></jsp:include>
    
       
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
			          <h1>Test Scrap Management <small>Version 2.0</small></h1>
			          <ol class="breadcrumb">
			            	<li><a href="#"><i class="fa fa-dashboard"></i> Scrap </a></li>
			            	<li>Scrap Management</li>
			            	<li class="active">Scrap Selector Testing</li>
			          </ol>
		        </section>

		        <!-- Main content -->
		        <section class="content">
		          	<div class="row">
						<div class="col-md-12">
				              <div class="box box-success">
						            <div class="box-header with-border">
						              	<h3 class="box-title">Test Scraping</h3>
						            </div><!-- /.box-header -->
						            
					            	<!-- form start -->
						            <form role="form" ng-submit="submit($event)">
							            <div class="box-body">
							            	<div class="form-group">
							                  	<label for="url">URL TO TEST SCRAP</label>
							                  	<input type="text" id="url" class="form-control" placeholder="Enter URL To Test Scrap" required ng-model="url">
							                </div>
							                <div class="form-group">
							                  	<label for="rowSelector">ROW SELECTOR</label>
							                  	<input type="text" id="rowSelector" class="form-control" placeholder="Enter Row Selector" required ng-model="rowSelector">
							                </div>
							                <div class="form-group">
							                  	<label for="titleSelector">TITLE SELECTOR</label>
							                  	<input type="text" id="titleSelector" class="form-control" placeholder="Enter Title Selector" required ng-model="titleSelector">
							                </div>
							                
							                <div class="form-group">
							                  	<label for="imageSelector">IMAGE SELECTOR</label>
							                  	<input type="text" id="imageSelector" class="form-control" placeholder="Enter Image Selector" required ng-model="imageSelector">
							                </div>
							                
							                <div class="form-group">
							                  	<label for="linkSelector">LINK SELECTOR</label>
							                  	<input type="text" id="linkSelector" class="form-control" placeholder="Enter Link Selector" required ng-model="linkSelector">
							                </div>
							                
							                <div class="form-group">
							                  	<label for="prefixImg">PREFIX ATTRIBUTE ( IMAGE )</label>
							                  	<input type="text" id="prefixImg" class="form-control" placeholder="Enter Prefix Image" ng-model="prefixImg">
							                </div>
							                
							            </div><!-- /.box-body -->
						              
						              	<div class="box-footer">						              		
						                	<button type="submit" style="width:10%" class="btn btn-default pull-right">TEST</button>
						              	</div>
						              	<center >
											<img ng-if="loadingStatus" src='${pageContext.request.contextPath }/resources/images/loading.gif'/>
										</center>
						              
						            </form>
						            <div class="box" ng-if="doneScrap">
						            	<textarea class="form-control" rows="3" placeholder="RESPONSE_DATA" style="margin-top: 0px; margin-bottom: 0px; height: 150px;">{{ testResponse | json}}</textarea>
						            </div> 
					          </div>
					          <div class="box box-success">
						            <div class="box-header with-border">
						              	<h3 class="box-title">Scraping Content</h3>
						            </div><!-- /.box-header -->
						            
					          		<form role="form" ng-submit="contentSubmit($event)">
							            <div class="box-body">
							            	<div class="form-group">
							                  	<label for="contentURL">NEWS CONTENT URL</label>
							                  	<input type="text" id="contentURL" class="form-control" placeholder="Enter News Content URL" required ng-model="contentURL">
							                </div>
							                
							                <div class="form-group">
							                  	<label for="contentSelector">CONTENT SELECTOR</label>
							                  	<input type="text" id="contentSelector" class="form-control" placeholder="Enter Content Selector" required ng-model="contentSelector">
							                </div>
							                							                
							            </div><!-- /.box-body -->
						              
						              	<div class="box-footer">						              		
						                	<button type="submit" style="width:10%" class="btn btn-default pull-right">TEST</button>
						              	</div>
						              	
						              	<center >
											<img ng-if="contentLoadingStatus" src='${pageContext.request.contextPath }/resources/images/loading.gif'/>
										</center>
						              	
						            </form>
						            <div class="box" ng-if="doneScrapContent">
						            	<textarea class="form-control" rows="3" placeholder="RESPONSE_DATA" style="margin-top: 0px; margin-bottom: 0px; height: 150px;">{{contentResponse}}</textarea>
						            </div>
						      </div> 
						            
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
  

    <jsp:include page="import/footer.jsp"></jsp:include>
    <script>
	var app = angular.module('myApp', []);
	app.controller('myCtrl', function($scope, $http, $location){
		
		$http.defaults.headers.common.Authorization = 'Basic YXBpOmFrbm5ld3M=' ;
		
		$scope.domain = $location.protocol()+"://"+$location.host()+":"+$location.port();
		
		$scope.webbaseurl = $scope.domain + "/AKNnewsWebs/";
		$scope.baseurl = $scope.domain + "/AKNnews/";
		
		angular.element(".select2").select2();
		
		$scope.loadingStatus = false;
		$scope.contentLoadingStatus = false;
		$scope.doneScrap = false;
		$scope.doneScrapContent = false;
		
		
		$scope.url = "";
		$scope.titleSelector = "";
		$scope.imageSelector = "";
		$scope.linkSelector = "";
		$scope.contentSelector = "";
		$scope.rowSelector = "";
		$scope.prefixImg = "";
		
		$scope.submit = function($event){
			
			 $event.preventDefault();
			 $scope.doneScrap = false;
			 $scope.loadingStatus=true;
			 $http({
				 method: "POST",
                 url: $scope.baseurl + "api/scrap/test",
                 data: {
                	 url: $scope.url,
                	 rowsSelector: $scope.rowSelector,
                	 titleSelector: $scope.titleSelector,
                	 imageSelector: $scope.imageSelector,
                	 linkSelector: $scope.linkSelector,
                	 prefixImg: $scope.prefixImg
                 }
             })
             .success(function (response) {
             	$scope.loadingStatus = false;
             	$scope.doneScrap = true;
             	$scope.testResponse = response.RESPONSE_DATA;
			 }); 
		};
		
		$scope.contentSubmit = function($event){
			 $event.preventDefault();
			 $scope.doneScrapContent = false;
			 $scope.contentLoadingStatus = true;
			 $http({
				 method: "POST",
                url: $scope.baseurl + "api/scrap/content",
                data: {
               	 	url: $scope.contentURL,
               	 	contentSelector: $scope.contentSelector
                }
            })
            .success(function (response) {
            	$scope.contentLoadingStatus = false;
            	$scope.doneScrapContent = true;
            	$scope.contentResponse = response.CONTENT;
			 });
		};
	});
  
    
    </script>
  
  </body>
</html>
