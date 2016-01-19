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
									<div id="owl-demo" class="owl-carousel owl-theme">
									  <div class="item"><img src="http://cdn.sabay.com/cdn/news.sabay.com.kh/wp-content/uploads/2016/01/Coverr75.jpg?ebb82d" alt="Mirror Edge"></div>
									</div>
								</div>
								
								<div class="popular-title">
									<p>iPhone ជំនាន់​ថ្មី​អាច​បំពាក់​បច្ចេកវិទ្យា​ Li-Fi លឿន​ជាង​ Wi-Fi ១០០​ដង​</p>
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
										<img ng-click="articleSite(article.site.id)" src="${pageContext.request.contextPath}/{{article.site.logo}}"/>
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
											<a href="{{article.url}}" ng-click="readNews(article.id)" target="_blank"><img src="{{article.image}}"/></a>
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
		
		<script src="${pageContext.request.contextPath }/resources/owl-carousel/owl.carousel.js"></script>
		
		<script>
			var app = angular.module('myApp', []);
			app.controller('myCtrl', function($scope, $window, $http){
				
				var baseurl = "http://localhost:8080/AKNnews/";
				
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
                        url: baseurl + "api/article/category/news/",  //load only category that has news
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
                        url: baseurl + "api/article/"+$scope.page+"/"+$scope.row+"/"+$scope.cid+"/"+$scope.sid+"/"+$scope.uid+"/",
                        headers: {
                             'Authorization': 'Basic YXBpOmFrbm5ld3M='
                        }
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
                        url: baseurl + "api/article/popular/"+$scope.uid+"/",
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
				
				$scope.saveNews = function(nid){
					
					$http({
						method: "POST",
                        url: baseurl + "api/article/savelist",
                        data: {
                        	newsid:nid, userid:$scope.uid
                        },
                        headers: {
                             'Authorization': 'Basic YXBpOmFrbm5ld3M='
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
                        url: baseurl + "api/article/viewcount/"+nid,
                        headers: {
                             'Authorization': 'Basic YXBpOmFrbm5ld3M='
                        }
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
				
				
				//Carosel Slider //Initialize Plugin
				  angular.element("#owl-demo").owlCarousel({
				      navigation : false,
				      slideSpeed : 500,
				      paginationSpeed : 400,
				      singleItem:true,
				      autoPlay:true,
				      pagination:false,
				  });
				
				  //get carousel instance data and store it in variable owl
				  var owl = angular.element(".owl-carousel").data('owlCarousel');
				
				  angular.element("#sleft").click(function(){
					  owl.prev();
				  });
				  angular.element("#sright").click(function(){
					  owl.next();
				  });
				  
				  
				  
			});
		
		</script>
	</body>
</html>