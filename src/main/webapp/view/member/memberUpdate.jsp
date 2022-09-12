<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	<%@ include file="../css/member/memberInfo.css"%>
</style>
</head>
<body>
	<div class="wrapper center">
    <!-- memberMenu -->
    <nav class="memberMenu">
      <h2 class="center">마이 페이지</h2>

      <ul>
        <a href="${ pageContext.request.contextPath }/member/memberInfo?boardType=0"><li class="center">내정보</li></a>
        <a href="${ pageContext.request.contextPath }/member/memberUpdate"><li class="center active">정보 수정</li></a>
        <a href="${ pageContext.request.contextPath }/member/memberDelete"><li class="center">회원 탈퇴</li></a>
      </ul>
    </nav>
    <!-- memberMenu -->

    <!-- memberInfo -->
    <section class="memberInfo center">
      
      <ul>
        <form onsubmit="return submitLengthCheck(this)" action="${ pageContext.request.contextPath }/member/memberUpdatePro" method="post">
          <h2>정보 수정</h2>
          <li>
            <span class="name center">아이디</span><input type="text" readonly name="userId" value="${ mem.userId }">
          </li>
          <li>
            <span class="name center">주소</span><input readonly type="text" value="${ mem.address }" id="roadAddress" name="address"><div onclick="execDaumPostcode()" class="btn">주소검색</div>
          </li>
          <li>
            <span class="name center">이메일</span><input type="email" value="${ mem.email }" name="email">
          </li>
          <li>
            <span class="name center">전화번호</span><input  type="number" name="tel" value="${ mem.tel }" oninput="maxLengthCheck(this)" maxlength="11" placeholder="예) 01012345678" required>
          </li>
          <li>
            <span class="name center">반려동물 이름</span><input value="${ mem.petName }" name="petName" type="text">
          </li>
          <li>
            <span class="name center">비밀번호</span><input type="password" name="pwd" required>
          </li>
          <li style="justify-content: center; border-left: 1px solid #ccc;">
            <input class="btn" type="submit" value="수정">
          </li>
        </form>
      </ul>

      <ul>
        <form action="${ pageContext.request.contextPath }/member/memberPwdUpdatePro" method="post" onsubmit="return inputCheck(this)">
          <h2>비밀번호 변경</h2>
          <li>
            <span class="name center">현재 비밀번호</span><input type="password" name="pwd">
          </li>
          <li>
            <span class="name center">변경 비밀번호</span><input type="password" name="chgpwd">
          </li>
          <li>
            <span class="name center">비밀번호 확인</span><input type="password" name="pwdOk">
          </li>
          <li style="justify-content: center; border-left: 1px solid #ccc;">
            <input class="btn" type="submit" value="변경">
          </li>
        </form>
      </ul>
    </section>
    <!-- memberInfo -->
  </div>
  
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

const inputCheck = (form) => {
	if(form.pwd.value == "") {
		alert("비밀번호를 입력하세요.");
		form.pwd.focus();
		return false;
	} else if (form.chgpwd.value != form.pwdOk.value) {
		alert("변경 비밀번호 와 재입력 비밀번호가 일치하지 않습니다.");
		form.pwdOk.value = "";
		form.pwdOk.focus();
		return false;
	} else if (form.pwd.value.length < 8) {
		alert("비밀번호의 자리수를 확인해주세요.");
		form.pwd.focus();
		return false;
	}
	return true;
}

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