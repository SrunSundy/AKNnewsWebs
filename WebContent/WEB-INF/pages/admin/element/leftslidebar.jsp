   <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="${pageContext.request.contextPath }/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
              <p>Alexander Pierce</p>
              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>
      
          <!-- sidebar menu: : style can be found in sidebar.less -->
           <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
          
          	<li><a href="${pageContext.request.contextPath }/admin/"><i class="fa fa-dashboard"></i><span>Dashboard</span></a></li>
          	<li><a href="${pageContext.request.contextPath }/admin/site/"><i class="fa fa-dashboard"></i><span>Site Management</span></a></li>
            <li><a href="${pageContext.request.contextPath }/admin/sitedetail/"><i class="fa fa-dashboard"></i><span>Sitedetail Management</span></a></li>
            <li><a href="${pageContext.request.contextPath }/admin/scrap/"><i class="fa fa-dashboard"></i><span>Scrap Management</span></a></li>
            <li><a href="${pageContext.request.contextPath }/admin/testscrap/"><i class="fa fa-dashboard"></i><span>Scrap Selector</span></a></li>
            <li><a href="${pageContext.request.contextPath }/admin/category/"><i class="fa fa-dashboard"></i><span>Category Management</span></a></li>
            
            <li class="treeview">
              <a href="#">
                <i class="fa fa-pie-chart"></i>
                <span>Article Management</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="${pageContext.request.contextPath }/admin/article/"><i class="fa fa-circle-o"></i> List Article</a></li>
                <li><a href="${pageContext.request.contextPath }/admin/addarticle/"><i class="fa fa-circle-o"></i> Add Article</a></li>
               
              </ul>
            </li>
           
            <li><a href="${pageContext.request.contextPath }/admin/user/"><i class="fa fa-dashboard"></i><span>User Managment</span></a></li>
          
          </ul>
       
        </section>
        <!-- /.sidebar -->
      </aside>