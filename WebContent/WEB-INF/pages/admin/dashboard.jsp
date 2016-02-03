<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head >
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Dashboard | AKNnews</title>
    <!-- Tell the browser to be responsive to screen width -->

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
                  <span class="info-box-number">2</span>
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
								<img ng-src="{{baseurl}} resources/images/logo/{{pnews.site.logo }}" alt="News Image">
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
								<img ng-src="{{baseurl}} resources/images/logo/{{akn.site.logo }}" alt="AKN logo Image">
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
						<span class="info-box-icon"><i class="fa fa-sitemap"></i></span>
						<div class="info-box-content">
						  <span class="info-box-text">AKN NEWS</span>
						  <span class="info-box-number">{{numofaknnews }}</span>
						  <div class="progress">
							<div class="progress-bar" ng-style="{width: percentofaknnews + '%'}"></div>
						  </div>
						  <span class="progress-description">
							{{percentofaknnews | number}} % out of the whole News
						  </span>
						</div><!-- /.info-box-content -->
					  </div><!-- /.info-box -->
					  <div class="info-box bg-red">
						<span class="info-box-icon"><i class="fa fa-sitemap"></i></span>
						<div class="info-box-content">
						  <span class="info-box-text">SABAY NEWS</span>
						  <span class="info-box-number">{{numofsabaynews }}</span>
						  <div class="progress">
							<div class="progress-bar" ng-style="{width: percentofsabaynews + '%'}"></div>
						  </div>
						  <span class="progress-description">
							{{percentofsabaynews  | number }} % out of the whole News
						  </span>
						</div><!-- /.info-box-content -->
					  </div><!-- /.info-box -->
					  <div class="info-box bg-yellow">
						<span class="info-box-icon"><i class="fa fa-sitemap"></i></span>
						<div class="info-box-content">
						  <span class="info-box-text">THEBNEWS</span>
						  <span class="info-box-number">{{numofthebnews }}</span>
						  <div class="progress">
							<div class="progress-bar" ng-style="{width: percentofthebnews + '%'}"></div>
						  </div>
						  <span class="progress-description">
							{{percentofthebnews | number}}% out of the whole News
						  </span>
						</div><!-- /.info-box-content -->
					  </div><!-- /.info-box -->
					  <div class="info-box bg-aqua">
						<span class="info-box-icon"><i class="fa fa-sitemap"></i></span>
						<div class="info-box-content">
						  <span class="info-box-text">MULKULKAR</span>
						  <span class="info-box-number">{{numofmulkulkarnews }}</span>
						  <div class="progress">
							<div class="progress-bar" ng-style="{width: percentofmulkulkarnews + '%'}"></div>
						  </div>
						  <span class="progress-description">
							{{percentofmulkulkarnews | number}}% out of the whole News
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
                          <img style="width:100px;height:100px;" src="{{baseurl}}resources/images/user/{{listuser.image}}" alt="User Image">
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
                         <img style="width:100px;height:100px;" src="{{baseurl}}resources/images/user/{{listadmin.image}}" alt="User Image">
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
	app.controller('myCtrl', function($scope, $http ,$location){
	
		//for set header with http wehn request 
		$http.defaults.headers.common.Authorization = 'Basic YXBpOmFrbm5ld3M=';
		
		$scope.domain = $location.protocol()+"://"+$location.host()+":"+$location.port();

		$scope.webbaseurl = $scope.domain + "/AKNnewsWebs/";
		$scope.baseurl = $scope.domain + "/AKNnews/";
		
		
		
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
		
	
		$scope.loadDashboardInfo = function(){
			$http({
				method : "GET",
				url : $scope.baseurl+"api/article/dashboard"
				
			}).success(function(response){
				angular.forEach(response.POP_NEWS, function(data, key) {
	           		  $scope.popnews.push(data);
			   });
				angular.forEach(response.AKNLIST_NEWS, function(data, key) {
	           		  $scope.aknnews.push(data);
			   });
				
			    $scope.numofaknnews =response.AKN_NEWS;
				$scope.numofthebnews =response.BNEWS_NEWS;
				$scope.numofsabaynews=response.SABAY_NEWS;
				$scope.numofmulkulkarnews =response.MUL_NEWS;
				$scope.totalnews= response.TOTAL_NEWS;
				$scope.numberofsite = response.NUM_SITE;
				
				$scope.percentofaknnews =($scope.numofaknnews * 100)/$scope.totalnews;
				$scope.percentofsabaynews =($scope.numofsabaynews * 100)/$scope.totalnews;
				$scope.percentofthebnews =($scope.numofthebnews * 100)/$scope.totalnews;
				$scope.percentofmulkulkarnews =($scope.numofmulkulkarnews * 100)/$scope.totalnews;
				
				
				$scope.totalusers=response.TOTALRECORD;
				$scope.listusers=response.LISTUSER;
				$scope.listadmins=response.LISTADMIN;
			});
		}
		$scope.loadDashboardInfo();

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
