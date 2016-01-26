<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		
		<title>AKN ព័ត៌មាន | ព៍ត៌មានបានរក្សាទុក</title>
		
		<link href="${pageContext.request.contextPath }/resources/images/logo/akn.png" rel="shortcut icon">
			
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath }/resources/angularjs/angular.min.js"></script>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css">
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/phearun1.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/phearun1-override.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/responsive1.css"/>
	    
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/jasny-bootstrap/css/jasny-bootstrap.min.css">  
	    <script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>
	    <script src="${pageContext.request.contextPath }/resources/plugins/jasny-bootstrap/js/jasny-bootstrap.min.js"></script>
	    
	    
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/override-color.css"/>
	     
	    <style>
	    	 .modal{
	    		z-index:100000;
	    		margin-top:100px;
	    	} 
	    	.modal-content{
	    		border-radius:0px;
	    		border:0px;
	    	}
	    	.btn{
	    		border-radius:0px;
	    	}
	    	.form-control{
	    		border-radius:0px;
	    	}
	    	h3{
	    		margin-top:0px;
	    		margin-bottom:0px;
	    	}
	    </style>
	</head>
	<body ng-app="myApp" ng-controller="myCtrl">
		
		<div class="main-container">
		
			<jsp:include page="include/header.jsp"></jsp:include>
			
			<div class="a-container">
				<div class="a-row">
					<div class="a-left-side">
						<ul class="a-category">
							<li><i class="fa fa-user"></i>ព័ត៌មាន អ្នកប្រើប្រាស់</li>
							<li><i class="fa fa-bookmark"></i> ព័ត៌មាន បានរក្សាទុក</li>
							<li data-toggle="modal" data-target="#myUpload"><i class="fa fa-camera"></i>ប្តូរ រូបភាព</li>
							<li data-toggle="modal" data-target="#changePWD"><i class="fa fa-key"></i>ប្តូរ លេខសម្ងាត់</li>
						</ul>
						<ul class="a-category">
							<li><i class="fa fa-clock-o"></i>ព័ត៌មាន តាមកាលបរិច្ជេទ</li>
							<li><i class="fa fa-angle-down"></i>ថ្ងៃនេះ</li>
							<li><i class="fa fa-angle-down"></i>សប្តាហ៍នេះ</li>
							<li><i class="fa fa-angle-down"></i>ខែនេះ</li>
							<li><i class="fa fa-angle-down"></i>ពីមុនៗ</li>
						</ul>
					</div><!--/end a-left-side  -->
					
					<div class="a-body">
					
						<div class="clear"></div>
						<div class="timeline-block">
							<h3><i class="fa fa-bookmark"></i> Today Saved</h3>
						</div>
						<div class="article-block" ng-repeat="article in articles">
							<div class="article-block-b1">
								<div class="article-item">
									<div class="article-components">
										<div class="remove-icon"​ ng-click="removeNews(article.id)"><i class="fa fa-trash" title="លុបព័ត៌មានចេញ"></i></div>
										<div class="article-image">
											<a href="{{article.url}}" ng-if="article.site.id!=6" ng-click="readNews(article.id)" target="_blank"><img ng-src="{{article.image}}"/></a>
											<a href="{{article.url}}" ng-if="article.site.id==6" ng-click="readNews(article.id)" target="_blank"><img ng-src="{{baseurl}}resources/images/{{article.image}}"/></a>
										</div>
										<div class="article-desc">
											<p><a href="{{article.url}}" ng-click="readNews(article.id)" target="_blank">{{article.title}}</a></p>
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
				
				<!-- Modal Change Image -->
				<div class="modal fade" id="myUpload" role="dialog" >
				    <div class="modal-dialog">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          	<h4>Change Profile</h4>
				        </div>
				        <div class="modal-body">
							<div class="fileinput fileinput-new" data-provides="fileinput">
							  	<div class="fileinput-preview thumbnail " id="thum" data-trigger="fileinput" ></div>
							  	<div>
							   		 <span class="btn btn-default btn-file"><span class="fileinput-new">Select Image</span><span class="fileinput-exists">Change</span><input id="newsthumbnail" type="file"  name="..." /></span>
							    	 <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
							  	</div>
							</div>
				        </div>
				        <div class="modal-footer">
					         <button type="submit" class="btn btn-default">Upload</button>
					    </div>
				      </div>
				      
				    </div>
				 </div><!--end modal  -->
				 
				<!-- Modal Change Password -->
				<div class="modal fade" id="changePWD" role="dialog" >
				    <div class="modal-dialog">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          	<h4>Change Password</h4>
				        </div>
				        <div class="modal-body">
			                <form role="form">
					              <div class="box-body">
					                <div class="form-group">
					                  	<label for="oldpasswd">Old Password</label>
					                  	<input type="password" class="form-control" id="oldpasswd" placeholder="Old Password">
					                </div>
					                <div class="form-group">
					                  	<label for="newpasswd">New Password</label>
					                  	<input type="password" class="form-control" id="newpasswd" placeholder="News Password">
					                </div>
					                <div class="form-group">
					                  	<label for="confirmpasswd">Confirm Password</label>
					                  	<input type="password" class="form-control" id="confirmpasswd" placeholder="Confirm Password">
					                </div>
					              </div>
					              <!-- /.box-body -->
					         </form>
				        </div>
				        <div class="modal-footer">
					         <button type="button" class="btn btn-primary">Save</button>
					    </div>
				      </div>
				      
				    </div>
				 </div><!--end modal  -->
				 
			</div><!--/end a-container  -->
			
		</div><!--/end main container  -->
		
		<script>
			var app = angular.module('myApp', []);
			
			app.controller('myCtrl', function($scope, $window, $http){
				
				$http.defaults.headers.common.Authorization = 'Basic YXBpOmFrbm5ld3M=' ;
				
				$scope.baseurl = "http://localhost:8080/AKNnews/";
				
				$scope.articles = [];
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
				
				$scope.key = "";
				$scope.isSearch = false;
				
				$scope.loadingStatus = false;
				$scope.userprofileStatus = false;
				$scope.phoneMenuStatus = false;
		
				
				//initialize news data
				$scope.initializeNews = function(){
					$http({
                        method: "GET",
                        url: $scope.baseurl + "api/article/savelist/" + $scope.uid
                    })
                    .success(function (response) {
                    	
                    	angular.forEach(response.RESPONSE_DATA, function(data, key) {
                    		$scope.articles.push(data);
                    	});
				    });
				};
				
				$scope.loadCategories = function(){
					$http({
                        method: "GET",
                        url: $scope.baseurl + "api/article/category/news"
                    })
                    .success(function (response) {
                    	angular.forEach(response.DATA, function(data, key) {
                    		$scope.categories.push(data);
                   			if(data.menu==true)
                   			 	$scope.navCategory.push(data);
                    	});
				    });
				};
				$scope.initializeNews();
				$scope.loadCategories();
				
				$scope.removeNews = function(nid){
					
					$http({
                        method: "DELETE",
                        url: $scope.baseurl + "api/article/savelist/" + nid + "/" + $scope.uid
                    })
                    .success(function (response) {
                    	angular.forEach($scope.articles, function(data, key) {
                    		if(data.id == nid){
                    			$scope.articles.splice(key, 1);
                    			return;
                    		}
                    	});
                    	
                    	/* $scope.articles = [];
                    	$scope.$apply($scope.initializeNews()); */
				    });
				};


				angular.element($window).bind("scroll", function() {
                    var windowHeight = "innerHeight" in window ? window.innerHeight: document.documentElement.offsetHeight;
                    var body = document.body, html = document.documentElement;
                    var docHeight = Math.max(body.scrollHeight,body.offsetHeight, html.clientHeight,html.scrollHeight, html.offsetHeight);
                    windowBottom = windowHeight + window.pageYOffset;

                    if (windowBottom >= docHeight) {
                    	
                    }
     	        });
     	    	
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
				
		});
		</script>
	</body>
</html>