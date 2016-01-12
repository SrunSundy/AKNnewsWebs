<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="include/header.jsp" %>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>sample</title>
</head>
<body>
	<!-- START TOP MENU HEADER -->
	<%@include file="include/topmenu.jsp"%>	
	<!-- END TOP MENU HEADER -->

  <!-- START MAIN -->
  <div id="main">
    <!-- START WRAPPER -->
    <div class="wrapper">

      <!-- START LEFT SIDEBAR NAV-->
      <%@include file="include/leftbar.jsp"%>
      <!-- END LEFT SIDEBAR NAV-->

      <!-- START CONTENT -->
      <section id="content">
        
        <!--breadcrumbs start-->
        <div id="breadcrumbs-wrapper" class=" grey lighten-3">
            <!-- Search for small screen -->
            <div class="header-search-wrapper grey hide-on-large-only">
                <i class="mdi-action-search active"></i>
                <input type="text" name="Search" class="header-search-input z-depth-2" placeholder="Explore Materialize">
            </div>
          <div class="container">
            <div class="row">
              <div class="col s12 m12 l12">
                <h5 class="breadcrumbs-title">Blank Page</h5>
                <ol class="">
                </ol>
              </div>
            </div>
          </div>
        </div>
        <!--breadcrumbs end-->
        
        <!--start container-->
        <div class="container">
          <div class="section">

            <p class="caption">A Simple Blank Page to use it for your custome design and elements.</p>
            <div class="divider"></div>
            
            
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            
            
          </div>
		  <%@include file="include/floatingbutton.jsp" %>
        </div>
        <!--end container-->
      </section>
      <!-- END CONTENT -->      

    </div>
    <!-- END WRAPPER -->

  </div>
  <!-- END MAIN -->
	
	<%@include file="include/footer.jsp" %>
</body>
</html>