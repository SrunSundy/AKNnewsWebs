
        <!-- Logo -->
        <a href="index2.html" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>A</b>KN</span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>All </b>Khmer News</span>
        </a>

        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
          <!-- Navbar Right Menu -->
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
             
          

              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="http://localhost:8080/AKNnews/resources/images/user/${sessionScope.SessionUser.image}" class="user-image" alt="User Image">
                  <span class="hidden-xs">${sessionScope.SessionUser.username}</span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                    <img src="http://localhost:8080/AKNnews/resources/images/user/${sessionScope.SessionUser.image}" class="img-circle" alt="User Image">
                    <p>
                      ${sessionScope.SessionUser.username}
                      <small>Admin</small>
                    </p>
                  </li>
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="${pageContext.request.contextPath }/admin/admininfo" class="btn btn-default btn-flat">Profile</a>
                    </div>
                    <div class="pull-right">
                      <a href="${pageContext.request.contextPath }/logout" class="btn btn-default btn-flat">Sign out</a>
                    </div>
                  </li>
                </ul>
              </li>
              <!-- Control Sidebar Toggle Button -->
              <li>
                <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears" ></i></a>
              </li>
            </ul>
          </div>

        </nav>
     
    
  