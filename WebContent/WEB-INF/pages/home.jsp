<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>AKN News | Home Page</title>

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
		<script src= "${pageContext.request.contextPath }/resources/angularjs/angular.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/phearun.css"/>
		
	</head>
	<body ng-app="myApp" ng-controller="myCtrl">
		
		<div class="main-container">
		
			<jsp:include page="include/header.jsp"></jsp:include>
			
			<div class="a-container">
			
				<div class="a-row">
					<div class="a-left-side">
						<ul class="a-category">
							<li><i class="fa fa-tags"></i>ប្រភេទ</li>
							<li ng-repeat="category in categories" ng-click="articleCategory(category.id)" value="{{category.id}}"><i class="fa fa-angle-down"></i>{{category.name}}</li>
						</ul>
					</div><!--/end a-left-side  -->
					
					<div class="a-body">
						<div class="article-block">
							<div class="article-item" ng-repeat="article in articles">
								<div class="article-info">
									<img ng-click="articleSite(article.site.id)" src="${pageContext.request.contextPath}/{{article.site.logo}}"/>
									<p ng-click="articleSite(article.site.id)">{{article.site.name | uppercase}}</p><br>
									<pre>{{article.date | date:'EEEE, d MMM y'}}</pre>	
									<div class="clear"></div>								
								</div>
								<div class="article-components">
									<div class="article-image">
										<a href="{{article.url}}" target="_blank"><img src="{{article.image}}"/></a>
									</div>
									<div class="article-desc">
											<h3><a href="{{article.url}}" target="_blank">{{article.title}}</a></h3>
											<p><a href="{{article.url}}" target="_blank">{{article.description | limitTo:200}}</a></p>
									</div>
								</div>
								<div class="article-action">
									<div class="action">
										<pre><span>{{article.hit | number}} Views</span></pre>
									</div>
								</div>
							</div>
						</div>
					</div><!--/end a-body  -->
					
					<div class="a-right-side">
						<ul class="a-popular">
							<li><i class="fa fa-area-chart"></i>ព័ត៌មានពេញនិយម</li>
							<li ng-repeat="popular in populars">
								<div class="a-popular-item">
									<a href="{{popular.url}}" target="_blank"><img src="{{popular.image}}"/></a>
									<p><a href="{{popular.url}}" target="_blank">{{popular.title}}</a></p>
									<div class="clear"></div>
								</div>
							</li>
						</ul>
					</div><!--/end a-right-side  -->
					
				</div><!--/end a-row  -->
				
			</div><!--/end a-container  -->
			
		</div><!--/end main container  -->
		
		<script>
			var app = angular.module('myApp', []);
			app.controller('myCtrl', function($scope, $window, $http){
				
				var domain = "http://localhost:8080/AKNnews/";
				
				$scope.articles = [];
				$scope.categories = [];
				$scope.populars = [];
				$scope.navCategory = [];
				
				$scope.uid = 0;
				$scope.row = 50;

				$scope.sid = 0;
				$scope.cid = 0;
				$scope.page = 0;
				
				$scope.key = "";
				
				$scope.loadCategories = function(){
					$http({
                        method: "GET",
                        url: domain + "api/article/category/news/",  //load only category that has news
                        headers: {
                             'Authorization': 'Basic YXBpOmFrbm5ld3M='
                        }
                    })
                    .success(function (response) {
                    	
                    	angular.forEach(response.DATA, function(data, key) {
                    		 $scope.categories.push(data);
                    		 if(data.menu==true)
                    			 $scope.navCategory.push(data);
				    	});
				    });
				};
				
				$scope.loadArticles = function(){
					
					$scope.page += 1;
					$http({
                        method: "GET",
                        url: domain + "api/article/"+$scope.page+"/"+$scope.row+"/"+$scope.cid+"/"+$scope.sid+"/"+$scope.uid+"/",
                        headers: {
                             'Authorization': 'Basic YXBpOmFrbm5ld3M='
                        }
                    })
                    .success(function (response) {
                    	if(response.RESPONSE_DATA.length == 0){
                    		console.log('no more article..!');
							return;                    		
                    	}
                    	angular.forEach(response.RESPONSE_DATA, function(data, key) {
				    		  $scope.articles.push(data);
				    	});
				    });
				};
					
				$scope.loadCategories();
				
				$scope.loadArticles();
				
				angular.element($window).bind("scroll", function() {
                    var windowHeight = "innerHeight" in window ? window.innerHeight: document.documentElement.offsetHeight;
                    var body = document.body, html = document.documentElement;
                    var docHeight = Math.max(body.scrollHeight,body.offsetHeight, html.clientHeight,html.scrollHeight, html.offsetHeight);
                    windowBottom = windowHeight + window.pageYOffset;

                    if (windowBottom >= docHeight) {
                    	$scope.$apply($scope.loadArticles());
                    }
     	        });
     	    	
				$scope.loadPopulars = function(){
					$http({
						method: "GET",
                        url: domain + "api/article/popular/"+$scope.uid+"/",
                        headers: {
                             'Authorization': 'Basic YXBpOmFrbm5ld3M='
                        }
                    })
                    .success(function (response) {
                    	angular.forEach(response.RESPONSE_DATA, function(data, key) {
                    		$scope.populars.push(data);
				    	});
                    	console.log($scope.populars);
				    });
				};
			    $scope.loadPopulars();
			    
				
				$scope.articleCategory = function(cid){
					$scope.page = 0;
					$scope.cid = cid;
					$scope.sid = 0;
					$scope.articles = [];
					
					$scope.loadArticles();
				};
				
				$scope.articleSite = function(sid){
					$scope.page = 0;
					$scope.cid = 0;
					$scope.sid = sid;
					$scope.articles = [];
					
					$scope.loadArticles();
				};
				
				$scope.searchArticles = function(){
					$scope.page = 0;
					$scope.cid = 0;
					$scope.sid = 0;
					$scope.articles = [];
					
					$scope.loadArticles();
				}; 
			});
		
		</script>
	</body>
</html>