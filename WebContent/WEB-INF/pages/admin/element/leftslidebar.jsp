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
            <li class="">
              <a href="${pageContext.request.contextPath }/admin/">
                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
              </a>
     
            </li>
        
            
            <li class="treeview">
              <a href="#">
                <i class="fa fa-dashboard"></i> <span>Article Management</span> <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li> <a href="${pageContext.request.contextPath }/admin/article/"><i class="fa fa-key"></i> <span>List Article</span></li>
                <li> <a href="${pageContext.request.contextPath }/admin/addarticle/"><i class="fa fa-key"></i> <span>Add Article</span></li>
              </ul>
            </li>
            
              
            <li class="treeview">
              <a href="${pageContext.request.contextPath }/admin/user/">
                <i class="fa fa-dashboard"></i> <span>User Management</span> <i class="fa fa-angle-left pull-right"></i>
              </a>
            </li>
            
              
            <li class="treeview">
              <a href="${pageContext.request.contextPath }/admin/site/">
                <i class="fa fa-dashboard"></i> <span> Site Management</span> <i class="fa fa-angle-left pull-right"></i>
              </a>
            </li>
              
            <li class="treeview">
              <a href="${pageContext.request.contextPath }/admin/sitedetail/">
                <i class="fa fa-dashboard"></i> <span>SiteDetail Management</span> <i class="fa fa-angle-left pull-right"></i>
              </a>
            </li>
            
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>