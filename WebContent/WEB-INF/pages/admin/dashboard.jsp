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
                <span class="info-box-icon bg-green"><i class="fa fa-pie-chart"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">CATEGORIES</span>
                  <span class="info-box-number">{{totalcate}}</span>
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
								<a ng-show="{{pnews.site.id != 6 }}" href="{{pnews.url}}" target="_blank" class="product-title">{{pnews.site.name}}<span class="label label-warning pull-right"> {{pnews.hit}} views</span></a>
								<a ng-show="{{pnews.site.id == 6 }}" href="{{webbaseurl + pnews.url}}" target="_blank" class="product-title">{{pnews.site.name}} <span class="label label-warning pull-right">{{pnews.hit}} views</span></a>
								
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
								<a href="{{webbaseurl + akn.url}}" target="_blank" class="product-title">{{akn.site.name}} <span class="label label-warning pull-right">{{convertTimeago(akn.date) | date:'EEEE, d MMM y'}}</span></a>
								
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
					  
					  
					   <div class="info-box bg-teal" >
						<span class="info-box-icon"><i class="fa fa-sitemap" ></i></span>
						<div class="info-box-content">
						  <span class="info-box-text">OTHER NEWS</span>
						  <span class="info-box-number">{{othernews }}</span>
						  <div class="progress">
							<div class="progress-bar" ng-style="{width: othernews + '%'}"></div>
						  </div>
						  <span class="progress-description">
							{{percentofothernews | number}}% out of the whole News
						  </span>
						</div><!-- /.info-box-content -->
					  </div><!-- /.info-box -->
				</div>
				
				

              </div><!-- /.row -->

           
            
            </div><!-- /.col -->
            
            <div class="col-md-12" >   
		          <div class="row">	   
		            <div class="col-md-8">
		              <!-- LINE CHART -->
		           
		              <!-- BAR CHART -->
		              <div class="box box-success">
		                <div class="box-header with-border">
		                  <h3 class="box-title">NEWS Scrapping Statisitc</h3>
		                 
		                  <div class="box-tools pull-right">
		                  	
		                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
		                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
		                  </div>
		                </div>
		                <div class="box-body">
		                  <div class="chart">
		                    <canvas id="barChart" style="height:500px"></canvas>
		                  </div>
		                </div><!-- /.box-body -->
		              </div><!-- /.box -->
		
		            </div><!-- /.col (RIGHT) -->
		          </div><!-- /.row --> 
            </div>

            
            
            
            
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
  <script src="${pageContext.request.contextPath }/resources/plugins/chartjs/Chart.min.js"></script>


  
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
		$scope.othernews =0;
		$scope.totalnews=0;
		
		$scope.totalcate = 0;
		
		/* $scope.jan = 0; */
	
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
				$scope.numoftopsitenews = $scope.numofaknnews+$scope.numofthebnews+$scope.numofsabaynews+$scope.numofmulkulkarnews;
				$scope.othernews = $scope.totalnews - $scope.numoftopsitenews;
				$scope.totalcate = response.NUM_CATE;
				
				$scope.percentofaknnews =($scope.numofaknnews * 100)/$scope.totalnews;
				$scope.percentofsabaynews =($scope.numofsabaynews * 100)/$scope.totalnews;
				$scope.percentofthebnews =($scope.numofthebnews * 100)/$scope.totalnews;
				$scope.percentofmulkulkarnews =($scope.numofmulkulkarnews * 100)/$scope.totalnews;
				$scope.percentofothernews =($scope.othernews * 100)/$scope.totalnews;
				
			});
		}
		$scope.loadBarChartData = function(){
			 $http({
					method : "GET",
					url : $scope.baseurl+"api/article/staticrecord/"
					
				}).success(function(response){
					var jan=0,feb=0,mar=0,apr=0,may=0,jun=0,jul=0,aug=0,sep=0,oct=0,nov=0,dec=0;
					
					jan = response.TOTAL_RECORDS_JAN;
					feb = response.TOTAL_RECORDS_FEB;
					mar = response.TOTAL_RECORDS_MAR;
					apr = response.TOTAL_RECORDS_APR;
					may = response.TOTAL_RECORDS_MAY;
					jun = response.TOTAL_RECORDS_JUN;
					jul = response.TOTAL_RECORDS_JUL;
					aug = response.TOTAL_RECORDS_AUG;
					sep = response.TOTAL_RECORDS_SEP;
					oct = response.TOTAL_RECORDS_OCT;
					nov = response.TOTAL_RECORDS_NOV;
					dec = response.TOTAL_RECORDS_DEC;
					
					$scope.loadBarChart(jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dec);
				
				});
		}
		$scope.loadBarChartData();
		$scope.loadBarChart = function(jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dec){
			
			
	        var areaChartData = {
	          labels: ["January", "February", "March", "April", "May", "June", "July","August","September","October","November","December"],
	          datasets: [
	            {
	              label: "Electronics",
	              fillColor: "rgba(210, 214, 222, 1)",
	              strokeColor: "rgba(210, 214, 222, 1)",
	              pointColor: "rgba(210, 214, 222, 1)",
	              pointStrokeColor: "#c1c7d1",
	              pointHighlightFill: "#fff",
	              pointHighlightStroke: "rgba(220,220,220,1)",
	              data: [jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dec]
	            }
	          ]
	        };			
	        //-------------
	        //- BAR CHART -
	        //-------------
	        var barChartCanvas = $("#barChart").get(0).getContext("2d");
	        var barChart = new Chart(barChartCanvas);
	        var barChartData = areaChartData;
	        barChartData.datasets[0].fillColor = "#009688";
	        barChartData.datasets[0].strokeColor = "#009688";
	        barChartData.datasets[0].pointColor = "#009688";
	        var barChartOptions = {
	          //Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
	          scaleBeginAtZero: true,
	          //Boolean - Whether grid lines are shown across the chart
	          scaleShowGridLines: true,
	          //String - Colour of the grid lines
	          scaleGridLineColor: "rgba(0,0,0,.05)",
	          //Number - Width of the grid lines
	          scaleGridLineWidth: 1,
	          //Boolean - Whether to show horizontal lines (except X axis)
	          scaleShowHorizontalLines: true,
	          //Boolean - Whether to show vertical lines (except Y axis)
	          scaleShowVerticalLines: true,
	          //Boolean - If there is a stroke on each bar
	          barShowStroke: true,
	          //Number - Pixel width of the bar stroke
	          barStrokeWidth: 1,
	          //Number - Spacing between each of the X value sets
	          barValueSpacing: 5,
	          //Number - Spacing between data sets within X values
	          barDatasetSpacing: 1,
	          //String - A legend template
	         
	          responsive: true,
	          maintainAspectRatio: true
	        };

	        barChartOptions.datasetFill = false;
	        barChart.Bar(barChartData, barChartOptions);
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
