<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>    

<html lang="en">
<script>
  function fetchPage(name){
    fetch(name).then(function(response){
      response.text().then(function(text){
        document.querySelector('article').innerHTML = text;
      })
    });
  }
  </script>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Food All!! | </title>

    <!-- Bootstrap -->
    <link href="<%=request.getContextPath()%>/resources/bootstrap/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="<%=request.getContextPath()%>/resources/bootstrap/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="<%=request.getContextPath()%>/resources/bootstrap/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="<%=request.getContextPath()%>/resources/bootstrap/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
	
    <!-- bootstrap-progressbar -->
    <link href="<%=request.getContextPath()%>/resources/bootstrap/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="<%=request.getContextPath()%>/resources/bootstrap/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="<%=request.getContextPath()%>/resources/bootstrap/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <!--<link href="<%=request.getContextPath()%>/resources/bootstrap/build/css/custom.min.css" rel="stylesheet">-->
  </head>
<decorator:head/>
 
   <!-- 모든 문서의 내용이 전부 여기 나옵니다.. -->
    

    <!-- jQuery -->
    <script src="<%=request.getContextPath()%>/resources/bootstrap//vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="<%=request.getContextPath()%>/resources/bootstrap//vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="<%=request.getContextPath()%>/resources/bootstrap//vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="<%=request.getContextPath()%>/resources/bootstrap//vendors/nprogress/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="<%=request.getContextPath()%>/resources/bootstrap//vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="<%=request.getContextPath()%>/resources/bootstrap//vendors/gauge.js/dist/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="<%=request.getContextPath()%>/resources/bootstrap//vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="<%=request.getContextPath()%>/resources/bootstrap//vendors/iCheck/icheck.min.js"></script>
    <!-- Skycons -->
    <script src="<%=request.getContextPath()%>/resources/bootstrap//vendors/skycons/skycons.js"></script>
    <!-- Flot -->
    <script src="<%=request.getContextPath()%>/resources/bootstrap//vendors/Flot/jquery.flot.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap//vendors/Flot/jquery.flot.pie.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap//vendors/Flot/jquery.flot.time.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap//vendors/Flot/jquery.flot.stack.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap//vendors/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="<%=request.getContextPath()%>/resources/bootstrap//vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap//vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap//vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="<%=request.getContextPath()%>/resources/bootstrap//vendors/DateJS/build/date.js"></script>
    <!-- JQVMap -->
    <script src="<%=request.getContextPath()%>/resources/bootstrap//vendors/jqvmap/dist/jquery.vmap.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap//vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap//vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="<%=request.getContextPath()%>/resources/bootstrap//vendors/moment/min/moment.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap//vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="<%=request.getContextPath()%>/resources/bootstrap//build/js/custom.min.js"></script>
	
  </body>
</html>
