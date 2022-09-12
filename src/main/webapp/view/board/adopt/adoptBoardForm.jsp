<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/petBoardForm.css">
<style>
  .boardImg {
    background-image: url("${ pageContext.request.contextPath }/view/images/banner/adoptBoard.jpg");
    background-position: center;
  }
</style>
  
  <script type="text/javascript">
		function win_upload() {
			const op = "width=500, height=150, left=50, top=150";
			open("${pageContext.request.contextPath}/board/pictureimgForm", "", op);
		}
</script>
</head>
<body>
	<!-- boardImg -->
<div class="boardImg center">
  <div class="box center">
    <h2 class="boardName">입양공고</h2>
    <div class="bar"></div>
    <p>
      입양은 호기심이 아닌 책임입니다.
    </p>
  </div>
</div>
<!-- boardImg -->

<!-- content -->
  <form action="${ pageContext.request.contextPath }/board/adoptBoardPro" name="f" method="post">
  <input type="hidden" name="userId" value="${ sessionScope.userId }"/>
    <section class="content">
      <div class="inner center">

        <div class="contentImg">
        <input type="hidden" name="petImg" value="">
          <img src="${ pageContext.request.contextPath }/view/images/video_cover_pattern.png" alt="img" id="pic">
          <a href="javascript:win_upload()" class="btn">사진넣기</a>
        </div>

        <div class="contentInfo">
          <ul class="center info1">
            <li class="center">
              <span class="name">이름 : </span><input class="petName" name="petName" type="text">
            </li>
            <li class="center">
              <span class="name">종류 : </span>
              <label>
                <input type="radio" name="petType" checked value="0">강아지
              </label>
              <label>
                <input type="radio" name="petType" value="1">고양이
              </label>
            </li>
            <li class="center">
              <span class="name">성별 : </span>
              <label>
                <input type="radio" name="petGender" checked value="0">남아
              </label>
              <label>
                <input type="radio" name="petGender" value="1">여아
              </label>
            </li>
          </ul>

          <ul class="center info1">
            <li class="center">
              <span class="name">특징 : </span><input class="petDetail" name="petDetail" type="text">
            </li>
            <li class="center">
              <span class="name">전화번호 : </span><input  type="number" name="tel" oninput="maxLengthCheck(this)" maxlength="11" placeholder="예) 01012345678" required>
            </li>
          </ul>

          <ul class="info1 center">
            <li class="center">
              <span class="name">중성화 : </span>
              <label>
                <input type="radio" name="neuter" checked value="0">완료
              </label>
              <label>
                <input type="radio" name="neuter" value="1">미완료
              </label>
            </li>
            <li class="center">
              <span class="name">예방접종 : </span>
              <label>
                <input type="radio" name="vaccin" checked value="0">완료
              </label>
              <label>
                <input type="radio" name="vaccin" value="1">미완료
              </label>
            </li>
          </ul>
          
          <ul class="center info1">
            <li class="center">
              <span class="name">위치 : </span><input class="place" name="place" id="roadAddress" type="text" readonly><div onclick="execDaumPostcode()" class="btn">주소검색</div>
            </li>
          </ul>
          <div class="info1 explain">
            <div class="name">상세설명</div>
            <textarea name="content"></textarea>
          </div>

          <div class="center submit">
            <input type="submit" value="게시물 작성" class="btn"> <div class="btn list">목록</div>
          </div>
        </div>

      </div>
    </section>
  </form>
<!-- content -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
      object.value = object.value.slice(0, object.maxLength);
    }    
}

const submitLengthCheck = (form) => {
  const obj = form.tel;

  if(obj.value.length < 11) {
	  alert("전화번호 길이를 확인해주세요.") ;
      obj.focus();
      
      return false;
  }
  
  return true;
}
	
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("roadAddress").value = roadAddr;
              
                //document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                
               <%-- if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }
				--%>
				<%--
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
                --%>
            }
        }).open();
    }
</script>
</body>
</html>