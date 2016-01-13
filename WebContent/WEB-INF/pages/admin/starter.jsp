<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AKN| Sample</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	
	<%@include file="include/header.jsp" %>

  </head>
  <body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

      
      <%@include file="include/topbar.jsp" %>
      
      <%@include file="include/menubar.jsp" %>
      

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Page Header
            <small>Optional description</small>
          </h1>
		  <!--           
		  <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
            <li class="active">Here</li>
          </ol> 
          -->
        </section>

        <!-- Main content -->
        <section class="content">

          <!-- Your Page Content Here -->
          
          Input content here!

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

	  <%@include file="include/footertext.jsp" %>

	  <%@include file="include/controlsidebar.jsp" %>

    <%@include file="include/footer.jsp" %>
  </body>
</html>
