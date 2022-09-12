<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/petBoard.css">
</head>
<body>
	<!-- boardImg -->
  <div class="boardImg center">
    <div class="box center">
      <h2 class="boardName">${ boardType == 0 ? "보호중인 동물" : "찾고있는 동물" }</h2>
      <div class="bar"></div>
      <p>
        반려동물도 주인을 그리워하며 기다릴거에요. <br>
        포기하지마세요!
      </p>
    </div>
  </div>
<!-- boardImg -->

<!-- cardBox -->
  <section class="cardBox">
    <div class="inner">
      <div class="cardHeader center">
        <div class="box center">
          <label>
            <input type="radio" name="petType" ${ petType == 0 ? "checked" : "" } onchange="redirect(this)" value="0"> 강아지
          </label>
          <label>
            <input type="radio" name="petType" ${ petType == 1 ? "checked" : "" } onchange="redirect(this)" value="1"> 고양이
          </label>
        </div>
        <a href="${ pageContext.request.contextPath }/board/petBoardForm" class="btn">
          글쓰기
        </a>
      </div>

      <div class="cardList">
      
      	<c:if test="${ boardCount == 0 }">
      		<h2 class="center">아직 게시물이 작성되지 않았습니다.</h2>
      	</c:if>
		
		<c:if test="${ boardCount > 0 }">
		<c:forEach var="b" items="${ list }">
        
          <div class="card">
           <a href="${ pageContext.request.contextPath }/board/petBoardInfo?postId=${ b.postId }">
            <div class="cardImg">
              <img src="${ pageContext.request.contextPath }/view/board/img/${ b.petImg }" alt="img">
            </div>
            <ul class="cardInfo">
              <li>
                <span class="name">이름 :</span> ${ b.petName }
              </li>
              <li>
                <span class="name">종류 :</span> ${ b.petType == 0 ? "강아지" : "고양이" }
              </li>
              <li>
                <span class="name">성별 :</span> ${ b.petGender == 0 ? "여아" : "남아" }
              </li>
              <li>
                <span class="name">특징 :</span> ${ b.petDetail }
              </li>
              <li>
                <span class="name">${ boardType == 0 ? "발견장소" : "분실장소" } :</span> ${ b.place }
              </li>
              <li>
                <span class="name">${ boardType == 0 ? "발견날짜" : "분실날짜" } :</span> ${ b.petDate }
              </li>
              <li>
                <span class="name">작성일 :</span> ${ b.regDate }
              </li>
              <li>
                <span class="name">조회수 :</span> ${ b.readCnt }
              </li>
            </ul>
           </a>
          </div>
        </c:forEach>
        </c:if>

      </div>
    </div>
  </section>
<!-- cardBox -->

<!-- pagination -->
  <div class="modPage center">
    <div class="inner center">
      <a <c:if test="${ start >= 3}" >href="${ pageContext.request.contextPath }/board/petBoard?boardType=${ boardType }&pageNum=${start-3}" class="active"</c:if>>&laquo;</a>
      <c:forEach var="p" begin="${ start }" end="${ end }">
      <a class="active" href="${ pageContext.request.contextPath }/board/petBoard?boardType=${ boardType }&pageNum=${p}&petType=${petType}">${ p }</a>
      </c:forEach>
      <a <c:if test="${ end < maxPage }">href="${ pageContext.request.contextPath }/board/petBoard?boardType=${ boardType }&pageNum=${end + 3}" class="active"</c:if>>&raquo;</a>
    </div>
  </div>
<!-- pagination -->

  <script>
	function redirect(type) {
		window.location.href = '${pageContext.request.contextPath}/board/petBoard?boardType=${sessionScope.boardType}&petType=' + type.value;
	}
  </script>
</body>
</html>