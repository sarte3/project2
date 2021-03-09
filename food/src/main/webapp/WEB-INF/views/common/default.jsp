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

    <title>DietMite</title>

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
    <link href="<%=request.getContextPath()%>/resources/bootstrap/build/css/custom.min.css" rel="stylesheet">
  </head>
<decorator:head/>
   <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="<%=request.getContextPath()%>/index.html" class="site_title"><i class="fa fa-paw"></i> <span>All food</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="<%=request.getContextPath()%>/resources/img/profile.png" alt="..." class="img-circle profile_img">
              </div>
              <c:if test="${name!=null }">
              <div class="profile_info">
                <span>환영합니다</span>
                <h2>${name} 님</h2>
              </div>
              </c:if>
              <c:if test="${name==null }">
              <div class="profile_info">
                <h2>로그인 해주세요</h2>
              </div>
              </c:if>
            </div>
            <!-- /menu profile quick info -->

            <br />
			
			<c:if test="${userid!='admin' }">
            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-table"></i> 식단 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="<%=request.getContextPath()%>/nutrition/e_list">필수영양성분표</a></li>
                      <li><a href="/food/diet/reco_index">식단추천</a></li>
                      <li><a href="index3.html">식단짜기</a></li>
                      <li><a href="index3.html">나의 식단보기</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i> 가격정보 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="form.html">차트현황</a></li>
                      <li><a href="form_advanced.html">모든 품목 가격</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-desktop"></i> 레시피 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="general_elements.html">레시피 보기</a></li>
                      <li><a href="<%=request.getContextPath()%>/nutrition/list">음식 및 식품 영양성분보기</a></li>
                    </ul>
                  </li>  
                  <li><a><i class="fa fa-bar-chart-o"></i> 음식 트렌드 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/food/trend/trend_list">음식 트렌드 차트</a></li>
                      <li><a href="/food/trend/trend_all_list">모든 트렌드 현황 확인</a></li>
                      <!--  <li><a href="morisjs.html">Moris JS</a></li>
                      <li><a href="echarts.html">ECharts</a></li>
                      <li><a href="other_charts.html">Other Charts</a></li>-->
                    </ul>
                  </li>
                  <li><a><i class="fa fa-clone"></i>Layouts <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="fixed_sidebar.html">Fixed Sidebar</a></li>
                      <li><a href="fixed_footer.html">Fixed Footer</a></li>
                    </ul>
                  </li>
                </ul>
              </div>
              <div class="menu_section">
                <h3>Live On</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-bug"></i> Additional Pages <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="e_commerce.html">E-commerce</a></li>
                      <li><a href="projects.html">Projects</a></li>
                      <li><a href="project_detail.html">Project Detail</a></li>
                      <li><a href="contacts.html">Contacts</a></li>
                      <li><a href="profile.html">Profile</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-windows"></i> Extras <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="page_403.html">403 Error</a></li>
                      <li><a href="page_404.html">404 Error</a></li>
                      <li><a href="page_500.html">500 Error</a></li>
                      <li><a href="plain_page.html">Plain Page</a></li>
                      <li><a href="login.html">Login Page</a></li>
                      <li><a href="pricing_tables.html">Pricing Tables</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-sitemap"></i> Multilevel Menu <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                        <li><a href="#level1_1">Level One</a>
                        <li><a>Level One<span class="fa fa-chevron-down"></span></a>
                          <ul class="nav child_menu">
                            <li class="sub_menu"><a href="level2.html">Level Two</a>
                            </li>
                            <li><a href="#level2_1">Level Two</a>
                            </li>
                            <li><a href="#level2_2">Level Two</a>
                            </li>
                          </ul>
                        </li>
                        <li><a href="#level1_2">Level One</a>
                        </li>
                    </ul>
                  </li>                  
                  <li><a href="javascript:void(0)"><i class="fa fa-laptop"></i> Landing Page <span class="label label-success pull-right">Coming Soon</span></a></li>
                </ul>
              </div>

            </div>
            <!-- /sidebar menu -->
			</c:if>
			
			<!-- 관리자 페이지 -->
			<c:if test="${userid=='admin' }">
            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>관리자 페이지</h3>
                <ul class="nav side-menu">
                  <li><a href="/food/admin/main"><i class="fa fa-home"></i>홈</a>
                  </li>
                  <li><a><i class="fa fa-edit"></i>공지사항<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/food/admin/notice_list">공지사항 리스트</a></li>
                      <li><a href="/food/admin/notice_write">공지사항 입력</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-user"></i>회원 관리<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/food/admin/member_list">회원 리스트</a></li>
                      <li><a href="/food/admin/member_write">회원 입력</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-table"></i>음식 관리<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/food/admin/food_list">음식 리스트</a></li>
                      <li><a href="/food/admin/food_write">음식 입력</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-bar-chart-o"></i>트렌드 관리<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/food/admin/trend_list">트렌드 리스트</a></li>
                      <li><a href="/food/admin/trend_write">트렌드 입력</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-clone"></i>레시피 관리<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/food/admin/recipe_list">레시피 리스트</a></li>
                      <li><a href="/food/admin/recipe_write">레시피 입력</a></li>
                    </ul>
                  </li>
                </ul>
              </div>
            </div>
            <!-- /sidebar menu -->
			</c:if>
			
            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
              <c:if test="${userid==null}">
                <li><a href="<%=request.getContextPath()%>/member/login">로그인</a></li>
                <li><a href="<%=request.getContextPath()%>/member/member">회원가입</a></li>
              </c:if>
              <c:if test="${userid!=null}">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="<%=request.getContextPath()%>/resources/img/profile.png" alt="">${name }
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="<%=request.getContextPath()%>/member/mypage">마이페이지</a></li>
                    <li><a href="javascript:;">도움말</a></li>
                    <li><a href="<%=request.getContextPath()%>/member/logout"><i class="fa fa-sign-out pull-right"></i>로그 아웃</a></li>
                  </ul>
                </li>
				</c:if>
                
              </ul>
            </nav>
          </div>
        </div>
<decorator:body/>
<!-- 모든 문서의 내용이 전부 여기 나옵니다.. -->
    <!-- jQuery -->
    <script src="<%=request.getContextPath()%>/resources/bootstrap//vendors/jquery/dist/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
	
	<!-- 자동완성 -->
	<script src="/food/resources/js/autocomplete.js"></script>
   </body>

</html>

