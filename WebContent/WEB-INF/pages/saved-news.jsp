<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		
		<title>AKN ព័ត៌មាន | ព៍ត៌មានបានរក្សាទុក</title>
		
		<link href="${pageContext.request.contextPath }/resources/images/logo/akn.png" rel="shortcut icon">
			
		<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script> -->
		<script src="${pageContext.request.contextPath }/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
		
		<script src="${pageContext.request.contextPath }/resources/angularjs/angular.min.js"></script>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css">
		
		<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> -->
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/fontawesome/css/font-awesome.min.css">
		
		
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/phearun1.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/phearun1-override.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/responsive1.css"/>
	    
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/jasny-bootstrap/css/jasny-bootstrap.min.css">  
	    <script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>
	    <script src="${pageContext.request.contextPath }/resources/plugins/jasny-bootstrap/js/jasny-bootstrap.min.js"></script>
	    
	    
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/override-color.css"/>
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/animation.css"/>
	     
	    <style>
	    	 .modal{
	    		z-index:100000;
	    		/* margin-top:100px; */
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
	    	}
	    	.error{
	    		color:red;
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
							<!-- <li data-toggle="modal" data-target="#myUpload"><i class="fa fa-camera"></i>ប្តូរ រូបភាព</li> -->
							<li data-toggle="modal" data-target="#changePWD"><i class="fa fa-key"></i>ប្តូរ លេខសម្ងាត់</li>
						</ul>
						<ul class="a-category">
							<li><i class="fa fa-clock-o"></i>ព័ត៌មាន តាមកាលបរិច្ជេទ</li>
							<li ng-click="newsShcedule(1)"><i class="fa fa-angle-down"></i>ថ្ងៃនេះ</li>
							<li ng-click="newsShcedule(7)"><i class="fa fa-angle-down"></i>សប្តាហ៍នេះ</li>
							<li ng-click="newsShcedule(30)"><i class="fa fa-angle-down"></i>ខែនេះ</li>
							<li ng-click="newsShcedule(31)"><i class="fa fa-angle-down"></i>ពីមុនៗ</li>
						</ul>
					</div><!--/end a-left-side  -->
					
					<div class="a-body">
					
						<div class="clear"></div>
						<div class="timeline-block">
							<h3><i class="fa fa-bookmark"></i> ព័ត៌មានដែលបានរក្សាទុក</h3>
						</div>
						<div class="article-block" ng-repeat="article in articles">
							<div class="article-block-b1">
								<div class="article-item">
									<div class="article-components">
										<div class="remove-icon"​ ng-click="removeNews(article.id)"><i class="fa fa-trash" title="លុបព័ត៌មានចេញ"></i></div>
										<div class="article-image">
											<a href="{{article.url}}" ng-if="article.site.id!=6" ng-click="readNews(article.id)" target="_blank"><img ng-src="{{article.image}}"/></a>
											<a href="{{article.url}}" ng-if="article.site.id==6" ng-click="readNews(article.id)" target="_blank"><img ng-src="{{baseurl}}resources/images/news/{{article.image}}"/></a>
										</div>
										<div class="article-desc">
											<p><a href="{{article.url}}" ng-click="readNews(article.id)" target="_blank" ng-bind="article.title"></a></p>
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
					
					
					
				</div><!--/end a-row  -->
				<!-- 
				Modal Change Image
				<div class="modal fade" id="myUpload" role="dialog" >
				    <div class="modal-dialog">
				      
				      Modal content
				      <div class="modal-content">
				      <form id="frmupload" name="frm" ng-submit='uploadImage()' enctype="multipart/form-data">
				        <div class="modal-header">
				          	<h4>ប្តូររូបភាព</h4>
				        </div>
				        <div class="modal-body">
								<div class="fileinput fileinput-new" data-provides="fileinput">
								  	<div class="fileinput-preview thumbnail " id="thum" data-trigger="fileinput" ></div>
								  	<div>
								  		 <input type="hidden" value="" name="id" id="id"/> 
								   		 <span class="btn btn-default btn-file"><span class="fileinput-new">ជ្រើសរើស រូបភាព</span>
								   		 <span class="fileinput-exists">ផ្លាស់ប្តូរ</span>
								   		 <input id="newsthumbnail" type="file" name="file" required  name="..." /></span>
								    	 <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">លុបចេញ</a>
								  	</div>
								</div>
				        </div>
				        <div class="modal-footer">
					         <input type="submit" class="btn btn-default" value='រក្សាទុក' ng-disabled="frm.$invalid" ></button>
					    </div>
					    </form>
				      </div>
				      
				    </div>
				 </div>end modal  -->
				 
				<!-- Modal Change Password -->
				<div class="modal fade" id="changePWD" role="dialog" >
				    <div class="modal-dialog">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				      <form ng-submit="changePassword()" name="myForm">
				        <div class="modal-header">
				          	<h4>ប្តូរលេខសម្ងាត់</h4>
				        </div>
				        <div class="modal-body">
					              <div class="box-body">
					                <div class="form-group">
					                	<input type="hidden" value='{{uid}}' required name="id" id="id"/> 
					                  	<label for="oldpasswd">លេខសម្ងាត់ចាស់</label>
					                  	<input type="password" class="form-control" name='oldpwd' placeholder="បញ្ចូល លេខសម្ងាត់ចាស់" required ng-minlength="5" ng-model='userpwd.oldPassword'/>
							              <span class='error' ng-show="myForm.$dirty && myForm.oldpwd.$error.minlength">លេខសម្ងាត់ ត្រូវមានយ៉ាងតិច ៥ ខ្ទង់</span>
					                </div>
					                <div class="form-group">
					                  	<label for="newpasswd">លេខសម្ងាត់ថ្មី</label>
					                  	<input type="password" class="form-control"  name='newpwd' placeholder="បញ្ចូល លេខសម្ងាត់ថ្មី" required ng-minlength="5" ng-model='userpwd.newPassword' ng-change='checkPassword()' />
			             		   		  <span class='error'ng-show="myForm.$dirty && myForm.newpwd.$error.minlength">លេខសម្ងាត់ ត្រូវមានយ៉ាងតិច ៥ ខ្ទង់</span>
					                </div>
					                <div class="form-group">
					                  	<label for="confirmpasswd">បញ្ជាក់ លេខសម្ងាត់ថ្មី </label>
					                  	<input type="password" class="form-control" name='newpwd2' placeholder="បញ្ចូល លេខសម្ងាត់ថ្មី ម្តងទៀត" required ng-minlength="5" ng-model='conpwd' ng-change='checkPassword()'/>
			             		   		 <!--  <span class='error'ng-show="myForm.$dirty && myForm.newpwd2.$error.minlength">លេខសម្ងាត់ ត្រូវមានយ៉ាងតិច ៥ ខ្ទង់</span> -->
			            				  <span class='error'ng-show="statusShow">លេខសម្ងាត់ មិនត្រូវគ្នា</span>
					                </div>
					              </div>
					              <!-- /.box-body -->
				        </div>
				        <div class="modal-footer">
					         <input type="submit" class="btn btn-primary" value='រក្សាទុក' ng-disabled="myForm.$invalid || status == false " />
					    </div>
					    </form>
				      </div>
				      
				    </div>
				 </div><!--end modal  -->
				 
				 <jsp:include page="include/menu.jsp"></jsp:include>
				 
			</div><!--/end a-container  -->
		</div><!--/end main container  -->
		
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
				$scope.navCategory = [];
				$scope.sites = [];
				//$scope.pstatus = false;
				$scope.uid = 0;
				
				if('${sessionScope.SessionUser}' != '')
					$scope.uid = '${sessionScope.SessionUser.userId}';
							
				$scope.row = 15;
				$scope.day = 0;
				$scope.page = 0;
				
				$scope.loadingStatus = true;
				$scope.userprofileStatus = false;
				$scope.phoneMenuStatus = false;
				
				//user check password
				$scope.userpwd = {userId:'',oldPassword:'',newPassword:''};
				$scope.conpwd = null;
				$scope.status = false;
				$scope.statusShow = false;
				
				//check password 
				$scope.checkPassword = function(){
					if ($scope.conpwd != $scope.userpwd.newPassword){
						$scope.status = false;
						$scope.statusShow = true;
						return;
					}
					$scope.statusShow = false;
					$scope.status = true;
				};
			/* 	//upload image 
				$scope.uploadImage = function(){
			    	var form_data = new FormData(document.getElementById('frmupload'));                  
 	  			  	alert('${sessionScope.SessionUser.userId});
			           $http.post(
							$scope.baseurl+'api/user/editupload'
							,form_data
							,{
								transformRequest : angular.identity,
								headers: {
								'header': 'Basic YXBpOmFrbm5ld3M=' ,
					            'Accept': 'application/json;odata=verbose',
					            'Content-Type' : undefined
					       		 }
							}
						).success(function(response){						
							console.log( response ); 
							$window.location.href = $location.absUrl();
						}).error(function(response){
							console.log( response ); 
						});	
				}; 
				*/
				//change password
				$scope.changePassword = function(){

					$scope.userpwd.userId = $scope.uid;
					console.log($scope.userpwd);
 	  			    $http.post(
							$scope.baseurl+'api/user/changepwd'
							,$scope.userpwd
						).success(function(response){						
							console.log( response ); 	
							alert(response.MESSAGE);
							$scope.reset();
						}).error(function(response){
							console.log( response ); 
						});	
				};
				
				//reset form change password
	 		    $scope.reset = function(){
	 		    	$scope.userpwd = {userId:'',oldPassword:'',newPassword:''};
	 		    	$scope.conpwd = null;
	                $scope.myForm.$setPristine(); //reset Form
	            };
				
	            /* //initialize news data */
				$scope.loadNews = function(){
					$scope.page += 1;
					console.log($scope.page+','+$scope.row+','+ $scope.uid);
					$http({
                        method: "GET",
                        url: $scope.baseurl + "api/article/savelist/" + $scope.uid + "/" + $scope.row + "/" + $scope.page + "/" + $scope.day
                    })
                    .success(function (response) {
                    	if(response.RESPONSE_DATA.length==0){
                    		$scope.loadingStatus = false;
                    		return;
                    	}
                    	angular.forEach(response.RESPONSE_DATA, function(data, key) {
                    		$scope.articles.push(data);
                    		console.log("ID : " + data.id);
                    	});
                    	console.log("Length : " + $scope.articles.length);
                    	
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
				$scope.loadNews();
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
				    });
				};

				$scope.newsShcedule = function(day){
					$scope.page=0;
					
					$scope.day = day;
					$scope.articles = [];
					$scope.loadNews();
				};
				
				angular.element($window).bind("scroll", function() {
                    var windowHeight = "innerHeight" in window ? window.innerHeight: document.documentElement.offsetHeight;
                    var body = document.body, html = document.documentElement;
                    var docHeight = Math.max(body.scrollHeight,body.offsetHeight, html.clientHeight,html.scrollHeight, html.offsetHeight);
                    windowBottom = windowHeight + window.pageYOffset;

                    if (windowBottom >= docHeight) {
                    	console.log($scope.page);
                    	$scope.$apply($scope.loadNews());
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
				
				$scope.searchArticles = function(){
					location.href = $scope.webbaseurl + "search?key=" + window.encodeURIComponent($scope.key).replace(/%/g,"@");
				}; 
				
		});
		</script>
	</body>
</html>