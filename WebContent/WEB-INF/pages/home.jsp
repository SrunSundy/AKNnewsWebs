<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title>AKN News | Home Page</title>

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
		<script src= "${pageContext.request.contextPath }/resources/angularjs/angular.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/phearun1.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/responsive1.css"/>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/owl-carousel/owl.carousel.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/owl-carousel/owl.theme.css">
		<base >
		
		<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.css" />
    	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.theme.min.css" /> -->
    	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.transitions.min.css" />
    	<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.js" /> -->
    	
    	<!-- <script data-require="angular.js@1.3.x" src="https://code.angularjs.org/1.3.15/angular.js" data-semver="1.3.15"></script>
    	<script data-require="jquery@2.1.3" data-semver="2.1.3" src="http://code.jquery.com/jquery-2.1.3.min.js"></script> -->
    	
    	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.js"></script> -->
    	
	    <script src="${pageContext.request.contextPath }/resources/owl-carousel/owl.carousel.js"></script>
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
						<div class="slide-show">
							
							
							<!-- <div class="popular-text">
								<p>Popular<p>
							</div> -->
							
							<div class="popular-news">
								<div class="slide-image">
									<data-owl-carousel class="owl-carousel" data-options="{navigation: false,singleItem:true, autoPlay:true}">
      									<div owl-carousel-item="" ng-repeat="pop in populars" class="item">
        									<img ng-src="{{pop.image}}" alt="{{pop.title}}">
									  		<div class="popular-title">
												<p><a href="{{pop.url}}" target="_blank">{{pop.title}}</a></p>
											</div>
      									</div>
    								</data-owl-carousel>
								
								</div>
								
							</div>
							<div class="slide-button">
								<div id="sleft" class="button-left"></div>
								<div id="sright" class="button-right"></div>
							</div>
							<div class="popular-news-b1">
								
							</div>
						</div>
						<div class="article-block" ng-repeat="article in articles">
							<div class="article-block-b1">
								<div class="article-item">
									<div class="article-info">
										<img ng-click="articleSite(article.site.id)" ng-src="{{baseurl}}resources/images/logo/{{article.site.logo}}"/>
										<p ng-click="articleSite(article.site.id)">{{article.site.name | uppercase}}</p>
										
										<div class="saved">
											<i ng-if="article.saved==false" ng-click="saveNews(article.id)" id="{{article.id}}" title="click here to save news for later" class="fa fa-bookmark-o"></i>
											<i ng-if="article.saved==true" title="news have been saved" class="fa fa-bookmark"></i>
										</div>
										
										<div class="clear"></div>
										<small>{{article.date | date:'EEEE, d MMM y'}}</small>								
									</div>
									<div class="article-components">
										<div class="article-image">
											<a href="{{article.url}}" ng-click="readNews(article.id)" target="_blank"><img ng-src="{{article.image}}"/></a>
										</div>
										<div class="article-desc">
											<p><a href="{{article.url}}" ng-click="readNews(article.id)" target="_blank">{{article.title}}</a></p>
										</div>
									</div>
									<div class="article-action">
										<div class="action">
											<small><span>{{article.hit | number}} Views</span></small>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="loading" ng-show="loadingStatus">
							<img src="${pageContext.request.contextPath}/resources/images/loading.gif"/>
						</div>
					</div><!--/end a-body  -->
					
					
				</div><!--/end a-row  -->
				
			</div><!--/end a-container  -->
			
		</div><!--/end main container  -->
		
		
		
		<script>
		
			var app = angular.module('myApp', []);
			
			app.controller('myCtrl', function($scope, $window, $http){
				
				$http.defaults.headers.common.Authorization = 'Basic YXBpOmFrbm5ld3M=' ;
				
				$scope.items = [{name:'HelloWorld1', age:20},{name:'HelloWorld2', age:21},{name:'HelloWorld3', age:20},{name:'HelloWorld4', age:20},{name:'HelloWorld5', age:24},{name:'HelloWorld1', age:20},{name:'HelloWorld2', age:21},{name:'HelloWorld3', age:20},{name:'HelloWorld4', age:20},{name:'HelloWorld5', age:24}];
				
				$scope.baseurl = "http://localhost:8080/AKNnews/";
				
				$scope.articles = [];
				$scope.categories = [];
				$scope.populars = [];
				$scope.navCategory = [];
				
				$scope.uid = 5;
				$scope.row = 18;

				$scope.sid = 0;
				$scope.cid = 0;
				$scope.page = 0;
				
				$scope.key = "";
				
				$scope.loadingStatus = false;
				$scope.userprofileStatus = false;
				$scope.phoneMenuStatus = false;
				
				
				$scope.loadCategories = function(){
					$http({
                        method: "GET",
                        url: $scope.baseurl + "api/article/category/news/" //load only category that has news
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
                        url: $scope.baseurl + "api/article/"+$scope.page+"/"+$scope.row+"/"+$scope.cid+"/"+$scope.sid+"/"+$scope.uid+"/"
                    })
                    .success(function (response) {
                    	if(response.RESPONSE_DATA.length == 0){
                    		console.log('no more article..!');
                    		$scope.loadingStatus = false;
							return;                    		
                    	}
                    	angular.forEach(response.RESPONSE_DATA, function(data, key) {
				    		  $scope.articles.push(data);
				    	});
                    	
                    	$scope.loadingStatus = false;
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
                    	console.log("reached..!");
                    	$scope.loadingStatus = true;
                    	
                    	$scope.$apply($scope.loadArticles());
                    }
     	        });
     	    	
				$scope.loadPopulars = function(){
					$http({
						method: "GET",
                        url: $scope.baseurl + "api/article/popular/"+$scope.uid+"/"
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
				
				$scope.saveNews = function(nid){
					
					$http({
						method: "POST",
                        url: $scope.baseurl + "api/article/savelist",
                        data: {
                        	newsid:nid, userid:$scope.uid
                        }
                    })
                    .success(function (response) {
                    	angular.element('#'+nid).removeClass("fa-bookmark-o").addClass("fa-bookmark");
                    	console.log(response.MESSAGE);
				    });	
				};
				
				$scope.readNews = function(nid){
					$http({
						method: "PATCH",
                        url: $scope.baseurl + "api/article/viewcount/"+nid
                    })
                    .success(function (response) {
                    	console.log(response.MESSAGE);
				    });
				};
				
				$scope.toggleShowProfile = function(){
					if($scope.userprofileStatus == false)
						$scope.userprofileStatus = true;
					else
						$scope.userprofileStatus = false;
				};
				
				$scope.togglePhoneMenu = function(){
					
					if($scope.phoneMenuStatus == false)
						$scope.phoneMenuStatus = true;
					else
						$scope.phoneMenuStatus = false;
				};
				
				
				//get carousel instance data and store it in variable owl
				var owl = angular.element(".owl-carousel");
				  
				angular.element("#sleft").click(function(){
					 owl.trigger('owl.prev');
				});
				angular.element("#sright").click(function(){
					 owl.trigger('owl.next');
				}); 
				 
		}).directive("owlCarousel", function() {
			    return {
			        restrict: 'E',
			        transclude: false,
			        link: function (scope) {
			            scope.initCarousel = function(element) {
			              // provide any default options you want
			                var defaultOptions = {
			                };
			                var customOptions = scope.$eval($(element).attr('data-options'));
			                // combine the two options objects
			                for(var key in customOptions) {
			                    defaultOptions[key] = customOptions[key];
			                }
			                // init carousel
			                $(element).owlCarousel(defaultOptions);
			            };
			        }
			    };
		}).directive('owlCarouselItem', [function() {
			    return {
			        restrict: 'A',
			        transclude: false,
			        link: function(scope, element) {
			          // wait for the last item in the ng-repeat then call init
			            if(scope.$last) {
			                scope.initCarousel(element.parent());
			            }
			        }
			    };
		}]);
		</script>
	</body>
</html>