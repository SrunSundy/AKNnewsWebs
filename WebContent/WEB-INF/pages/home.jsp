<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		
		<title>AKN ព័ត៌មាន | ទំព័រដើម</title>
		
		<link href="${pageContext.request.contextPath }/resources/images/logo/akn.png" rel="shortcut icon">
			
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath }/resources/angularjs/angular.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/phearun1.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/responsive1.css"/>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/owl-carousel/owl.carousel.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/owl-carousel/owl.theme.css">

	    <script src="${pageContext.request.contextPath }/resources/owl-carousel/owl.carousel.js"></script>
	    
	    <!-- select2 -->
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/select2/select2.min.css"> 
	    <script src="${pageContext.request.contextPath }/resources/plugins/select2/select2.full.min.js"></script>
	    
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/override-color.css"/>
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/color.css"/>
	    
	</head>
	<body ng-app="myApp" ng-controller="myCtrl">
		
		<div class="main-container">
		 
		    <%-- Session User  
			    <c:out value="${sessionScope.SessionUser.id }"></c:out>
			    <c:out value="${sessionScope.SessionUser.username }"></c:out>
			    <c:out value="${sessionScope.SessionUser.image }"></c:out>
			    <c:out value="${sessionScope.SessionUser.enabled }"></c:out> 
			--%>
			<jsp:include page="include/header.jsp"></jsp:include>

			<div class="a-container">
				<div class="a-row">
					<div class="a-left-side">
						<ul class="a-source">
							<select ng-model="site" ng-change="articleSite(site)">
								<option ng-value="0" id="domain.png">គេហទំព័រ</option>
								<option ng-value="{{site.id}}" ng-repeat="site in sites" id="{{site.logo}}" ng-bind="site.name"></option>
							</select>
						</ul>
						<ul class="a-category">
							<li><i class="fa fa-tags"></i>ប្រភេទ</li>
							<li ng-repeat="category in categories" ng-click="articleCategory(category.id)" id="category{{category.id}}" value="{{category.id}}"><i class="fa fa-angle-down"></i><span ng-bind="category.name"></span></li>
						</ul>
					</div><!--/end a-left-side  -->
					
					<div class="a-body">
						<div class="slide-show">
							<div class="popular-news">
								<div class="slide-image">
									<data-owl-carousel class="owl-carousel" data-options="{navigation: false,singleItem:true, autoPlay:true}">
      									<div owl-carousel-item="" ng-repeat="pop in populars" class="item">
        									<img ng-src="{{pop.image}}" alt="{{pop.title}}">
									  		<div class="popular-title">
												<p><a href="{{pop.url}}" ng-click="readNews(pop.id)" ng-if="pop.site.id!=6" target="_blank" ng-bind="pop.title"></a></p>
												<p><a href="{{webbaseurl}}detail/{{pop.id}}" ng-click="readNews(pop.id)" ng-if="pop.site.id==6" target="_blank" ng-bind="pop.title"></a></p>
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
								<div class="top-1" ng-repeat="top in top2">
									<div class="top-image">
										<img ng-src="{{top.image}}"/>
									</div>
									<div class="top-title">
										<p><a href="{{top.url}}" ng-click="readNews(top.id)" ng-if="top.site.id!=6" target="_blank" ng-bind="top.title"></a></p>
										<p><a href="{{webbaseurl}}detail/{{top.id}}" ng-click="readNews(top.id)" ng-if="top.site.id==6" target="_blank" ng-bind="top.title"></a></p>
										
									</div>
								</div>
							</div>
						</div>
						<div class="article-block" ng-repeat="article in articles">
							<div class="article-block-b1">
								<div class="article-item">
									<div class="article-info">
										<img ng-src="{{baseurl}}resources/images/{{article.site.logo}}"/>
										<p ng-bind="article.site.name | uppercase"></p>
										
										<div class="saved">
											<i ng-if="article.saved==false" ng-click="saveNews(article.id)" id="{{article.id}}" title="ចុចទីនេះដើម្បីរក្សាទុកព័ត៌មាន" class="fa fa-bookmark-o"></i>
											<i ng-if="article.saved==true" title="ព័ត៌មានបានរក្សាទុកហើយ" class="fa fa-bookmark"></i>
										</div>
										
										<div class="clear"></div>
										<small ng-bind="article.date | timeAgo" title="{{article.date | date:'medium'}}"></small>								
									</div>
									<div class="article-components">
										<div class="article-image">
											<a href="{{article.url}}" ng-if="article.site.id!=6" ng-click="readNews(article.id)" target="_blank"><img ng-src="{{article.image}}"/></a>
											<a href="{{webbaseurl}}detail/{{article.id}}" ng-if="article.site.id==6" ng-click="readNews(article.id)" target="_blank"><img ng-src="{{baseurl}}resources/images/{{article.image}}"/></a>
										</div>
										<div class="article-desc">
											<p><a href="{{article.url}}" ng-if="article.site.id!=6" ng-click="readNews(article.id)" target="_blank" ng-bind="article.title"></a></p>
											<p><a href="{{webbaseurl}}detail/{{article.id}}" ng-if="article.site.id==6" ng-click="readNews(article.id)" target="_blank" ng-bind="article.title"></a></p>
										</div>
									</div>
									<div class="article-action">
										<div class="action">
											<small><span ng-bind="article.hit | number"></span> Views</small>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="clear"></div>
						<div class="loading">
							<img ng-show="loadingStatus" src="${pageContext.request.contextPath}/resources/images/loading.gif"/>
							<p ng-show="!loadingStatus">អស់ព័ត៌មាន...</p>
						</div>
					</div><!--/end a-body  -->
					
					
					<!--dynamic color  -->
					<div class="d-color">
						<ul>
							<li class="brown"></li>
							<li class="blue"></li>
							<li class="green"></li>
							<li class="red"></li>
							<li class="gray"></li>
						</ul>	
					</div>
					
				</div><!--/end a-row  -->
				
			</div><!--/end a-container  -->
			
		</div><!--/end main container  -->
		
		
		<script>
			/* $(document).ready(function(){
				$("#category${cid}").addClass("active");
			}); */
		</script>
		<script>
			var app = angular.module('myApp', []);
			
			app.controller('myCtrl', function($scope, $window, $http, $location){
				
				$http.defaults.headers.common.Authorization = 'Basic YXBpOmFrbm5ld3M=' ;

				$scope.domain = $location.protocol()+"://"+$location.host()+":"+$location.port();
				
				$scope.webbaseurl = $scope.domain + "/AKNnewsWebs/";
				$scope.baseurl = $scope.domain + "/AKNnews/";
				
				$scope.articles = [];
				$scope.categories = [];
				$scope.populars = [];
				$scope.top2 = [];
				$scope.navCategory = [];
				$scope.sites = [];
				
				$scope.uid = 5;
				$scope.row = 9;

				$scope.sid = 0;
				$scope.cid = "${cid}";
				$scope.page = 0;
				
				$scope.key = "${key}";
				
				$scope.isSearch = false;
				
				$scope.isNoNews = false;
				$scope.loadingStatus = true;
				$scope.userprofileStatus = false;
				$scope.phoneMenuStatus = false;
		
				$scope.makeActive = function(cid){
					angular.element(".a-category li").removeClass("active");
					angular.element("#category"+cid).addClass("active");
				};
				
				$scope.loadSearchArticles = function(){
					$scope.isSearch = true;
					$scope.page += 1;
					$http({
                        method: "POST",
                        url: $scope.baseurl + "api/article/search",
                        data: {
                        	  "key": $scope.key,
                        	  "page": $scope.page,
                        	  "row": $scope.row,
                        	  "cid": 0,
                        	  "sid": 0,
                        	  "uid": $scope.uid
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
				
				
				//initialize news data
				$scope.initializeNews = function(){
					$http({
                        method: "GET",
                        url: $scope.baseurl + "api/initialize/" + $scope.row +"/"+ $scope.cid + "/" + $scope.uid
                    })
                    .success(function (response) {
                    	
                    	if($scope.key=="" || $scope.key==null){
                    		$scope.page += 1;
                    		angular.forEach(response.NEWS, function(data, key) {
                        		$scope.articles.push(data);
                        	});
                    	}else{
                    		$scope.loadSearchArticles();
                    	}
                    	
                    	angular.forEach(response.CATEGORY, function(data, key) {
                   		 	$scope.categories.push(data);
                   			if(data.menu==true)
                   			 	$scope.navCategory.push(data);
				    	});
                    	
                    	angular.forEach(response.SITE, function(data, key) {
				    		$scope.sites.push(data);
                    	});
                    	
                    	angular.forEach(response.POPULAR, function(data, key) {
                    		$scope.populars.push(data);
                    		if(key<2)
                    			$scope.top2.push(data);
				    	});
				    });
					
				};
				$scope.initializeNews();

				$scope.loadArticles = function(){
					
					$scope.page += 1;
					$http({
                        method: "GET",
                        url: $scope.baseurl + "api/article/"+$scope.page+"/"+$scope.row+"/"+$scope.cid+"/"+$scope.sid+"/"+$scope.uid+"/"
                    })
                    .success(function (response) {
                    	if(response.RESPONSE_DATA.length == 0){
                    		console.log('No more article..!');
                    		$scope.loadingStatus = false;
                    		$scope.isNoNews = true;
							return;                    		
                    	}
                    	angular.forEach(response.RESPONSE_DATA, function(data, key) {
				    		  $scope.articles.push(data);
                    	});
                    	$scope.isNoNews = true;
                    	$scope.loadingStatus = false;
				    });
				};
				
				
				angular.element($window).bind("scroll", function() {
                    var windowHeight = "innerHeight" in window ? window.innerHeight: document.documentElement.offsetHeight;
                    var body = document.body, html = document.documentElement;
                    var docHeight = Math.max(body.scrollHeight,body.offsetHeight, html.clientHeight,html.scrollHeight, html.offsetHeight);
                    windowBottom = windowHeight + window.pageYOffset;

                    if (windowBottom >= docHeight) {
                    	
                    	$scope.loadingStatus = true;
                    	
                    	if($scope.isSearch==false){
                    		$scope.$apply($scope.loadArticles());
							console.log("loading article, page="+$scope.page);                    		
                    	}
                    	else{
                    		$scope.$apply($scope.loadSearchArticles());
							console.log("loading search article, page="+$scope.page);                    		
                    	}
                    }
     	        });
     	    	
				$scope.articleCategory = function(cid){
					
					$scope.page = 0;
					$scope.cid = cid;
					$scope.sid = $scope.sid;
					$scope.key = "";
					$scope.articles = [];
					
					$scope.loadArticles();
					
					$scope.phoneMenuStatus = false;
					
					$scope.makeActive(cid);
				};
				
				$scope.articleSite = function(sid){
					$scope.page = 0;
					$scope.cid = $scope.cid;
					$scope.sid = sid;
					$scope.key = "";
					$scope.articles = [];
					
					$scope.loadArticles();
				};
				
				$scope.searchArticles = function(){
					//$location.path('search').search('key='+$scope.key);
					$scope.page = 0;
					$scope.cid = 0;
					$scope.sid = 0;
					$scope.articles = [];
					$scope.isSearch = true;
					$scope.loadSearchArticles();
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
                    	angular.element('#'+nid).removeClass("fa-bookmark-o").addClass("fa-bookmark").prop("title", "ព័ត៌មានបានរក្សាទុកហើយ");
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
				 
				
				//site dropdown image
				function formatState (state) {
	 				if (!state.id) { return state.text; }
					
	  				var $state = angular.element('<span class="slogo"><img src="'+$scope.baseurl+'resources/images/'+state.element.id+'" class="img-flag" /> ' + state.text + '</span>');
	  				return $state;
				};
	 
				angular.element("select").select2({
	  				templateResult: formatState,
					templateSelection: formatState
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
		}])
		
		/* .filter('encodeURIComponent', function() {
		    return function(input) {
		        if(input) {
		        	console.log(window.encodeURIComponent(input));
		            return window.encodeURIComponent(input); 
		        }
		        return "";
		    }
		}); */
		
		.filter('timeAgo', function($filter){
			return function(time){
				var now = new Date(),
			    secondsPast = (now.getTime() - time) / 1000;
				
			    if(secondsPast < 60){
			      var second = parseInt(secondsPast);
			      return  second+ ' វិនាទីមុន';
			    }
			    if(secondsPast < 3600){
			      var minute = parseInt(secondsPast/60);
			      return  minute+ ' នាទីមុន';
			    }
			    if(secondsPast < 86400){
			    
			     var hour = parseInt(secondsPast/3600);
			      return  hour+ ' ម៉ោងមុន';
			    }
			    if(secondsPast < 691200){//under 8 days
			      
			      var day=parseInt(secondsPast/86400);
			       return day + " ថ្ងៃមុន";
			    }
			    if(secondsPast >= 691200){//over 8 days
			    	return $filter('date')(time, 'EEEE, d MMM y');
			    }
			}
		});
		
		</script>
		<!-- <script src="http://192.168.178.186:8080/HRD_MEMO/resources/admin/js/memo.min.js" defer></script> -->
	</body>
</html>