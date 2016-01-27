<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>ArticleMangement | AKNnews</title>
	 <jsp:include page="import/header.jsp"></jsp:include> 
	
   
  </head>
  <body class="hold-transition skin-blue sidebar-mini"  ng-app="myApp" ng-controller="myCtrl">
  <input type="hidden" id="newsid" ng-model="newsid" value="${newsid }"/>
  <input type="hidden" id="newscate" ng-model="newscate" value="${newscate }"/>
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
            <small>Version 2.0</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home </a></li>
            <li class="active">Article Management</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
          	<div class="col-md-12">
          	    <!-- Input addon -->
              <div class="box ">
                <div class="box-header with-border">
                  <h3 class="box-title">Updating AKN Article</h3>
                </div>
                <div class="box-body">
                	<div class="col-md-12">
         				<div class="box bdis" >
			                <div class="box-header">
				                  <h3 class="box-title">Category <small> Updating your current category</small></h3>
				                  <!-- tools box -->
				                  <div class="pull-right box-tools">
				                    <button class="btn  btn-sm" data-widget="collapse" data-toggle="tooltip" title="Collapse" ng-click="loadCategories()"><i class="fa fa-minus iconshow" id=""></i></button>
				    
				                  </div><!-- /. tools -->
			                </div><!-- /.box-header -->
			                <div class="box-body pad  dis" id="">  
			                	<div class="col-md-12">
			                		<div class="row">
			                			<div class="col-md-6">
			                				<div class="box box-success">
									            <div class="box-header with-border">
									               <h3 class="box-title">Current Category</h3>
									              
									               <div class="box-tools pull-right">
									                  <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
									                </div><!-- /.box-tools -->
									            </div><!-- /.box-header -->
									          	 <div class="box-header">
									               		 <div  class="text-show"><h2 class="catetext" ng-bind="showcate"></h2></div>
									             </div><!-- /.box-body -->
									         </div><!-- /.box -->
			                			</div>
			                			<div class="col-md-6">
			                				 <div class="input-group">
							                    <span class="input-group-addon" >Category</span>
							                     <select  id="filtercate" class=" select2 " style="width: 100%"  ng-options="category as category.name for category in categories track by category.id" ng-model="fcate">
						                    	 </select> 
							                  </div>
						                   	 <br>
				              				 <button class="btn btn-danger update-btn" style="width:100px;float:right;" id="btnaction" ng-model="btnaction" ng-click="updateCategory()" style="width: 100%">Update</button>
			                			</div>
			                		</div>
			                	</div>
			             	 </div><!-- /.box -->
              			</div>
              		</div>
              		
              		<div class="col-md-12">
         				<div class="box bdis" >
			                <div class="box-header">
				                  <h3 class="box-title">Title <small>Updating your current title</small></h3>
				                  <!-- tools box -->
				                  <div class="pull-right box-tools">
				                    <button class="btn  btn-sm" data-widget="collapse" data-toggle="tooltip" title="Collapse" ng-click="loadTitle()"><i class="fa fa-minus iconshow" id=""></i></button>
				                  </div><!-- /. tools -->
			                </div><!-- /.box-header -->
			                <div class="box-body pad  dis" id=""> 
			                	 <div class="col-md-12">
			                	 	<div class="row">
			                	 		<div class="col-md-6">
			                	 			 <div class="box box-success">
									              <div class="box-header with-border">
									                  <h3 class="box-title">Current Title</h3>
									                  <div class="box-tools pull-right">
									                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
									                  </div><!-- /.box-tools -->
									              </div><!-- /.box-header -->
									              <div class="box-header">
									               	  <div ng-bind="showtitle" class="text-show"></div>
									              </div><!-- /.box-body -->
									          </div><!-- /.box -->
			                	 		</div>
			                	 		
			                	 		<div class="col-md-6">
			                	 		  <div class="form-group">
						                    <label >New Title</label>
						                    <textarea class="form-control"ng-model="title" placeholder="Enter title..." rows="3"></textarea>
						                  </div><br>			         
			              				  <button class="btn btn-danger update-btn" style="width:100px;float:right;" id="btnaction" ng-model="btnaction" ng-click="updateTitle()" style="width: 100%">Update</button>			             	
					                	 </div>
			                	 	</div>
			                	 </div>
			             	 </div><!-- /.box -->
		             	
              			</div>
              		</div>
              		
              		<div class="col-md-12">
         				<div class="box bdis" >
			                <div class="box-header">
				                  <h3 class="box-title">Description <small>updating your current description</small></h3>
				                  <!-- tools box -->
				                  <div class="pull-right box-tools">
				                    <button class="btn  btn-sm" data-widget="collapse" data-toggle="tooltip" title="Collapse" ng-click="loadDescription()"><i class="fa fa-minus iconshow" id=""></i></button>  
				                  </div><!-- /. tools -->
			                </div><!-- /.box-header -->
			               
			                <div class="box-body pad  dis" id="">  
			                   <div class="col-md-12">
			                   		<div class="row">
				                   		<div class="col-md-6">
				                   			<div class="box box-success">
									            <div class="box-header with-border">
									                <h3 class="box-title" >Current Description</h3>
									                <div class="box-tools pull-right">
									                   <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
									                </div><!-- /.box-tools -->
									            </div><!-- /.box-header -->
									            <div class="box-header">
									                <div ng-bind="showdes" class="text-show"></div>
									            </div><!-- /.box-body -->
									       </div><!-- /.box -->
				                   		</div>
				                   		
				                   		<div class="col-md-6">
				                   		   <div class="form-group">
						                      <label id="ldes">New Description</label>
						                      <textarea class="form-control" ng-model="description" rows="3" placeholder="Enter description ..."></textarea>
						                   </div><br>
				              			   <button class="btn btn-danger update-btn" style="width:100px;float:right;" id="btnaction" ng-model="btnaction" ng-click="updateDescription()" style="width: 100%">Update</button>
				                   		</div>
			                   		</div>
			                   </div>
			                   
			             	 </div><!-- /.box -->
              			</div>
              		</div>
              		
              		<div class="col-md-12">
         				<div class="box bdis" >
			                <div class="box-header">
				                  <h3 class="box-title">Thumbnail <small>updating your current thumbnail</small></h3>
				                  <!-- tools box -->
				                  <div class="pull-right box-tools">
				                    <button class="btn  btn-sm" data-widget="collapse" data-toggle="tooltip" title="Collapse" ng-click="loadThumbnail()"><i class="fa fa-minus iconshow" id=""></i></button>
				                  
				                  </div><!-- /. tools -->
			                </div><!-- /.box-header -->
			                <div class="box-body pad  dis" id="">  
		                		  <div class="fileinput fileinput-new" data-provides="fileinput">
							  <div class="fileinput-preview thumbnail " id="thum" data-trigger="fileinput" >
							  
							  </div>
							  <div>
							    <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input id="newsthumbnail" 
							      type="file" onchange="angular.element(this).scope().isLoadingImage()" name="..." /></span>
							    <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
							  </div>
							</div>
				                  <br>
			                   	 
	              				 <button class="btn btn-danger update-btn" style="width:100px;float:right;" id="btnaction" ng-model="btnaction" ng-click="updateThumbnail()" style="width: 100%">Update</button>
			             	
			             	 </div><!-- /.box -->
		             	
              			</div>
              		</div>
                	
                
                 
       
         			
         			<div class="col-md-12" >
         			 <div class="box bdis" >
		                <div class="box-header">
		                  <h3 class="box-title">Content <small>updating your current content</small></h3>
		                  <!-- tools box -->
		                  <div class="pull-right box-tools">
		                    <button class="btn  btn-sm" data-widget="collapse" data-toggle="tooltip" title="Collapse" ng-click="loadContent()"><i class="fa fa-minus iconshow" ></i></button>
		                  
		                  </div><!-- /. tools -->
		                </div><!-- /.box-header -->
		                <div class="box-body pad dis" >
		                		                    <textarea id="editor1" name="editor1" rows="100" cols="80">
		                                          
		                    </textarea>
		                    <br>
		                     <button class="btn btn-danger update-btn" style="width:100px;float:right;" id="btnaction" ng-model="btnaction" ng-click="updateContent()" style="width: 100%">Update</button>
			             	
		                
		                </div>
		              </div><!-- /.box -->
		              
              		</div>
              		
              		
              
                </div><!-- /.box-body -->
              </div><!-- /.box -->
          	
          	</div>
            
            <div class="col-md-12">
             

            </div><!-- /.col-->
            
          </div><!-- ./row -->
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
        // Replace the <textarea id="editor1"> with a CKEditor
        // instance, using default configuration.
        CKEDITOR.replace('editor1');
        //bootstrap WYSIHTML5 - text editor
        $(".textarea").wysihtml5();
      });
    </script>
    <script>
      $(function () {
        //Initialize Select2 Elements
        $(".select2").select2();

     
      });
     
     
     
    </script>
    
    <script>
	var app = angular.module('myApp', []);
	app.controller('myCtrl', function($scope, $http){
		
		var domain = "http://localhost:8080/AKNnews/";
		
		$scope.newid = $("#newsid").val();
		$scope.newcate = $("#newscate").val();
		
		$scope.isupload = 0;
		
		$scope.categories = null;
		$scope.catetrigger = 0;
		
		$scope.showtitle ="";
		$scope.titletrigger = 0;
		
		$scope.showdes ="";
		$scope.destrigger = 0;
		
		$scope.showthumbnail = "";
		$scope.thumbtrigger = 0;
		
		$scope.showcontent = "";
		$scope.contenttrigger = 0;
		
		$scope.hasNewsId = function(){
			if($scope.newid < 1) location.href="${pageContext.request.contextPath }/admin/article";
			else{
				
			}
		}
		
		$scope.hasNewsId();
		
		$scope.isLoadingImage = function(){
			$scope.isupload = 1;
		};
		
		$scope.processLoadCategories = function(){
			$http({
                method: "GET",
                url: domain + "api/article/category/news/",
                headers: {
                     'Authorization': 'Basic YXBpOmFrbm5ld3M='
                }
            })
            .success(function (response) {
            	
            	$scope.catetrigger=1;
            	 $scope.categories = response.DATA; 
  
            	$scope.fcate = $scope.categories[0];    	
		    });
		};
		
		
		$scope.loadCategories = function(){
			$scope.displayBox();
			if($scope.catetrigger > 0 && !($scope.categories.length == 0)){	
				return;
			}
			$scope.showcate = $scope.newcate;
			$scope.processLoadCategories();
		};
		
		
		$scope.processLoadTitle = function(){
			$http({
                method: "GET",
                url: domain + "api/article/title/"+$scope.newid,
                headers: {
                     'Authorization': 'Basic YXBpOmFrbm5ld3M='
                }
            })
            .success(function (response) {
            	$scope.titletrigger=1;
            	$scope.showtitle = response.RESPONSE_DATA;	
		    });
			
		};
		$scope.loadTitle = function(){
		
			$scope.displayBox();
			if($scope.titletrigger > 0 && !($scope.showtitle == "")){
				
				return;
			}
			$scope.processLoadTitle();
			
		};
		
		$scope.processLoadDescription = function(){
			$http({
                method: "GET",
                url: domain + "api/article/description/"+$scope.newid,
                headers: {
                     'Authorization': 'Basic YXBpOmFrbm5ld3M='
                }
            })
            .success(function (response) {
            	$scope.destrigger=1;
            	$scope.showdes = response.RESPONSE_DATA;	
		    });
		};
		$scope.loadDescription = function(){
			
			$scope.displayBox();
			if($scope.thumbtrigger > 0 && !($scope.show == "")){
				return;
			}
			$scope.processLoadDescription();
			
		};
		
		$scope.processLoadThumbnail = function(){
			
			$http({
                method: "GET",
                url: domain + "api/article/image/"+$scope.newid,
                headers: {
                     'Authorization': 'Basic YXBpOmFrbm5ld3M='
                }
            })
            .success(function (response) {
            	$scope.thumbtrigger=1;
            	$scope.showthumbnail = response.RESPONSE_DATA;	
            	$("#thum").html("<img src="+domain+"resources/images/news/"+$scope.showthumbnail+" />");
            	
		    });
		};
		
		$scope.loadThumbnail = function(){
			
			$scope.displayBox();
			if($scope.thumbtrigger > 0 && !($scope.showthumbnail == "")){
				return;
			}
			$scope.processLoadThumbnail();
		};
		
		$scope.processLoadContent = function(){
			$http({
                method: "GET",
                url: domain + "api/article/content/"+$scope.newid,
                headers: {
                     'Authorization': 'Basic YXBpOmFrbm5ld3M='
                }
            })
            .success(function (response) {
            	$scope.contenttrigger=1;
            	$scope.showcontent = response.RESPONSE_DATA;	
            	 CKEDITOR.instances["editor1"].setData($scope.showcontent);  	
		    });
		};
		$scope.loadContent = function(){
			
			$scope.displayBox();
			if($scope.contenttrigger > 0 && !($scope.showcontent == "")){
				return;
			}
			$scope.processLoadContent();
		};
		
		$scope.updateCategory = function(){
			var json = {"category":{"id" : $scope.fcate.id},"id" : $scope.newid};
			$http({
                method: "PUT",
                url: domain + "api/article/newscategory/",
                headers: {
                     'Authorization': 'Basic YXBpOmFrbm5ld3M='
                },
                data : JSON.stringify(json)
            })
            .success(function (response) {
            	$scope.showcate = $scope.fcate.name;
		    });
		};
		
		$scope.updateTitle = function(){
			var json = {"title": $scope.title,"id" : $scope.newid};
			$http({
	              method: "PUT",
	              url: domain + "api/article/title/",
	              headers: {
	                  'Authorization': 'Basic YXBpOmFrbm5ld3M='
	              },
	              data : JSON.stringify(json)
	        }).success(function (response) {
	            $scope.processLoadTitle();
			});
		};
		
		$scope.updateDescription = function(){
			var json = {
					"description": $scope.description,
					"id" : $scope.newid
				};
				$http({
	                method: "PUT",
	                url: domain + "api/article/description/",
	                headers: {
	                     'Authorization': 'Basic YXBpOmFrbm5ld3M='
	                },
	                data : JSON.stringify(json)
	            })
	            .success(function (response) {
	            	$scope.processLoadDescription();
			    });
		};
		
		$scope.updateContent = function(){
			var json = {
					"content": CKEDITOR.instances.editor1.getData(),
					"id" : $scope.newid
				};
				$http({
	                method: "PUT",
	                url: domain + "api/article/content/",
	                headers: {
	                     'Authorization': 'Basic YXBpOmFrbm5ld3M='
	                },
	                data : JSON.stringify(json)
	            })
	            .success(function (response) {
	            	alert(1);
			    });
		};
		
		$scope.updateThumbnail = function(){
			
			if($scope.isupload == 0){
				alert("Please Select New Image to Update");
				return;
			}
			 var json = {
				"image": $scope.showthumbnail,
			};
			 var file = $('#newsthumbnail')[0].files[0];
			 if(typeof file === 'undefined'){
				 alert("Please Select New Image to Update");
					return;
			};
				var json={
					  "image": $scope.showthumbnail
					};
				 var formData = new FormData();
			    
			     alert(file+" "+$scope.showthumbnail);
			     formData.append("file", file);
			     formData.append("json",JSON.stringify(json));//important: convert to JSON!
			     $http({
			    		  url: domain + "api/article/image/",
			        method: 'POST',
			        headers: {'Content-Type': undefined , 'Authorization': 'Basic YXBpOmFrbm5ld3M='},
			        data: formData,
			        
			      }).success(function(response) {
				        console.log('Request finished', response);
				        alert(response.MESSAGE);
				     
				  }); 
			
		};
		
		
		
		
		$scope.displayBox = function(){
			  
	    	  $(".dis").css("display","none");
	    	  $(".bdis").attr("class","box collapsed-box bdis");
	    	  $(".iconshow").attr("class","fa fa-plus iconshow");
		};
		$scope.displayBox();
		
	

	});
  
    
    </script>
  
  </body>
</html>
