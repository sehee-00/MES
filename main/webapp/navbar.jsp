<!-- 사이드와 nav menu  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--jquery-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" 
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

        <!--bootstrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="sidemenu.css?after">
        <link rel="stylesheet" href="navbar.css?after">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
        
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
        
        <meta charset="UTF-8"/>
    </head>
    <body id="menup">
    	<nav class="navbar navbar-default">
            <div class="container-fluid">
              <div class="navbar-header row">
                <div class="col-md-8">
                    <a class="navbar-brand" id="menuicon">
                    <span class="glyphicon glyphicon-menu-hamburger"></span>
                    </a>
                </div>
                <div id="userinfo" class="col-md-4">
                    <a class="navbar-text" id="user">
                        (User)님 반갑습니다
                    </a>
                    <a href="#" class="navbar-text" id="useralarm"><span id="useralarmicon" class="glyphicon glyphicon-comment"></span>
                        <span id="useralarmicon2" class="badge">n</span></a>
                </div>
              </div>
            </div>
          </nav>
          
          
          <script>
               $("#menuicon").click(function(){
                $(this).toggleClass("foldmenu");

                if($(this).hasClass("foldmenu")){
                    $("#sidemenu").animate({left:"-250px"}, 500);
                    $(".glyphicon-menu-hamburger").animate({left:"-250px"}, 500);
                    $("#pframe").animate({"margin-left":"-=250px", "width": "1860px"}, 500);
                }
                else{
                    $("#sidemenu").animate({left:"0px"}, 500);
                    $(".glyphicon-menu-hamburger").animate({left:"0px"}, 500);
                    $("#pframe").animate({"margin-left":"+=250px", "width":"1610px"}, 500);                   
                }
            })
            
             $(document).ready(function(){
                $("#sidemenu").hover(function(){
                    if($("#menuicon").hasClass("foldmenu")){
                        $("#sidemenu").animate({left:"0px"}, 500);
                    }
                },
                function(){
                    if($("#menuicon").hasClass("foldmenu")){
                        $("#sidemenu").animate({left:"-250px"}, 500);
                    }
                }
            );
            })
          </script>
    
        <aside id="sidemenu" class="sidebar">
            <div id="ptitle"><h3 style="font-weight: bold;">형제테크(주)</h3></div>
            <div id="psubtitle"><h4>MES</h4></div>

            <ul>
                <div class="accordion" id="accordion2">
                <li>
                    <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                        영업 관리
                        </a>
                    </div>

                    <ul>
                    <div id="collapseOne" class="accordion-body collapse"> <!--열려있기 바라면 class에 in-->
                        <li>
                        <div class="accordion-inner">
                        견적서 관리
                        </div>
                        </li>

                        <li>
                        <div class="accordion-inner">
                        수주 관리
                        </div>
                        </li>
                    </div>
                    </ul>
                    </div>
                </li>

                <li>
                    <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
                        생산 관리
                        </a>
                    </div>
                    
                    <ul>
                    <div id="collapseTwo" class="accordion-body collapse">
                        <li>
                        <div class="accordion-inner">
                        생산 진행 관리
                        </div>
                        </li>

                        <li>
                        <div class="accordion-inner">
                        진척 현황
                        </div>
                        </li>
                    </div>
                    </ul>
                    </div>
                </li>
                
                <li>
                    <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">
                        작업 관리
                        </a>
                    </div>

                    <ul>
                    <div id="collapseThree" class="accordion-body collapse">
                        <li>
                        <div class="accordion-inner">
                        전체작업일보
                        </div>
                        </li>

                        <li>
                        <div class="accordion-inner">
                        나의작업일보
                        </div>
                        </li>

                        <li>
                        <div class="accordion-inner">
                        외주작업일보
                        </div>
                        </li>

                        <li>
                        <div class="accordion-inner">
                        불량 관리
                        </div>
                        </li>

                        <li>
                        <div class="accordion-inner">
                        게시판
                        </div>
                        </li>
                    </div>
                    </ul>

                    </div>
                </li>
                    
                <li>
                    <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseFour">
                        자재 제품 관리
                        </a>
                    </div>

                    <ul>
                    <div id="collapseFour" class="accordion-body collapse">

                        <li>
                        <div class="accordion-inner">
                        부품 관리
                        </div>
                        </li>

                        <li>
                        <div class="accordion-inner">
                        자재 관리
                        </div>
                        </li>

                        <li>
                        <div class="accordion-inner">
                        자재 현황 조회
                        </div>
                        </li>
                    </div>
                    </ul>

                    </div>
                </li>

                <li>
                    <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseFive">
                        발주입고 관리
                        </a>
                    </div>

                    <ul>
                    <div id="collapseFive" class="accordion-body collapse">

                        <li>
                        <div class="accordion-inner">
                        발주 관리
                        </div>
                        </li>

                        <li>
                        <div class="accordion-inner">
                        외주 관리
                        </div>
                        </li>

                        <li>
                        <div class="accordion-inner">
                        입출고 관리
                        </div>
                        </li>
                    </div>
                    </ul>

                    </div>
                </li>
                    
                <li>
                    <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseSix">
                        Dashboard
                        </a>
                    </div>

                    <ul>
                    <div id="collapseSix" class="accordion-body collapse">

                        <li>
                        <div class="accordion-inner">
                        작업자별 실적 현황
                        </div>
                        </li>
                        
                        <li>
                        <div class="accordion-inner">
                        수주별 작업공수표
                        </div>
                        </li>

                        <li>
                        <div class="accordion-inner">
                        계획대비<br>실적원가분석
                        </div>
                        </li>

                        <li>
                        <div class="accordion-inner">
                        불량현황
                        </div>
                        </li>

                        <li>
                        <div class="accordion-inner">
                        PQCD 현황
                        </div>
                        </li>

                        <li>
                        <div class="accordion-inner">
                        설비 가동 현황
                        </div>
                        </li>

                        <li>
                        <div class="accordion-inner">
                        외주 비용 현황
                        </div>
                        </li>

                        <li>
                        <div class="accordion-inner">
                        소모품 현황
                        </div>
                        </li>
                        
                    </div>
                    </ul>

                    </div>
                </li>

                <li>
                    <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseSeven">
                        기준정보 관리
                        </a>
                    </div>

                    <ul>
                    <div id="collapseSeven" class="accordion-body collapse">

                        <li>
                        <div class="accordion-inner">
                        공통코드 관리
                        </div>
                        </li>

                        <li>
                        <div class="accordion-inner">
                        업체 관리
                        </div>
                        </li>

                        <li>
                        <div class="accordion-inner">
                        표준공정 관리
                        </div>
                        </li>

                        <li>
                        <div class="accordion-inner">
                        설비 관리
                        </div>
                        </li>
                    </div>
                    </ul>

                    </div>
                </li>

                <li>
                    <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseEight">
                        Admin
                        </a>
                    </div>

                    <ul>
                    <div id="collapseEight" class="accordion-body collapse">
                        <li>
                        <div class="accordion-inner">
                        사용자 관리
                        </div>
                        </li>

                        <li>
                        <div class="accordion-inner">
                        사용자 메뉴 관리
                        </div>
                        </li>
                    </div>
                    </ul>

                    </div>
                </div>
                </li>

            </ul>
        </aside>
    </body>
</html>