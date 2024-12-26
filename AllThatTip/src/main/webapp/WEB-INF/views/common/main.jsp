<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>

    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
    <link rel="stylesheet" href="resources/css/style_main_search.css">
    <link rel="stylesheet" href="resources/css/style_main_map.css">
    <link rel="stylesheet" href="resources/css/style_main_notice.css">
    <link rel="stylesheet" href="resources/css/style_main_food.css">
    <link rel="stylesheet" href="resources/css/style_footer.css">
    <link rel="stylesheet" href="resources/css/style_header.css">
    <style>
        body{
            font-family: "Arial", "Helvetica", sans-serif;
            padding: 0px;
            margin: 0px;
            background-color: #f9f9f9;
            background-image: url('https://www.carsome.my/news/wp-content/uploads/2022/09/GettyImages-1262230418-1.jpg');
            background-size: 100% 1070px;
            background-repeat: no-repeat;
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>
<body>

        <div id="area">
            <div id="back"></div>
			<jsp:include page="/WEB-INF/views/common/include/header.jsp" />

            <div class="content">

                <div id="main-wrap">

                    <!-- 상단 검색 div 영역 -->
                    <div id="wrap">
                        <div id="main-search">
                            <h2 id="bar-title" style="font-size: 30px;">오늘은 어디로 가볼까?</h2>
            
                            <div id="bar">
                                <div id="bar-1">
                                    <button id="loc-btn">지역별</button> <!-- onclick <a href="캠핑지도"> -->
                                </div>
                                <div id="bar-2">
                                    <form action="검색하기~" method="get">
                                        <input type="text" placeholder="캠핑장 검색" id="loc-search">
                                        <button id="search-btn">찾기</button>
                                    </form>
                                </div>   
                            </div>
            
                            <div id="location">                 
                                <a href="#">#홍천</a>
                                <a href="#">#강릉</a>
                                <a href="#">#충주</a>
                                <a href="#">#경주</a>
                                <a href="#">#해남</a>            
                            </div>
                        </div> 
                            
            
                        <!-- 하단 New & Update 영역 -->
                        <div id="list">
                            <h2 style="display: inline; margin: 40px; color: white;" id="list-title">New & Update</h2>
                            
                            <div id="list-mom">
                                <ul id="li-mom">
                                    <li>
                                        <div id="list-1" class="list-baby" img=""></div>
                                        <h4 id="">좋은캠핑장</h4>   <!--제발 한글 12글자 까지만 넣어주세요 제발요-->
                                        <p id="">ㅎㅇ</p>
                                    </li>
                                    <li>
                                        <div id="list-2" class="list-baby" img=""></div>
                                        <h4 id="">악덕캠핑장</h4>
                                        <p id="">ㅎㅇ</p>
            
                                    </li>
                                    <li>
                                        <div id="list-3" class="list-baby" img=""></div>
                                        <h4 id="">나 제목</h4>
                                        <p id="">ㅎㅇ</p>
                                    </li>
                                    <li>
                                        <div id="list-4" class="list-baby" img=""></div>
                                        <h4 id="">자리채우기</h4>
                                        <p id="">ㅎㅇㅎㅇ</p>
                                    </li>
                                    <li>
                                        <div id="list-5" class="list-baby" img=""></div>
                                        <h4 id="">아~힘들다!</h4>
                                        <p id="">이제그만</p>
                                    </li>
                                </ul>
            
                            </div>
                            <div>
                                
                            </div>
                        </div>
                    </div>  <!-- main-wrap -->
                </div> <!-- wrap -->
                    
                <!--camping map-->
                <div id="camping-map">
                    <div class="campinfo_wrap">
                        <!--kmap-->
                        <div class="kmap">
                            <h2>Camping <span>Map</span></h2>
                            <p class="csub_head">대한민국 캠핑 지도</p>
                            <div class="mapwrap"><img src="resources/img/map/kmap.gif" alt="" usemap="#campMap" id="Map">
                                <map name="campMap" id="campMap">
                                <area shape="poly" onfocus="this.blur()" coords="49,59,51,58,56,55,69,46,78,75,66,75,49,74,51,68,48,59" href="javascript:;" alt='서울' class="kmap_02" />
                                <area shape="poly" onfocus="this.blur()" coords="47,45,47,45,47,39,51,36,51,29,65,14,80,28,89,34,96,41,93,45,95,59,105,71,102,82,103,88,101,95,85,100,75,105,52,99,45,91,42,83,46,74,79,74,68,46,49,59,43,55,43,47" href="javascript:;" alt="경기" class="kmap_031" />
                                <area shape="poly" onfocus="this.blur()" coords="15,53,28,41,42,51,44,58,47,63,51,71,46,73,34,73,22,60,22,54" href="javascript:;" alt="인천" class="kmap_032" />
                                <area shape="poly" onfocus="this.blur()" coords="66,17,92,16,103,17,110,9,128,15,140,1,137,10,159,43,189,91,161,92,142,105,136,93,133,89,125,85,104,93,105,72,98,63,113,59,95,64,91,49,100,40,83,32,78,25,86,27" href="javascript:;" alt="강원" class="kmap_033" />
                                <area shape="poly" onfocus="this.blur()" coords="40,84,26,101,14,116,26,125,23,131,29,138,34,137,38,145,37,148,37,158,49,164,61,159,62,152,76,154,74,146,72,132,76,126,71,118,78,106,56,100,48,100" href="javascript:;" alt="충남" class="kmap_041" />
                                <area shape="poly" onfocus="this.blur()" coords="90,133,72,146,74,153,97,165,91,145,93,133" href="javascript:;" alt="대전" class="kmap_042" />
                                <area shape="poly" onfocus="this.blur()" coords="139,97,130,122,121,124,108,134,110,141,114,145,116,153,110,168,99,168,96,160,94,152,92,141,94,125,82,104,91,100,117,84,133,90" href="javascript:;" alt="충북" class="kmap_043" />
                                <area shape="poly" onfocus="this.blur()" coords="185,93,169,90,153,94,145,105,135,105,124,118,118,126,111,133,109,142,118,154,109,170,120,175,130,180,140,152,162,164,149,190,154,194,178,179,195,183,189,140,192,109,189,98,179,87" href="javascript:;" alt="경북" class="kmap_054" />
                                <area shape="poly" onfocus="this.blur()" coords="147,189,127,188,131,185,132,166,138,149,164,164,145,191" href="javascript:;" alt="대구" class="kmap_053" />
                                <area shape="poly" onfocus="this.blur()" coords="167,187,155,195,185,210,195,181,175,181,166,186" href="javascript:;" alt="울산" class="kmap_052" />
                                <area shape="poly" onfocus="this.blur()" coords="177,201,135,226,137,230,155,243,183,220,182,211" href="javascript:;" alt="부산" class="kmap_051" />
                                <area shape="poly" onfocus="this.blur()" coords="106,172,97,179,93,200,99,218,102,226,110,249,139,247,155,244,139,233,137,223,174,202,159,196,148,188,124,180,107,171" href="javascript:;" alt="경남" class="kmap_055" />
                                <area shape="poly" onfocus="this.blur()" coords="42,160,49,164,59,154,74,152,85,160,109,169,95,182,93,208,76,210,55,198,45,199,33,203,35,189,41,176,45,171,41,168,41,161" href="javascript:;" alt="전북" class="kmap_063" />
                                <area shape="poly" onfocus="this.blur()" coords="1,274,9,284,26,274,33,268,47,275,64,275,77,271,91,262,92,255,107,252,104,230,96,209,76,211,55,198,26,205,38,217,63,210,69,221,65,230,53,230,44,228,43,221,29,206,7,217,8,233,3,252,1,269" href="javascript:;" alt="전남" class="kmap_061" />
                                <area shape="poly" onfocus="this.blur()" coords="44,214,40,218,41,224,47,227,65,230,69,218,58,208,43,213" href="javascript:;" alt="광주" class="kmap_062" />
                                <area shape="poly" onfocus="this.blur()" coords="17,306,26,296,46,289,61,292,52,308,42,312,23,313,17,307" href="javascript:;" alt="제주" class="kmap_064" />
                                <area shape="poly" onfocus="this.blur()" coords="80,101,73,118,77,125,73,135,74,144,93,136,93,124" href="javascript:;" alt="세종" class="kmap_044" />
                                </map>
                            </div>
                        </div>
                        <!--kmap-->
                        <div class="campinfo">
                            <div class="head">
                                <div class="count_box"><span id="total_count">2523</span>개</div>
                                <div class="page_ui">
                                    <a href="#" id="pre_page"><i class="angle_left" aria-hidden="true">이전</i></a>
                                    <div class="pagestat">
                                        <span id="nowpage">1</span>
                                        /
                                        <span id="totalpage">421</span>
                                    </div>
                                    <a href="#" id="next_page"><i class="angle_right" aria-hidden="true">다음</i></a>
                                </div>
                                <div class="select_sido">
                                    <select name="cate1" id="cate1" class="searchSelect">
                                        <option value="전국" selected>전국</option>
                                        <option value="서울">서울</option>
                                        <option value="경기">경기</option>
                                        <option value="인천">인천</option>
                                        <option value="강원">강원</option>
                                        <option value="충남">충남</option>
                                        <option value="대전">대전</option>
                                        <option value="충북">충북</option>
                                        <option value="세종">세종</option>
                                        <option value="부산">부산</option>
                                        <option value="울산">울산</option>
                                        <option value="대구">대구</option>
                                        <option value="경북">경북</option>
                                        <option value="경남">경남</option>
                                        <option value="전남">전남</option>
                                        <option value="광주">광주</option>
                                        <option value="전북">전북</option>
                                        <option value="제주">제주</option>
                                    </select>
                                </div>
                            </div>
                            <div class="camp_right_content">
                                <div class="items hand " onclick="location.href='./?c=camping&m=camping&campID=2918'">
                                    <div class="photo">
                                    <img src="https://www.5gcamp.com/files/camping/2018/10/17/66decf1e7aa7cadf940ce488f2ccb5fa_450.jpg"  alt=""   class="tm" />
                                    </div>
                                    <div class="cont">
                                        <p class="tt">송도 스포츠파크 캠핑장</p>
                                        <p class="mcont">인천 > 연수구 > 송도동</p>
                                    </div>
                                </div>
                                <div class="items hand " onclick="location.href='./?c=camping&m=camping&campID=2639'">
                                    <div class="photo">
                                        <img src="https://www.5gcamp.com/files/camping/2018/01/27/971b6761278a0361231f180bf511ee06_450.jpg"  alt=""   class="tm" />
                                    </div>
                                    <div class="cont">
                                        <p class="tt">잼핑홀리데이 대부도점 </p>
                                        <p class="mcont">경기 > 안산시 > 대부북동</p>
                                    </div>
                                </div>
                                <div class="items hand nomargin" onclick="location.href='./?c=camping&m=camping&campID=4377'">
                                    <div class="photo">
                                        <img src="https://www.5gcamp.com/files/camping/2020/11/08/bc6c758db94efd53c898240b11da6ed1_450.jpg"  alt=""   class="tm" />
                                    </div>
                                    <div class="cont">
                                        <p class="tt">인천 송도 국제캠핑장 </p>
                                        <p class="mcont">인천 > 연수구 > 송도동</p>
                                    </div>
                                </div>
                                <div class="items hand " onclick="location.href='./?c=camping&m=camping&campID=2767'">
                                    <div class="photo">
                                        <img src="https://www.5gcamp.com/files/camping/2018/04/02/5cdc0adfe420749ce1d3cbf4d8e32983_450.jpg"  alt=""   class="tm" />
                                    </div>
                                    <div class="cont">
                                        <p class="tt">대부도 푸른섬 캠핑장 </p>
                                        <p class="mcont">경기 > 안산시 > 대부북동</p>
                                    </div>
                                </div>
                                <div class="items hand " onclick="location.href='./?c=camping&m=camping&campID=329'">
                                    <div class="photo">
                                        <img src="https://www.5gcamp.com/files/camping/2018/01/29/7e285c660c73056271fbddb40b10505d_450.jpg"  alt=""   class="tm" />
                                    </div>
                                    <div class="cont">
                                        <p class="tt">대부도 해솔길 캠핑장 </p>
                                        <p class="mcont">경기 > 안산시 > 대부북동</p>
                                    </div>
                                </div>
                                <div class="items hand nomargin" onclick="location.href='./?c=camping&m=camping&campID=330'">
                                    <div class="photo">
                                        <img src="https://www.5gcamp.com/files/camping/2018/01/22/e6afb0df500ccb6cff58214d232ed738_450.jpg"  alt=""   class="tm" />
                                    </div>
                                    <div class="cont">
                                        <p class="tt">씨엘관광농원 캠핑장 </p>
                                        <p class="mcont">경기 > 안산시 > 대부동동</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="content-3">
                    <section class="slider-section">
                        <h2 class="slider-title">추천 맛집 리스트</h2>
                        <p class="slider-description">
                            올댓트립이 선정한 추천 맛집! 실 후기 기반으로 추천된 리스트입니다.
                        </p>
                
                        <!-- 슬라이더 컨테이너 -->
                        <div class="slider-container">
                            <button class="slider-btn left-btn" onclick="slideLeft()">&#9664;</button>
                            
                            <!-- 카드 리스트 -->
                            <div class="card-wrapper" id="cardWrapper">
                                <div class="card">
                                    <div class="card-image"></div>
                                    <h3 class="card-title">1번맛집</h3>
                                    <p class="card-description">
                                        1번 맛집 상세내용입니다. 1번 맛집 상세내용입니다. 1번 맛집 상세내용입니다.
                                    </p>
                                </div>
                                <div class="card">
                                    <div class="card-image"></div>
                                    <h3 class="card-title">2번 맛집</h3>
                                    <p class="card-description">
                                        2번 맛집 상세내용입니다. 2번 맛집 상세내용입니다. 2번 맛집 상세내용입니다.
                                    </p>
                                </div>
                                <div class="card">
                                    <div class="card-image"></div>
                                    <h3 class="card-title">3번 맛집</h3>
                                    <p class="card-description">
                                        3번 맛집 상세내용입니다. 3번 맛집 상세내용입니다. 3번 맛집 상세내용입니다.
                                    </p>
                                </div>
                                <div class="card">
                                    <div class="card-image"></div>
                                    <h3 class="card-title">4번 맛집</h3>
                                    <p class="card-description">
                                        4번 맛집 상세내용입니다. 4번 맛집 상세내용입니다. 4번 맛집 상세내용입니다.
                                    </p>
                                </div>
                                <div class="card">
                                    <div class="card-image"></div>
                                    <h3 class="card-title">5번 맛집</h3>
                                    <p class="card-description">
                                        5번 맛집 상세내용입니다. 5번 맛집 상세내용입니다. 5번 맛집 상세내용입니다.
                                    </p>
                                </div>
                            </div>
                
                            <button class="slider-btn right-btn" onclick="slideRight()">&#9654;</button>
                        </div>
                
                        <br><br><br>
                        
                        <div>
                            <a href="###" class="card-detail" id="card-detail"> > 자세히보기</a>
                        </div>
                    </section>

                    <!-- 전체 컨테이너 -->
                    <div class="main-container">
                        <!-- 고객센터 카드 -->
                        <div class="card-container">
                            <!-- 왼쪽 섹션 -->
                            <div class="info-section">
                                <h2 class="section-title">고객센터</h2>
                                <p class="main-info">
                                    올댓트립 <span class="phone-number">1234-1234</span>
                                </p>
                                <p class="time-info">
                                    평일: 09:00~18:00<br>
                                    점심: 12:00~13:00<br>
                                    (주말, 공휴일 제외)
                                </p>
                                <div class="menu-section">
                                    <a href="notice.html" class="menu-btn">공지사항</a>
                                    <a href="faq.html" class="menu-btn">FAQ</a>
                                    <a href="qna.html" class="menu-btn">Q&A</a>

                                    
                                </div>
                            </div>
                        </div>

                        <!-- 오른쪽 이미지 섹션 -->
                        <div class="right-banner">
                            <img src="resources/img/main/main.png" alt="이미지추가" class="banner-image">
                        </div>
                    </div>
                </div>

            </div>
         
         <jsp:include page="/WEB-INF/views/common/include/footer.jsp" />
          

    <script>
        onload = function(){
            document.getElementById('campMap').addEventListener('mouseover', (e) => {
                document.getElementById('Map').src = "resources/img/map/" + e.target.className + ".gif";
            })
            document.getElementById('campMap').addEventListener('mouseout', (e) => {
                document.getElementById('Map').src = "resources/img/map/kmap.gif";
            })
        }

        const cardWrapper = document.getElementById('cardWrapper');
        let currentSlide = 0;

        function slideLeft() {
            if (currentSlide > 0) {
                currentSlide--;
            } else {
                currentSlide = cardWrapper.children.length - 1;
            }
            updateSlider();
        }

        function slideRight() {
            if (currentSlide < cardWrapper.children.length - 1) {
                currentSlide++;
            } else {
                currentSlide = 0;
            }
            updateSlider();
        }

        function updateSlider() {
            const cardWidth = cardWrapper.children[0].offsetWidth + 20; // 카드 너비 + 간격
            cardWrapper.style.transform = `translateX(${-currentSlide * cardWidth}px)`;
        }
    </script>
</body>
</html>