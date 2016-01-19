<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Dashboard</title>
    <!-- Tell the browser to be responsive to screen width -->

	<%-- <jsp:include page="import/header.jsp"></jsp:include> --%>
	 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/dist/css/skins/_all-skins.min.css">
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">  
    
       <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
  </head>
  <body class="hold-transition skin-blue sidebar-mini">
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
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Article Management</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
          	
          	<div class="col-md-12">
          	    <!-- Input addon -->
              <div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title">Input Addon</h3>
                </div>
                <div class="box-body">
                	<div class="col-md-12">
                		<div class="col-md-6">
                		 <div class="input-group">
		                    <span class="input-group-addon">Category</span>
		                    <input type="text" class="form-control" placeholder="Username">
		                  </div>
		                  <br>
		                  <div class="input-group">
		                    <span class="input-group-addon">Title</span>
		                    <input type="text" class="form-control" placeholder="Username">
		                  </div>
		                  <br>
		                  <div class="input-group">
		                    <span class="input-group-addon">Descirpiton</span>
		                    <input type="text" class="form-control" placeholder="Username">
		                  </div>
		                  <br>
                		</div>
                		
                		<div class="col-md-6">
                		 <div class="input-group">
		                    <span class="input-group-addon">Category</span>
		                    <input type="text" class="form-control" placeholder="Username">
		                  </div>
		                  <br>
		                  <div class="input-group">
		                    <span class="input-group-addon">Title</span>
		                    <input type="text" class="form-control" placeholder="Username">
		                  </div>
		                  <br>
		                  <div class="input-group">
		                    <span class="input-group-addon">Descirpiton</span>
		                    <input type="text" class="form-control" placeholder="Username">
		                  </div>
		                  <br>
                		</div>
                	
                	</div>
                 
       
         			
         			<div class="col-md-12">
         			 <div class="box box-info">
		                <div class="box-header">
		                  <h3 class="box-title">CK Editor <small>Advanced and full of features</small></h3>
		                  <!-- tools box -->
		                  <div class="pull-right box-tools">
		                    <button class="btn btn-info btn-sm" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
		                    <button class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
		                  </div><!-- /. tools -->
		                </div><!-- /.box-header -->
		                <div class="box-body pad">
		                  <form>
		                    <textarea id="editor1" name="editor1" rows="10" cols="80">
		                                            This is my textarea to be replaced with CKEditor.
		                    </textarea>
		                  </form>
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

<%--   <jsp:include page="import/footer.jsp"></jsp:include> --%>
  
   <!-- jQuery 2.1.4 -->
    <script src="${pageContext.request.contextPath }/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="${pageContext.request.contextPath }/resources/plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="${pageContext.request.contextPath }/resources/dist/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="${pageContext.request.contextPath }/resources/dist/js/demo.js"></script>
    <!-- CK Editor -->
    <script src="${pageContext.request.contextPath }/resources/plugins/ckeditor/ckeditor.js"></script>
    <!-- Bootstrap WYSIHTML5 -->
    <script src="${pageContext.request.contextPath }/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
   <script>
      $(function () {
        // Replace the <textarea id="editor1"> with a CKEditor
        // instance, using default configuration.
        CKEDITOR.replace('editor1');
        //bootstrap WYSIHTML5 - text editor
        $(".textarea").wysihtml5();
      });
    </script>
  
  </body>
</html>
