<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp" ng-controller="myCtrl">
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		
		<title ng-bind="article.title"></title>
		
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
	    
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/color-library.css"/>
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/override-color.css"/>
	  	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/animation.css"/>
	</head>
	<body>
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
			
			<jsp:include page="include/header.jsp"></jsp:include>
			
			<div class="a-container">
				<div class="a-row">
					<div class="a-left-side">
						<ul class="a-category">
							<li><i class="fa fa-tags"></i>ប្រភេទ</li>
							<li ng-repeat="category in categories" id="category{{category.id}}" value="{{category.id}}"><a href="${pageContext.request.contextPath }/{{category.id}}/category"><i class="fa fa-angle-down"></i><span ng-bind="category.name"></span></a></li>
						</ul>
					</div><!--/end a-left-side  -->
					
					<div class="a-body">
						
						<div class="detail-content">

							<div class="article-title border-t1px">
								<h2 ng-bind="article.title"></h2>
								<div class="article-save color">
									<i ng-if="article.saved==false" id="news{{article.id}}" ng-click="saveNews(article.id)" title="ចុចទីនេះដើម្បីរក្សាទុកព័ត៌មាន" class="fa fa-bookmark-o"></i>
									<i ng-if="article.saved==true" title="ព័ត៌មានបានរក្សាទុកហើយ" class="fa fa-bookmark"></i>
								</div>
								<p ng-bind="article.date | date:'EEEE, d MMM y'"></p>
							</div>
							<div class="article-content border-t1px" ng-bind-html="article.content"></div>
							
							<div class="article-share">
								<div class="fb-like" data-href="{{webbaseurl}}detail/${id }" data-layout="button_count" data-action="like" data-show-faces="false" data-share="true"></div>	
							</div>
							<div class="article-comment border-t1px">
								<div class="fb-comments" data-href="{{webbaseurl}}detail/${id }" data-width="100%" data-numposts="5"></div>
							</div>
						</div>
					</div><!--/end a-body  -->
					<div class="a-right-side">
						<ul class="a-popular">
							<li><i class="fa fa-area-chart"></i>ព័ត៌មានពេញនិយម</li>
							<li ng-repeat="popular in populars">
								<div class="a-popular-item" ng-if="popular.site.id==6">
									<a href="{{webbaseurl}}{{popular.url}}" target="_blank"><img ng-src="{{webbaseurl}}resources/images/{{popular.image}}"/></a>
									<p​ ><a href="{{webbaseurl}}{{popular.url}}" target="_blank" ng-bind="popular.title"></a></p>
									<div class="clear"></div>
								</div>
								<div class="a-popular-item" ng-if="popular.site.id!=6">
									<a href="{{popular.url}}" target="_blank"><img ng-src="{{popular.image}}"/></a>
									<p><a href="{{popular.url}}" target="_blank" ng-bind="popular.title"></a></p>
									<div class="clear"></div>
								</div>								
								
							</li>
						</ul>
					</div><!--/end a-right-side  -->
					
				</div><!--/end a-row  -->
				
				<div class="msg-alert"​ ng-if="showAlert">
					<p>សូម <a href="${pageContext.request.contextPath }/login">Login</a> ដើម្បីរក្សាទុកពត៌មាននេះ..!</p>
				</div>
				
				<jsp:include page="include/menu.jsp"></jsp:include>
				
			</div><!--/end a-container  -->
			
		</div><!--/end main container  -->
		<div id="hrd_memo_pess" style=></div> 
		<script src='http://192.168.178.186:8080/HRD_MEMO/resources/js/hrdmemoplugin.js'></script>
		
		
		<script>
			var app = angular.module('myApp', []);
			
			app.controller('myCtrl', function($scope, $window, $http, $sce, $location, $timeout){
				
				$http.defaults.headers.common.Authorization = 'Basic YXBpOmFrbm5ld3M=' ;
				
				$scope.domain = $location.protocol()+"://"+$location.host()+":"+$location.port();
				
				$scope.webbaseurl = $scope.domain + "/AKNnewsWebs/";
				$scope.baseurl = $scope.domain + "/AKNnews/";
				
				$scope.article = {};
				
				$scope.categories = [];
				$scope.populars = [];
				$scope.navCategory = [];
				$scope.sites = [];
				
				$scope.uid = 0;
				if('${sessionScope.SessionUser}'!= '')
					$scope.uid = "${sessionScope.SessionUser.userId}";
				
				$scope.nid = "${id}";
				
				$scope.loadingStatus = true;
				$scope.userprofileStatus = false;
				$scope.phoneMenuStatus = false;
				$scope.showAlert = false;
				
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
                   		
                   		/* $window.document.title = $scope.article.title; */
                   		
				    });
				};
				$scope.initializeNews();
				
				$scope.saveNews = function(nid){
					if($scope.uid==0){
						$scope.showAlert = true;
						$timeout(function(){ $scope.showAlert = false; },3000);
						return;
					}
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
	 
				//initialize select2
				angular.element("select").select2({
	  				templateResult: formatState,
					templateSelection: formatState
				});
				
				// toggle show profile menu
				$scope.toggleShowProfile = function(){
					if($scope.userprofileStatus == false)
						$scope.userprofileStatus = true;
					else
						$scope.userprofileStatus = false;
				};
				
				//toggle phone menu
				$scope.togglePhoneMenu = function(){
					
					if($scope.phoneMenuStatus == false)
						$scope.phoneMenuStatus = true;
					else
						$scope.phoneMenuStatus = false;
				};
				
				$scope.searchArticles = function(){
					location.href = $scope.webbaseurl + "search?key=" + window.encodeURIComponent($scope.key).replace(/%/g,"@");
				}; 
		});
			
		</script>
	</body>
</html>