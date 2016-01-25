<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		
		<title>AKN |ទំព័រ អានព័ត៌មាន</title>
		
		<link href="${pageContext.request.contextPath }/resources/images/logo/akn.png" rel="shortcut icon">
			
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath }/resources/angularjs/angular.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/phearun1.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/responsive1.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/detail.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/detail-responsive.css"/>
		<!-- select2 -->
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/select2/select2.min.css"> 
	    <script src="${pageContext.request.contextPath }/resources/plugins/select2/select2.full.min.js"></script>
	    
	    
	</head>
	<body ng-app="myApp" ng-controller="myCtrl">
		<div id="fb-root"></div>
		<script>
			(function(d, s, id) {
				  var js, fjs = d.getElementsByTagName(s)[0];
				  if (d.getElementById(id)) return;
				  js = d.createElement(s); js.id = id;
				  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5&appId=1635052403440641";
				  fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));
		</script>
		
		<div class="main-container">
			<%-- <c:set var="baseURL" value="${fn:replace(pageContext.request.requestURL, pageContext.request.requestURI, pageContext.request.contextPath)}"/> --%>
			
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
						
						<div class="detail-content">
							<div class="article-title">
								<h2 ng-bind="article.title"></h2>
								<div class="article-save">
									<i ng-if="article.saved==false" id="news{{article.id}}" ng-click="saveNews(article.id)" title="ចុចទីនេះដើម្បីរក្សាទុកព័ត៌មាន" class="fa fa-bookmark-o"></i>
									<i ng-if="article.saved==true" title="ព័ត៌មានបានរក្សាទុកហើយ" class="fa fa-bookmark"></i>
								</div>
								<p ng-bind="article.date | date:'EEEE, d MMM y'"></p>
							</div>
							<div class="article-content" ng-bind-html="article.content"></div>
							
							<div class="article-share">
								<div class="fb-like" data-href="http://localhost:8080/AKNnewsWebs/detail/${id }" data-layout="button_count" data-action="like" data-show-faces="false" data-share="true"></div>	
							</div>
							<div class="article-comment">
								<div class="fb-comments" data-href="http://localhost:8080/AKNnewsWebs/detail/${id }" data-width="100%" data-numposts="5"></div>
							</div>
						</div>
					</div><!--/end a-body  -->
					<div class="a-right-side">
						<ul class="a-popular">
							<li><i class="fa fa-area-chart"></i>ព័ត៌មានពេញនិយម</li>
							<li ng-repeat="popular in populars">
								<div class="a-popular-item">
									<a href="{{popular.url}}" target="_blank"><img src="{{popular.image}}"/></a>
									<p><a href="{{popular.url}}" target="_blank" ng-bind="popular.title"></a></p>
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
			
			app.controller('myCtrl', function($scope, $window, $http, $sce){
				
				$http.defaults.headers.common.Authorization = 'Basic YXBpOmFrbm5ld3M=' ;
				
				$scope.baseurl = "http://localhost:8080/AKNnews/";
				
				$scope.article = {};
				
				$scope.categories = [];
				$scope.populars = [];
				$scope.top2 = [];
				$scope.navCategory = [];
				$scope.sites = [];
				
				$scope.uid = 5;
				$scope.row = 9;

				$scope.sid = 0;
				$scope.cid = 0;
				$scope.page = 1;
				
				$scope.nid = "${id}";
				
				$scope.key = "";
				$scope.isSearch = false;
				
				$scope.loadingStatus = true;
				$scope.userprofileStatus = false;
				$scope.phoneMenuStatus = false;
			
				
				//initialize news data
				$scope.initializeNews = function(){
					$http({
                        method: "GET",
                        url: $scope.baseurl + "api/initialize/detail/" + $scope.nid +"/"+ $scope.uid
                    })
                    .success(function (response) {
                    	
                    	angular.forEach(response.CATEGORY, function(data, key) {
                   		 	$scope.categories.push(data);
                   			if(data.menu==true)
                   			 	$scope.navCategory.push(data);
				    	});
                    	
                    	angular.forEach(response.SITE, function(data, key) {
				    		$scope.sites.push(data);
                    	});
                    	
                    	angular.forEach(response.POPULAR, function(data, key) {
                    		if(key>6)
                    			return;
                    		$scope.populars.push(data);
				    	});
                    	
                    	$scope.article = response.NEWS;
                   		$scope.article.content = $sce.trustAsHtml($scope.article.content);
                   		
				    });
				};
				$scope.initializeNews();
				
				$scope.saveNews = function(nid){
					
					$http({
						method: "POST",
                        url: $scope.baseurl + "api/article/savelist",
                        data: {
                        	newsid:nid, userid:$scope.uid
                        }
                    })
                    .success(function (response) {
                    	angular.element('#news'+nid).removeClass("fa-bookmark-o").addClass("fa-bookmark").prop("title", "ព័ត៌មានបានរក្សាទុកហើយ");
                    	console.log(response.MESSAGE);
				    });	
				};
				
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
				
		});
			
		</script>
	</body>
</html>