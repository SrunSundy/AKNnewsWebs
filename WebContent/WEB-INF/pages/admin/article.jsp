<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Articlemanagment | AKNnews</title>
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
            Article Management
            <small></small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li >Article Management</li>
            <li class="active">List Article</li>
          </ol>
        </section>

        <!-- Main content -->
        <!-- Main content -->
        <section class="content" >
          
         	<div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">List of News Source</h3>
                  <div class="box-tools">
                     <form >
                    <div class="input-group" style="width: 150px;">
                  
                      <input id="searchbox" type="text" name="table_search" class="form-control input-sm pull-right" placeholder="Search" ng-model="searchkey">
                      <div class="input-group-btn">
                        <button  class="btn btn-sm btn-default"  ng-click="searchArticles(searchkey)"><i class="fa fa-search" ></i></button>
                      </div>
                    
                    </div>
                     </form>
                  </div>
                </div><!-- /.box-header -->
                
                <div class="div-filter col-md-12">
                	<div class="row">
	                <div class="box-footer clearfix col-md-3">
	                  <ul class="pagination pagination-sm no-margin pull-left">
	                    <li> 
	
	                    <select  id="setrow" class="form-control select3" ng-options="item as item.label for item in items track by item.id" ng-model="selected"
	                    ng-change="changeRow(selected)" >
	                    
	                    </select>
	               <!-- /.form-group --></li>
	                   
	                  </ul>
	                  
	                </div>
	                 
	                 <div class="col-md-3">
	                 	
	                 </div>
	                
	                 <div class="box-footer clearfix col-md-3">
	                 	<div class="input-group">
		                    <span class="input-group-addon">Category</span>
		                     <select  id="filtercate" class=" select2 " style="width: 100%"  ng-options="category as category.name for category in categories track by category.id" ng-model="fcate"
	                    ng-change="filterCategory(fcate)"  >
	                    </select> 
	                    
		                  </div>
	                
	                   
	                </div>
	                
	                 <div class="box-footer clearfix col-md-3">
	                 <div class="input-group">
		                    <span class="input-group-addon">Site</span>
	                  <select   id="filtersite" class=" select2 " style="width: 100%"  ng-options="site as site.name for site in sites track by site.id" ng-model="fsite"
	                    ng-change="filterSite(fsite)" >
	                    </select> 
	                   </div>
	                    
	                 
	                </div>
	                
	             </div><!-- row -->
               </div>
               <div class="col-md-12">
               		 <h4 class="box-title" style="margin-right: 10px;" ><i>Result:</i> <small>{{Totalrecord}} records</small></h4>
               </div>
                <div class="box-body table-responsive no-padding col-md-12">
                  <table class="table table-hover">
                    <tr>
                      <th>Source</th>
                      <th>ID</th>
                      <th>Title</th>
                      <th>Posted Time</th>
                      <th>View</th>
                      <th>Category</th>
                      <th>Status</th>
                      <th style="width:10%">Action</th>
                    </tr>
                   
                    <tr ng-hide="articles.length">
                    	<td colspan="8" class='nodata'><p>Oops! No Data Found</p></td>
                    </tr>
                   
                   <tr  ng-repeat="article in articles">	
                      <td><img class='logo-style' ng-src='{{baseurl}}/resources/images/logo/{{article.site.logo }}'  class="img-circle" title='{{article.site.name}}'/></td>
                      <td>{{article.id }}</td>
                      <td>{{mySplit(article.title)}}</td>
                      <td >{{convertTimeago(article.date) | date:'EEEE, d MMM y'}}</td>
                      <td>{{article.hit }}</td>
                      <td><span class="label label-danger">{{article.category.name }}</span></td>
                      
                      <td ng-if="article.status == true"><i ng-click="toggleStatusTrue(article.id)"  id="{{ 't'+ article.id }}" class="fa fa-check-square statustrue"></i></td>
                      <td ng-if="article.status == false"><i ng-click="toggleStatusFalse(article.id)" id="{{ 'f'+ article.id }}" class="fa fa-times-circle statusfalse"></i></td>
                      
                    
                      <td ng-show="article.site.id == 6">
	                      <form action="${pageContext.request.contextPath }/admin/updatearticle/" method="POST">
	                      		 <input type="hidden" name="newsid" ng-value="{{article.id}}"/> 
	                      		 <input type="hidden" name="newscate" ng-value="'{{article.category.name}}'"/>
	                       		<button type="submit" class="fa fa-pencil-square-o action ownweb btn btn-primary" ></button>
	                      </form>
	                      <button type="button" class="fa fa-share action ownweb btn btn-success" ng-click="gotoSiteOwn(article.url)" ></button>
                      </td>
                      <td ng-show="article.site.id != 6"><button type="button" class="fa fa-share action btn btn-success" ng-click="gotoSite(article.url)" ></button></td>
                    </tr>
                 
                  </table>
                </div><!-- /.box-body -->
                
                  <div class="box-footer clearfix">
                  	<div ng-hide="!articles.length" id="display"></div>
                </div>
              </div><!-- /.box -->
            </div>
            
          </div>
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
      $(function () {
        //Initialize Select2 Elements
        $(".select2").select2();
      });
      
    </script>
  <script>
 
	var app = angular.module('myApp', []);
	app.controller('myCtrl', function($scope, $http,$location){
		
	
		$http.defaults.headers.common.Authorization = 'Basic YXBpOmFrbm5ld3M=' ;

		$scope.domain = $location.protocol()+"://"+$location.host()+":"+$location.port();

		$scope.webbaseurl = $scope.domain + "/AKNnewsWebs/";
		$scope.baseurl = $scope.domain + "/AKNnews/";
		
		
		$scope.categories = [];
		$scope.sites = [];
		
		$scope.row = 15;
		$scope.sid = 0;
		$scope.cid = 0;
		$scope.page = 1;
		
		$scope.statustrue =0;
		$scope.statusfalse =0;
		
		$scope.triggerpage = 0;
		
		$scope.Totalrecord = 0;

		$scope.toggleStatus = function(nid){
			return $http({
                method: "PATCH",
                url: $scope.baseurl + "api/article/toggle/"+nid,
            });
		};
		$scope.toggleStatusTrue = function(nid){
			$scope.toggleStatus(nid).success(function (response) {
				/* $scope.statustrue++;
				if($scope.statustrue%2==0){
					angular.element("#t"+nid).removeClass("fa-times-circle statusfalse").addClass("fa-check-square statustrue");
					alert(response.MESSAGE);
					return;
				}
				angular.element("#t"+nid).removeClass("fa-check-square statustrue").addClass("fa-times-circle statusfalse");
        		alert(response.MESSAGE); */
        		$scope.listArticles();
        		swal("News has been disabled successfully", "", "success");
	    	}).error(function (response) {
				swal("Fail to disable", "", "error");
	    	});
		};
		$scope.toggleStatusFalse = function(nid){
			$scope.toggleStatus(nid).success(function(response){
				/*  $scope.statusfalse++;
				alert($scope.statusfalse);
				if($scope.statusfalse%2==0){
					angular.element("#f"+nid).removeClass("fa-check-square statustrue").addClass("fa-times-circle statusfalse");
					alert(response.MESSAGE);
					return;
				}
				angular.element("#f"+nid).removeClass("fa-times-circle statusfalse").addClass("fa-check-square statustrue");
	        	alert(response.MESSAGE); */
				$scope.listArticles();
			swal("News has been enabled successfully", "", "success");
	    	}).error(function (response) {
				swal("Fail to enable", "", "error");
	    	});
		}  
		
		$scope.gotoSite = function(url){
			
			 window.open( url,'_blank');
		}
		$scope.gotoSiteOwn = function(url){
			
			 window.open($scope.webbaseurl +url,'_blank');
		}
		
		$scope.listSearchArticles = function(key){
			$scope.triggerpage++;
			json ={"key": $scope.searchkey,"page": $scope.page,"row": $scope.row,"cid": $scope.cid,"sid": $scope.sid,"uid": -1};
			$http({
                method: "POST",
                url: $scope.baseurl + "api/article/search/",
                data : JSON.stringify(json),
            })
            .success(function (response) {
            	
            	if(response.RESPONSE_DATA.length == 0){
            		console.log('no article..!');   		
            	}
		    		 $scope.articles=response.RESPONSE_DATA; 		    	
		    		$scope.Totalrecord = response.TOTAL_RECORDS;
		    		 $('#display').bootpag({total: response.TOTAL_PAGES });
		    		 if($scope.triggerpage > 1){
		    			 return;
		    		 }
		    		 $scope.loadpagination($scope.numofpage);		
		    });
		};
		
		$scope.searchArticles = function(key){
			$scope.page = 1;
			$('#display').bootpag({page : '1' });
			$scope.listSearchArticles($scope.searchkey);
			$("#searchbox").blur();
		
		};

		$scope.listArticles = function(){
			if(!($scope.searchkey == '' || $scope.searchkey==null)){
				$scope.listSearchArticles($scope.searchkey);
				return;
			}
			$scope.triggerpage++;
			$http({
                method: "GET",
                url: $scope.baseurl + "api/article/"+$scope.page+"/"+$scope.row+"/"+$scope.cid+"/"+$scope.sid+"/-1/"
            })
            .success(function (response) { 	
            	if(response.RESPONSE_DATA.length == 0){
            		console.log('no article..!');              		
            	}
	    		$scope.Totalrecord = response.TOTAL_RECORDS;
		    		 $scope.articles=response.RESPONSE_DATA; 		    		 
		    		 $('#display').bootpag({total: response.TOTAL_PAGES });
		    		 if($scope.triggerpage > 1){
		    			 return;
		    		 }
		    		 $scope.loadpagination();		
		    });
		};
		
		$scope.listCategories = function(){
			
			$http({
                method: "GET",
                url: $scope.baseurl + "api/article/category/news/"
            })
            .success(function (response) {
            	$scope.categories.push({
            		id : "0" , name:"NO FILTER" , menu : true 
            	 });
            	angular.forEach(response.DATA, function(data, key) {
           		  $scope.categories.push(data);
		    	});
            	$scope.fcate = $scope.categories[0];    	
		    });
		};
		
		$scope.listSites = function(){			
			$http({
                method: "GET",
                url: $scope.baseurl + "api/article/site/"
            })
            .success(function (response) {
            	$scope.sites.push({
            		id : "0" , name:"NO FILTER" ,
            	 });
            	angular.forEach(response.DATA, function(data, key) {
           		  $scope.sites.push(data);
		    	});
            	$scope.fsite = $scope.sites[0];  	
		    });
		};

		$scope.loadpagination = function(){
		
			 $('#display').bootpag({
		            
		            maxVisible: 5,
			        leaps: true,
			        firstLastUse: true,
			        first: '&#8592;',
			        last: '&#8594;',
			        wrapClass: 'pagination',
			        activeClass: 'active',
			        disabledClass: 'disabled',
			        nextClass: 'next',
			        prevClass: 'prev',
			        lastClass: 'last',
			        firstClass: 'first'
		        }).on("page", function(event, /* page number here */ num){
		        	$scope.page = num;
		        	$scope.listArticles();
		        });
		};
		
		
		$scope.listArticles();
		$scope.listCategories();
		$scope.listSites();
		

		$scope.mySplit = function(string) {
			if(string=="" || string == null){
				return "";
			}
		    var array = string.substring(0,50);
		    return array;
		};
		
		$scope.changeRow = function(row) {
			$("#setrow").blur();
			$scope.page = 1;
			$('#display').bootpag({page : '1' });
			$scope.row= row.label;
			$scope.listArticles();
		};
		$scope.filterCategory = function(cate){
			$("#filtercate").blur();
			$scope.page = 1;
			$('#display').bootpag({page : '1' });
			$scope.cid = cate.id;
			$scope.listArticles();
		};
		
		$scope.filterSite = function(site){
			$("#filtersite").blur();
			$scope.page = 1;
			$('#display').bootpag({page : '1' });
			$scope.sid = site.id;
			$scope.listArticles();
		}
	

		$scope.items = [{id: 1,label: '15',},{id: 2,label: '30',},{id:3,label: '50',}, {id: 4,label: '100',}];
		$scope.selected = $scope.items[0];
		
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
