<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Dashboard | AKNnews</title>
    <!-- Tell the browser to be responsive to screen width -->
<<<<<<< .mine

	<jsp:include page="import/header.jsp"></jsp:include>
	
	<%--  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/fontawesome/css/font-awesome.min.css">
  
   
    <!-- Select2 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/select2/select2.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
           <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/dist/css/skins/_all-skins.min.css">
	  --%>
<style>
=======
>>>>>>> .r202

	<jsp:include page="import/header.jsp"></jsp:include> 

                
  </head>
  <body class="hold-transition skin-blue sidebar-mini" ng-app="myApp" ng-controller="myCtrl">
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
            Dashboard
            <small>Version 2.0</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Dashboard</li>
          </ol>
        </section>

        <!-- Main content -->
        <!-- Main content -->
        <section class="content">
          <!-- Info boxes -->
          <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-aqua"><i class="fa fa-sitemap"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">SITES</span>
                  <span class="info-box-number">{{numberofsite }}<small></small></span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-red"><i class="fa fa-book"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">NEWS</span>
                  <span class="info-box-number">{{totalnews}}</span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->

            <!-- fix for small devices only -->
            <div class="clearfix visible-sm-block"></div>

            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-green"><i class="fa fa-users"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">USER</span>
                  <span class="info-box-number">{{totalusers}}</span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-yellow"><i class="fa fa-user-plus"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">NEW USER</span>
                  <span class="info-box-number">2,000</span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
          </div><!-- /.row -->


          <!-- Main row -->
          <div class="row">
            <!-- Left col -->
            <div class="col-md-12">
            
              <div class="row">
                <div class="col-md-4">
                     <!-- PRODUCT LIST -->
					  <div class="box box-primary">
						<div class="box-header with-border">
						  <h3 class="box-title">TOP NEWS</h3>
						  <div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
							<button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
						  </div>
						</div><!-- /.box-header -->
						<div class="box-body">
						  <ul class="products-list product-list-in-box">
							<li class="item" ng-repeat="pnews in popnews">
							  <div class="product-img">
								<img ng-src="https://pbs.twimg.com/profile_images/459634395222011904/kpJJCmI6.png" alt="Product Image">
							  </div>
							  <div class="product-info">
								<a href="javascript::;" class="product-title">{{pnews.site.name}}<span class="label label-warning pull-right"> {{pnews.hit}} views</span></a>
								<span class="product-description">
								  {{pnews.title}}
								</span>
							  </div>
							</li><!-- /.item -->
							
						  </ul>
						</div><!-- /.box-body -->
						<div class="box-footer text-center">
						  <a href="javascript::;" class="uppercase">View All Products</a>
						</div><!-- /.box-footer -->
					  </div><!-- /.box -->
                </div><!-- /.col -->
				
				
				<div class="col-md-4">
                     <!-- PRODUCT LIST -->
					  <div class="box box-primary">
						<div class="box-header with-border">
						  <h3 class="box-title">Recently Added AKN News</h3>
						  <div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
							<button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
						  </div>
						</div><!-- /.box-header -->
						<div class="box-body">
						  <ul class="products-list product-list-in-box">
							<li class="item" ng-repeat="akn in aknnews">
							  <div class="product-img">
								<img src="${pageContext.request.contextPath }/resources/images/logo/akn.png" alt="Product Image">
							  </div>
							  <div class="product-info">
								<a href="javascript::;" class="product-title">{{akn.site.name}} <span class="label label-warning pull-right">{{convertTimeago(akn.date) | date:'EEEE, d MMM y'}}</span></a>
								<span class="product-description">
								  {{akn.title}}
								</span>
							  </div>
							</li><!-- /.item -->
							
						  </ul>
						</div><!-- /.box-body -->
						<div class="box-footer text-center">
						  <a href="javascript::;" class="uppercase">View All Products</a>
						</div><!-- /.box-footer -->
					  </div><!-- /.box -->
                </div><!-- /.col -->
				
				<div class="col-md-4">
						<div class="info-box bg-green">
						<span class="info-box-icon"><i class="ion ion-ios-pricetag-outline"></i></span>
						<div class="info-box-content">
						  <span class="info-box-text">AKN NEWS</span>
						  <span class="info-box-number">{{numofaknnews }}</span>
						  <div class="progress">
							<div class="progress-bar" ng-style="{width: percentofaknnews + '%'}"></div>
						  </div>
						  <span class="progress-description">
							{{percentofaknnews | number}} % Increase in 30 Days
						  </span>
						</div><!-- /.info-box-content -->
					  </div><!-- /.info-box -->
					  <div class="info-box bg-red">
						<span class="info-box-icon"><i class="ion ion-ios-heart-outline"></i></span>
						<div class="info-box-content">
						  <span class="info-box-text">SABAY NEWS</span>
						  <span class="info-box-number">{{numofsabaynews }}</span>
						  <div class="progress">
							<div class="progress-bar" ng-style="{width: percentofsabaynews + '%'}"></div>
						  </div>
						  <span class="progress-description">
							{{percentofsabaynews  | number }} % Increase in 30 Days
						  </span>
						</div><!-- /.info-box-content -->
					  </div><!-- /.info-box -->
					  <div class="info-box bg-yellow">
						<span class="info-box-icon"><i class="ion ion-ios-cloud-download-outline"></i></span>
						<div class="info-box-content">
						  <span class="info-box-text">THEBNEWS</span>
						  <span class="info-box-number">{{numofthebnews }}</span>
						  <div class="progress">
							<div class="progress-bar" ng-style="{width: percentofthebnews + '%'}"></div>
						  </div>
						  <span class="progress-description">
							{{percentofthebnews | number}}% Increase in 30 Days
						  </span>
						</div><!-- /.info-box-content -->
					  </div><!-- /.info-box -->
					  <div class="info-box bg-aqua">
						<span class="info-box-icon"><i class="ion-ios-chatbubble-outline"></i></span>
						<div class="info-box-content">
						  <span class="info-box-text">MULKULKAR</span>
						  <span class="info-box-number">{{numofmulkulkarnews }}</span>
						  <div class="progress">
							<div class="progress-bar" ng-style="{width: percentofmulkulkarnews + '%'}"></div>
						  </div>
						  <span class="progress-description">
							{{percentofmulkulkarnews | number}}% Increase in 30 Days
						  </span>
						</div><!-- /.info-box-content -->
					  </div><!-- /.info-box -->
				</div>
				
				

              </div><!-- /.row -->

           
            
            </div><!-- /.col -->
			
            <div class="col-md-12">
              <!-- Info Boxes Style 2 -->
				<div class="row">

                 <div class="col-md-6">
                  <!-- USERS LIST -->
                  <div class="box box-danger">
                    <div class="box-header with-border">
                      <h3 class="box-title">Latest Members</h3>
                      <div class="box-tools pull-right">
                        <span class="label label-danger">8 New Members</span>
                        <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                      </div>
                    </div><!-- /.box-header -->
                    <div class="box-body no-padding">
                      <ul class="users-list clearfix">
                      
                        <li ng-repeat="listuser in listusers">
                          <img src="http://localhost:8080/AKNnews/resources/images/user/{{listuser.image}}" alt="User Image">
                          <a class="users-list-name" href="#">{{listuser.username}}</a>
                          <span class="users-list-date">{{listuser.register_date}}</span>
                        </li>
                        
                      </ul><!-- /.users-list -->
                    </div><!-- /.box-body -->
                    <div class="box-footer text-center">
                      <a href="javascript::" class="uppercase">View All Users</a>
                    </div><!-- /.box-footer -->
                  </div><!--/.box -->
                </div><!-- /.col -->
				
				
				    <div class="col-md-6">
                  <!-- USERS LIST -->
                  <div class="box box-danger">
                    <div class="box-header with-border">
                      <h3 class="box-title">Latest Members</h3>
                      <div class="box-tools pull-right">
                        <span class="label label-danger">8 New Members</span>
                        <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                      </div>
                    </div><!-- /.box-header -->
                    <div class="box-body no-padding">
                      <ul class="users-list clearfix">
                        <li ng-repeat="listadmin in listadmins">
                         <img src="http://localhost:8080/AKNnews/resources/images/user/{{listadmin.image}}" alt="User Image">
                          <a class="users-list-name" href="#">{{listadmin.username}}</a>
                          <span class="users-list-date">{{listadmin.register_date}}</span>
                        </li>
                      </ul><!-- /.users-list -->
                    </div><!-- /.box-body -->
                    <div class="box-footer text-center">
                      <a href="javascript::" class="uppercase">View All Users</a>
                    </div><!-- /.box-footer -->
                  </div><!--/.box -->
                </div><!-- /.col -->
			</div>
           
            </div><!-- /.col -->
          </div><!-- /.row -->
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
	app.controller('myCtrl', function($scope, $http){
	
		var domain = "http://localhost:8080/AKNnews/";
		//for set header with http wehn request 
		$http.defaults.headers.common.Authorization = 'Basic YXBpOmFrbm5ld3M=';
		
		$scope.popnews = [];
		$scope.aknnews = [];
		
	    $scope.numofaknnews =0;
		$scope.numofthebnews =0;
		$scope.numofsabaynews=0;
		$scope.numofmulkulkarnews =0;
		$scope.totalnews=0;
		
		$scope.totalusers=0;
		$scope.listusers={};
		$scope.listadmins={};
		
	
		$scope.getNumberofSite = function(){
			$http({
				method : "GET",
				url : domain+"api/article/site/record"
				
			}).success(function(response){
				
				if(response.DATA == 0){
            		console.log('no site..!');   		
            	}
				$scope.numberofsite = response.DATA;
			});
		};	
		
		$scope.loadPopNews = function(){
			$http({
				method : "GET",
				url : domain+"api/article/popular/0/30/4"
				
			}).success(function(response){
				
				if(response.RESPONSE_DATA.length == 0){
            		console.log('no news..!');   
            	
            	}
				
				angular.forEach(response.RESPONSE_DATA, function(data, key) {
	           		  $scope.popnews.push(data);
			   });
				//$scope.numberofnews = response.TOTAL_RECORDS;
			});
		};
		
		$scope.loadAKNNews = function(){
			$http({
				method : "GET",
				url : domain+"api/article/1/4/0/6/-1/"
				
			}).success(function(response){
				
				if(response.RESPONSE_DATA.length == 0){
            		console.log('no news..!');   		
            	}
				
				angular.forEach(response.RESPONSE_DATA, function(data, key) {
	           		  $scope.aknnews.push(data);
			   });
				//$scope.numberofnews = response.TOTAL_RECORDS;
			});
		};
		
		$scope.getNumberofNews = function(sid){
			return $http({
				method : "GET",
				url : domain+"api/article/record/0/"+sid+"/-1/"
			});
		};
		//ALL news
		$scope.getNumberofNews(0).success(function(response){
			if(response.TOTAL_RECORDS == 0) console.log('no news..!');   		
        	$scope.totalnews = response.TOTAL_RECORDS;
        	//akn news
        	$scope.getNumberofNews(6).success(function(response6){
    			if(response6.TOTAL_RECORDS == 0) console.log('no news..!');   		
    			$scope.numofaknnews = response6.TOTAL_RECORDS;
    			$scope.percentofaknnews =($scope.numofaknnews * 100)/$scope.totalnews;
    		});
        	
        	//sabay news
        	$scope.getNumberofNews(1).success(function(response1){
    			if(response1.TOTAL_RECORDS == 0) console.log('no news..!');   		
    			$scope.numofsabaynews = response1.TOTAL_RECORDS;
    			$scope.percentofsabaynews =($scope.numofsabaynews * 100)/$scope.totalnews;
    		});
        	
        	//thebnews
    		$scope.getNumberofNews(5).success(function(response2){
    			if(response2.TOTAL_RECORDS == 0) console.log('no news..!');   		
    			$scope.numofthebnews = response2.TOTAL_RECORDS;
    			$scope.percentofthebnews =($scope.numofthebnews * 100)/$scope.totalnews;
    		});
        	
    		//mulkulkar
    		$scope.getNumberofNews(12).success(function(response3){
    			if(response3.TOTAL_RECORDS == 0) console.log('no news..!');  
    			$scope.numofmulkulkarnews = response3.TOTAL_RECORDS;
    			$scope.percentofmulkulkarnews =($scope.numofmulkulkarnews * 100)/$scope.totalnews;
    		});
    		
		});
		
		
		$scope.getUserInfo=function(){
			$http({
				method : "GET",
				url : domain+"api/user/adminuserinfo"
				
			}).success(function(response){
				
				if(response.TOTALRECORD.length == 0){
            		console.log('no user info..!');  
            		return;
            	}
				$scope.totalusers=response.TOTALRECORD;
				$scope.listusers=response.LISTUSER;
				$scope.listadmins=response.LISTADMIN;
			});
		}
		
		
		
		$scope.loadAKNNews();
		$scope.loadPopNews();
		$scope.getNumberofSite();
		$scope.getUserInfo();

		$scope.percentofaknnews = ($scope.numofaknnews*$scope.totalnews)/100;
		$scope.percentofthebnews = ($scope.numofthebnews*$scope.totalnews)/100;;
		$scope.percentofsabaynews=0;
		$scope.percentofmulkulkarnews =0;
		//timeago
		$scope.convertTimeago = function(time){
			
			var now = new Date(),
		      secondsPast = (now.getTime() - time) / 1000;
			
		    if(secondsPast < 60){
		      var second = parseInt(secondsPast);
		      if(second <= 1){
		    	  return 'a second ago';
		      }
		      return  second+ ' seconds ago';
		    }
		    if(secondsPast < 3600){
		      var minute = parseInt(secondsPast/60);
		      if(minute <= 1){
		    	  return 'a minute ago';
		      }
		      return  minute+ ' minutes ago';
		    }
		    if(secondsPast < 86400){
		    
		     var hour = parseInt(secondsPast/3600);
		      if(hour <= 1){
		    	  return 'an hour ago';
		      }
		      return  hour+ ' hours ago';
		    }
		    if(secondsPast < 691200){//under 8 days
		      
		      var day=parseInt(secondsPast/86400);
		       if(day <= 1){
		    	   return "a day ago";
		       }
		       return day + " days ago";
		    }
		    if(secondsPast >= 691200){//over 8 days
		    	return time;
		    }
		}
	});
  
  </script>
  </body>
</html>
