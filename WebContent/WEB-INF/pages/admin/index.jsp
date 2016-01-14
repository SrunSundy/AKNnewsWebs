<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Dashboard</title>
    <!-- Tell the browser to be responsive to screen width -->

	<jsp:include page="import/header.jsp"></jsp:include>
   
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
            Dashboard
            <small>Version 2.0</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Dashboard</li>
          </ol>
        </section>

        <!-- Main content -->
        <!-- Main content -->
        <section class="content">
          <!-- Info boxes -->
          <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-aqua"><i class="ion ion-ios-gear-outline"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">CPU Traffic</span>
                  <span class="info-box-number">90<small>%</small></span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-red"><i class="fa fa-google-plus"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Likes</span>
                  <span class="info-box-number">41,410</span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->

            <!-- fix for small devices only -->
            <div class="clearfix visible-sm-block"></div>

            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-green"><i class="ion ion-ios-cart-outline"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Sales</span>
                  <span class="info-box-number">760</span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-yellow"><i class="ion ion-ios-people-outline"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">New Members</span>
                  <span class="info-box-number">2,000</span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
          </div><!-- /.row -->


          <!-- Main row -->
          <div class="row">
            <!-- Left col -->
            <div class="col-md-12">
            
              <div class="row">
                <div class="col-md-4">
                     <!-- PRODUCT LIST -->
					  <div class="box box-primary">
						<div class="box-header with-border">
						  <h3 class="box-title">RecentRecently Added Products</h3>
						  <div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
							<button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
						  </div>
						</div><!-- /.box-header -->
						<div class="box-body">
						  <ul class="products-list product-list-in-box">
							<li class="item">
							  <div class="product-img">
								<img src="${pageContext.request.contextPath }/resources/dist/img/default-50x50.gif" alt="Product Image">
							  </div>
							  <div class="product-info">
								<a href="javascript::;" class="product-title">Samsung TV <span class="label label-warning pull-right">$1800</span></a>
								<span class="product-description">
								  Samsung 32" 1080p 60Hz LED Smart HDTV.
								</span>
							  </div>
							</li><!-- /.item -->
							<li class="item">
							  <div class="product-img">
								<img src="${pageContext.request.contextPath }/resources/dist/img/default-50x50.gif" alt="Product Image">
							  </div>
							  <div class="product-info">
								<a href="javascript::;" class="product-title">Bicycle <span class="label label-info pull-right">$700</span></a>
								<span class="product-description">
								  26" Mongoose Dolomite Men's 7-speed, Navy Blue.
								</span>
							  </div>
							</li><!-- /.item -->
							<li class="item">
							  <div class="product-img">
								<img src="dist/img/default-50x50.gif" alt="Product Image">
							  </div>
							  <div class="product-info">
								<a href="javascript::;" class="product-title">Xbox One <span class="label label-danger pull-right">$350</span></a>
								<span class="product-description">
								  Xbox One Console Bundle with Halo Master Chief Collection.
								</span>
							  </div>
							</li><!-- /.item -->
							<li class="item">
							  <div class="product-img">
								<img src="${pageContext.request.contextPath }/resources/dist/img/default-50x50.gif" alt="Product Image">
							  </div>
							  <div class="product-info">
								<a href="javascript::;" class="product-title">PlayStation 4 <span class="label label-success pull-right">$399</span></a>
								<span class="product-description">
								  PlayStation 4 500GB Console (PS4)
								</span>
							  </div>
							</li><!-- /.item -->
						  </ul>
						</div><!-- /.box-body -->
						<div class="box-footer text-center">
						  <a href="javascript::;" class="uppercase">View All Products</a>
						</div><!-- /.box-footer -->
					  </div><!-- /.box -->
                </div><!-- /.col -->
				
				
				<div class="col-md-4">
                     <!-- PRODUCT LIST -->
					  <div class="box box-primary">
						<div class="box-header with-border">
						  <h3 class="box-title">Recently Added Products</h3>
						  <div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
							<button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
						  </div>
						</div><!-- /.box-header -->
						<div class="box-body">
						  <ul class="products-list product-list-in-box">
							<li class="item">
							  <div class="product-img">
								<img src="${pageContext.request.contextPath }/resources/dist/img/default-50x50.gif" alt="Product Image">
							  </div>
							  <div class="product-info">
								<a href="javascript::;" class="product-title">Samsung TV <span class="label label-warning pull-right">$1800</span></a>
								<span class="product-description">
								  Samsung 32" 1080p 60Hz LED Smart HDTV.
								</span>
							  </div>
							</li><!-- /.item -->
							<li class="item">
							  <div class="product-img">
								<img src="${pageContext.request.contextPath }/resources/dist/img/default-50x50.gif" alt="Product Image">
							  </div>
							  <div class="product-info">
								<a href="javascript::;" class="product-title">Bicycle <span class="label label-info pull-right">$700</span></a>
								<span class="product-description">
								  26" Mongoose Dolomite Men's 7-speed, Navy Blue.
								</span>
							  </div>
							</li><!-- /.item -->
							<li class="item">
							  <div class="product-img">
								<img src="${pageContext.request.contextPath }/resources/dist/img/default-50x50.gif" alt="Product Image">
							  </div>
							  <div class="product-info">
								<a href="javascript::;" class="product-title">Xbox One <span class="label label-danger pull-right">$350</span></a>
								<span class="product-description">
								  Xbox One Console Bundle with Halo Master Chief Collection.
								</span>
							  </div>
							</li><!-- /.item -->
							<li class="item">
							  <div class="product-img">
								<img src="${pageContext.request.contextPath }/resources/dist/img/default-50x50.gif" alt="Product Image">
							  </div>
							  <div class="product-info">
								<a href="javascript::;" class="product-title">PlayStation 4 <span class="label label-success pull-right">$399</span></a>
								<span class="product-description">
								  PlayStation 4 500GB Console (PS4)
								</span>
							  </div>
							</li><!-- /.item -->
						  </ul>
						</div><!-- /.box-body -->
						<div class="box-footer text-center">
						  <a href="javascript::;" class="uppercase">View All Products</a>
						</div><!-- /.box-footer -->
					  </div><!-- /.box -->
                </div><!-- /.col -->
				
				<div class="col-md-4">
						<div class="info-box bg-yellow">
						<span class="info-box-icon"><i class="ion ion-ios-pricetag-outline"></i></span>
						<div class="info-box-content">
						  <span class="info-box-text">Inventory</span>
						  <span class="info-box-number">5,200</span>
						  <div class="progress">
							<div class="progress-bar" style="width: 50%"></div>
						  </div>
						  <span class="progress-description">
							50% Increase in 30 Days
						  </span>
						</div><!-- /.info-box-content -->
					  </div><!-- /.info-box -->
					  <div class="info-box bg-green">
						<span class="info-box-icon"><i class="ion ion-ios-heart-outline"></i></span>
						<div class="info-box-content">
						  <span class="info-box-text">Mentions</span>
						  <span class="info-box-number">92,050</span>
						  <div class="progress">
							<div class="progress-bar" style="width: 20%"></div>
						  </div>
						  <span class="progress-description">
							20% Increase in 30 Days
						  </span>
						</div><!-- /.info-box-content -->
					  </div><!-- /.info-box -->
					  <div class="info-box bg-red">
						<span class="info-box-icon"><i class="ion ion-ios-cloud-download-outline"></i></span>
						<div class="info-box-content">
						  <span class="info-box-text">Downloads</span>
						  <span class="info-box-number">114,381</span>
						  <div class="progress">
							<div class="progress-bar" style="width: 70%"></div>
						  </div>
						  <span class="progress-description">
							70% Increase in 30 Days
						  </span>
						</div><!-- /.info-box-content -->
					  </div><!-- /.info-box -->
					  <div class="info-box bg-aqua">
						<span class="info-box-icon"><i class="ion-ios-chatbubble-outline"></i></span>
						<div class="info-box-content">
						  <span class="info-box-text">Direct Messages</span>
						  <span class="info-box-number">163,921</span>
						  <div class="progress">
							<div class="progress-bar" style="width: 40%"></div>
						  </div>
						  <span class="progress-description">
							40% Increase in 30 Days
						  </span>
						</div><!-- /.info-box-content -->
					  </div><!-- /.info-box -->
				</div>
				
				

              </div><!-- /.row -->

           
            
            </div><!-- /.col -->
			
            <div class="col-md-12">
              <!-- Info Boxes Style 2 -->
				<div class="row">

                 <div class="col-md-6">
                  <!-- USERS LIST -->
                  <div class="box box-danger">
                    <div class="box-header with-border">
                      <h3 class="box-title">Latest Members</h3>
                      <div class="box-tools pull-right">
                        <span class="label label-danger">8 New Members</span>
                        <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                      </div>
                    </div><!-- /.box-header -->
                    <div class="box-body no-padding">
                      <ul class="users-list clearfix">
                        <li>
                          <img src="${pageContext.request.contextPath }/resources/dist/img/user1-128x128.jpg" alt="User Image">
                          <a class="users-list-name" href="#">Alexander Pierce</a>
                          <span class="users-list-date">Today</span>
                        </li>
                        <li>
                          <img src="${pageContext.request.contextPath }/resources/dist/img/user8-128x128.jpg" alt="User Image">
                          <a class="users-list-name" href="#">Norman</a>
                          <span class="users-list-date">Yesterday</span>
                        </li>
                        <li>
                          <img src="${pageContext.request.contextPath }/resources/dist/img/user7-128x128.jpg" alt="User Image">
                          <a class="users-list-name" href="#">Jane</a>
                          <span class="users-list-date">12 Jan</span>
                        </li>
                        <li>
                          <img src="${pageContext.request.contextPath }/resources/dist/img/user6-128x128.jpg" alt="User Image">
                          <a class="users-list-name" href="#">John</a>
                          <span class="users-list-date">12 Jan</span>
                        </li>
                        <li>
                          <img src="${pageContext.request.contextPath }/resources/dist/img/user2-160x160.jpg" alt="User Image">
                          <a class="${pageContext.request.contextPath }/resources/users-list-name" href="#">Alexander</a>
                          <span class="users-list-date">13 Jan</span>
                        </li>
                        <li>
                          <img src="${pageContext.request.contextPath }/resources/dist/img/user5-128x128.jpg" alt="User Image">
                          <a class="users-list-name" href="#">Sarah</a>
                          <span class="users-list-date">14 Jan</span>
                        </li>
                        <li>
                          <img src="${pageContext.request.contextPath }/resources/dist/img/user4-128x128.jpg" alt="User Image">
                          <a class="users-list-name" href="#">Nora</a>
                          <span class="users-list-date">15 Jan</span>
                        </li>
                        <li>
                          <img src="${pageContext.request.contextPath }/resources/dist/img/user3-128x128.jpg" alt="User Image">
                          <a class="users-list-name" href="#">Nadia</a>
                          <span class="users-list-date">15 Jan</span>
                        </li>
                      </ul><!-- /.users-list -->
                    </div><!-- /.box-body -->
                    <div class="box-footer text-center">
                      <a href="javascript::" class="uppercase">View All Users</a>
                    </div><!-- /.box-footer -->
                  </div><!--/.box -->
                </div><!-- /.col -->
				
				
				    <div class="col-md-6">
                  <!-- USERS LIST -->
                  <div class="box box-danger">
                    <div class="box-header with-border">
                      <h3 class="box-title">Latest Members</h3>
                      <div class="box-tools pull-right">
                        <span class="label label-danger">8 New Members</span>
                        <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                      </div>
                    </div><!-- /.box-header -->
                    <div class="box-body no-padding">
                      <ul class="users-list clearfix">
                        <li>
                          <img src="${pageContext.request.contextPath }/resources/dist/img/user1-128x128.jpg" alt="User Image">
                          <a class="users-list-name" href="#">Alexander Pierce</a>
                          <span class="users-list-date">Today</span>
                        </li>
                        <li>
                          <img src="${pageContext.request.contextPath }/resources/dist/img/user8-128x128.jpg" alt="User Image">
                          <a class="users-list-name" href="#">Norman</a>
                          <span class="users-list-date">Yesterday</span>
                        </li>
                        <li>
                          <img src="${pageContext.request.contextPath }/resources/dist/img/user7-128x128.jpg" alt="User Image">
                          <a class="users-list-name" href="#">Jane</a>
                          <span class="users-list-date">12 Jan</span>
                        </li>
                        <li>
                          <img src="${pageContext.request.contextPath }/resources/dist/img/user6-128x128.jpg" alt="User Image">
                          <a class="users-list-name" href="#">John</a>
                          <span class="users-list-date">12 Jan</span>
                        </li>
                        <li>
                          <img src="${pageContext.request.contextPath }/resources/dist/img/user2-160x160.jpg" alt="User Image">
                          <a class="users-list-name" href="#">Alexander</a>
                          <span class="users-list-date">13 Jan</span>
                        </li>
                        <li>
                          <img src="${pageContext.request.contextPath }/resources/dist/img/user5-128x128.jpg" alt="User Image">
                          <a class="users-list-name" href="#">Sarah</a>
                          <span class="users-list-date">14 Jan</span>
                        </li>
                        <li>
                          <img src="${pageContext.request.contextPath }/resources/dist/img/user4-128x128.jpg" alt="User Image">
                          <a class="users-list-name" href="#">Nora</a>
                          <span class="users-list-date">15 Jan</span>
                        </li>
                        <li>
                          <img src="${pageContext.request.contextPath }/resources/dist/img/user3-128x128.jpg" alt="User Image">
                          <a class="users-list-name" href="#">Nadia</a>
                          <span class="users-list-date">15 Jan</span>
                        </li>
                      </ul><!-- /.users-list -->
                    </div><!-- /.box-body -->
                    <div class="box-footer text-center">
                      <a href="javascript::" class="uppercase">View All Users</a>
                    </div><!-- /.box-footer -->
                  </div><!--/.box -->
                </div><!-- /.col -->
			</div>
           
            </div><!-- /.col -->
          </div><!-- /.row -->
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
  </body>
</html>
