<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
	<%@ include file="css/main.css"%>
	<%@ include file="../common/cookielogin.jsp" %>
</style>
<script src="${ pageContext.request.contextPath }/view/js/main.js" defer></script>
</head>
<body>
	<!-- mainBox - slide & mainText -->
  <div class="mainBox">
    <ul class="slideBox">
      <li class="on" data-index="0"><img src="${ pageContext.request.contextPath }/view/images/slides/slide1.jpg" alt="slide"></li>
      <li data-index="1"><img src="${ pageContext.request.contextPath }/view/images/slides/slide2.jpg" alt="slide"></li>
      <li data-index="2"><img src="${ pageContext.request.contextPath }/view/images/slides/slide3.jpg" alt="slide"></li>
      <li data-index="3"><img src="${ pageContext.request.contextPath }/view/images/slides/slide4.jpg" alt="slide"></li>
      <li data-index="4"><img src="${ pageContext.request.contextPath }/view/images/slides/slide5.jpg" alt="slide"></li>
      <li data-index="5"><img src="${ pageContext.request.contextPath }/view/images/slides/slide6.jpg" alt="slide"></li>
    </ul>

    <div class="mainText">
      <h4>주인님의 냄새가 나요!</h4>
      <h3>절 찾으러 오셨나봐요!</h3>
      <div class="btn">About us</div>
    </div>

    <div class="toLeft">
      <svg width="50" height="50" viewBox="0 0 86 86" fill="none" xmlns="http://www.w3.org/2000/svg">
        <rect x="43" y="85.4264" width="60" height="4" rx="2" transform="rotate(-135 43 85.4264)" fill="#F2EFE9" stroke="#000"/>
        <rect x="45.8284" y="3.40203" width="60" height="4" rx="2" transform="rotate(135 45.8284 3.40203)" fill="#F2EFE9" stroke="#000"/>
      </svg>
    </div>
    <div class="toRight">
      <svg width="50" height="50" viewBox="0 0 86 86" fill="none" xmlns="http://www.w3.org/2000/svg">
        <rect x="43" y="0.573608" width="60" height="4" rx="2" transform="rotate(45 43 0.573608)" fill="#F2EFE9" stroke="#000"/>
        <rect x="40.1716" y="82.598" width="60" height="4" rx="2" transform="rotate(-45 40.1716 82.598)" fill="#F2EFE9" stroke="#000"/>
      </svg>
    </div>
  </div>
  <!-- mainBox - slide & mainText -->

  <!-- subMenu -->
  <ul class="subMenu center">
    <li>
      <div class="pic">
        <svg viewBox="0 0 576 512">
          <path d="M309.6 158.5L332.7 19.8C334.6 8.4 344.5 0 356.1 0c7.5 0 14.5 3.5 19 9.5L392 32h52.1c12.7 0 24.9 5.1 33.9 14.1L496 64h56c13.3 0 24 10.7 24 24v24c0 44.2-35.8 80-80 80H464 448 426.7l-5.1 30.5-112-64zM416 256.1L416 480c0 17.7-14.3 32-32 32H352c-17.7 0-32-14.3-32-32V364.8c-24 12.3-51.2 19.2-80 19.2s-56-6.9-80-19.2V480c0 17.7-14.3 32-32 32H96c-17.7 0-32-14.3-32-32V249.8c-28.8-10.9-51.4-35.3-59.2-66.5L1 167.8c-4.3-17.1 6.1-34.5 23.3-38.8s34.5 6.1 38.8 23.3l3.9 15.5C70.5 182 83.3 192 98 192h30 16H303.8L416 256.1zM464 80c0-8.8-7.2-16-16-16s-16 7.2-16 16s7.2 16 16 16s16-7.2 16-16z"/>
        </svg>
      </div>
      <div class="menuName">
        입양 안내
      </div>
    </li>
    <li>
      <div class="pic">
        <svg viewBox="0 0 576 512">
          <path d="M148 76.6C148 34.3 182.3 0 224.6 0c20.3 0 39.8 8.1 54.1 22.4l9.3 9.3 9.3-9.3C311.6 8.1 331.1 0 351.4 0C393.7 0 428 34.3 428 76.6c0 20.3-8.1 39.8-22.4 54.1L302.1 234.1c-7.8 7.8-20.5 7.8-28.3 0L170.4 130.7C156.1 116.4 148 96.9 148 76.6zM568.2 336.3c13.1 17.8 9.3 42.8-8.5 55.9L433.1 485.5c-23.4 17.2-51.6 26.5-80.7 26.5H192 32c-17.7 0-32-14.3-32-32V416c0-17.7 14.3-32 32-32H68.8l44.9-36c22.7-18.2 50.9-28 80-28H272h16 64c17.7 0 32 14.3 32 32s-14.3 32-32 32H288 272c-8.8 0-16 7.2-16 16s7.2 16 16 16H392.6l119.7-88.2c17.8-13.1 42.8-9.3 55.9 8.5zM193.6 384l0 0-.9 0c.3 0 .6 0 .9 0z"/>
        </svg>
      </div>
      <div class="menuName">
        습득시 안내
      </div>
    </li>
    <li>
      <div class="pic">
        <svg viewBox="0 0 512 512">
          <path d="M226.5 92.9c14.3 42.9-.3 86.2-32.6 96.8s-70.1-15.6-84.4-58.5s.3-86.2 32.6-96.8s70.1 15.6 84.4 58.5zM100.4 198.6c18.9 32.4 14.3 70.1-10.2 84.1s-59.7-.9-78.5-33.3S-2.7 179.3 21.8 165.3s59.7 .9 78.5 33.3zM69.2 401.2C121.6 259.9 214.7 224 256 224s134.4 35.9 186.8 177.2c3.6 9.7 5.2 20.1 5.2 30.5v1.6c0 25.8-20.9 46.7-46.7 46.7c-11.5 0-22.9-1.4-34-4.2l-88-22c-15.3-3.8-31.3-3.8-46.6 0l-88 22c-11.1 2.8-22.5 4.2-34 4.2C84.9 480 64 459.1 64 433.3v-1.6c0-10.4 1.6-20.8 5.2-30.5zM421.8 282.7c-24.5-14-29.1-51.7-10.2-84.1s54-47.3 78.5-33.3s29.1 51.7 10.2 84.1s-54 47.3-78.5 33.3zM310.1 189.7c-32.3-10.6-46.9-53.9-32.6-96.8s52.1-69.1 84.4-58.5s46.9 53.9 32.6 96.8s-52.1 69.1-84.4 58.5z"/>
        </svg>
      </div>
      <div class="menuName">
        동물등록제란?
      </div>
    </li>
    <li>
      <div class="pic">
        <svg viewBox="0 0 512 512">
          <path d="M269.4 2.9C265.2 1 260.7 0 256 0s-9.2 1-13.4 2.9L54.3 82.8c-22 9.3-38.4 31-38.3 57.2c.5 99.2 41.3 280.7 213.6 363.2c16.7 8 36.1 8 52.8 0C454.7 420.7 495.5 239.2 496 140c.1-26.2-16.3-47.9-38.3-57.2L269.4 2.9zM160.9 286.2c4.8 1.2 9.9 1.8 15.1 1.8c35.3 0 64-28.7 64-64V160h44.2c12.1 0 23.2 6.8 28.6 17.7L320 192h64c8.8 0 16 7.2 16 16v32c0 44.2-35.8 80-80 80H272v50.7c0 7.3-5.9 13.3-13.3 13.3c-1.8 0-3.6-.4-5.2-1.1l-98.7-42.3c-6.6-2.8-10.8-9.3-10.8-16.4c0-2.8 .6-5.5 1.9-8l15-30zM160 160h40 8v32 32c0 17.7-14.3 32-32 32s-32-14.3-32-32V176c0-8.8 7.2-16 16-16zm128 48c0-8.8-7.2-16-16-16s-16 7.2-16 16s7.2 16 16 16s16-7.2 16-16z"/>
        </svg>
      </div>
      <div class="menuName">
        동물학대방지
      </div>
    </li>    
  </ul>
  <!-- subMenu -->

  <div class="banner">
    <img src="${ pageContext.request.contextPath }/view/images/banner/banner6.jpg" alt="">
  </div>

  <!-- intro -->
  <section class="intro center">
    <div class="introImg">
    </div>
    <div class="introText center">
      <div class="box center">
        <div class="logo">
          <img src="${ pageContext.request.contextPath }/view/images/logo/dogcat.png" alt="logo">
        </div>
        <p>
          헨젤과 그레텔은 집으로 돌아가기 위해 빵조각을 던졌어요. <br>
        그 빵조각은 단순한 빵조각이 아닌 집으로 돌아가기 위한 희망이었어요. <br> <br>
        헨젤 & 빵조각에서도 반려동물과 그 가족들의 희망이 되어 드릴게요.
        </p>
      </div>
    </div>
  </section>

  <section class="intro center">
    <div class="introText center">
      <div class="box center">
        <div class="logo2">
          <svg viewBox="0 0 512 512">
            <path d="M169.6 291.3C172.8 286.9 179.2 286.9 182.4 291.3C195.6 308.6 223.1 349 223.1 369C223.1 395 202.5 416 175.1 416C149.5 416 127.1 395 127.1 369C127.1 349 156.6 308.6 169.6 291.3H169.6zM368 346.8C377.9 355.6 378.7 370.8 369.9 380.7C361 390.6 345.9 391.4 335.1 382.6C314.7 363.5 286.7 352 256 352C242.7 352 232 341.3 232 328C232 314.7 242.7 304 256 304C299 304 338.3 320.2 368 346.8L368 346.8zM335.6 176C353.3 176 367.6 190.3 367.6 208C367.6 225.7 353.3 240 335.6 240C317.1 240 303.6 225.7 303.6 208C303.6 190.3 317.1 176 335.6 176zM175.6 240C157.1 240 143.6 225.7 143.6 208C143.6 190.3 157.1 176 175.6 176C193.3 176 207.6 190.3 207.6 208C207.6 225.7 193.3 240 175.6 240zM256 0C397.4 0 512 114.6 512 256C512 397.4 397.4 512 256 512C114.6 512 0 397.4 0 256C0 114.6 114.6 0 256 0zM175.9 448C200.5 458.3 227.6 464 256 464C370.9 464 464 370.9 464 256C464 141.1 370.9 48 256 48C141.1 48 48 141.1 48 256C48 308.7 67.59 356.8 99.88 393.4C110.4 425.4 140.9 447.9 175.9 448V448z"/>
          </svg>
        </div>
        <p class="p2">
          반려동물을 잃어버리셨나요? <br>
          보호중 게시판으로 가서 찾아보세요!
        </p>
        <div class="btn">
          보호 게시판
        </div>
      </div>
    </div>

    <div class="introImg2">
    </div>
  </section>
  <!-- intro -->

  <div class="box center">
    <!-- goverment -->
    <section class="goverment">
      <h2>정부주관 공고</h2>

      <ul class="slideBox_gover">
        <li class="on" data-index="0"><img src="${ pageContext.request.contextPath }/view/images/banner/banner.jpg" alt="slide"></li>
        <li data-index="2"><img src="${ pageContext.request.contextPath }/view/images/banner/banner2.jpg" alt="slide"></li>
        <li data-index="3"><img src="${ pageContext.request.contextPath }/view/images/banner/banner3.jpg" alt="slide"></li>
        <li data-index="4"><img src="${ pageContext.request.contextPath }/view/images/banner/banner4.jpg" alt="slide"></li>
        <li data-index="5"><img src="${ pageContext.request.contextPath }/view/images/banner/banner5.png" alt="slide"></li>
      </ul>
    </section>
    <!-- goverment -->

    <!-- familysite -->
    <section class="family">
      <h2>협업 페이지</h2>

      <ul>
        <li><a href="#">동물관리보호시스템</a></li>
        <li><a href="#">동물사랑배움터</a></li>
      </ul>
    </section>
    <!-- familysite -->
  </div>
</body>
</html>