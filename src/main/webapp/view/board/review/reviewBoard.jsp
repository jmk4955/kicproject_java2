<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/petBoard.css">
<style>
    .boardImg {
      background-image: url("${ pageContext.request.contextPath }/view/images/banner/adoptBoard.jpg");
      background-position: center;
    }
    <%@ include file="../../../common/cookielogin.jsp" %>
  </style>
</head>
<body>
	<!-- boardImg -->
  <div class="boardImg center">
    <div class="box center">
      <h2 class="boardName">후기</h2>
      <div class="bar"></div>
      <p>
        입양은 호기심이 아닌 책임입니다.
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
                <span class="name">제목 :</span> ${ b.subject }
              </li>
              <li>
                <span class="name">이름 :</span> ${ b.petName }
              </li>
              <li>
                <span class="name">종류 :</span> ${ b.petType == 0 ? "강아지" : "고양이" }
              </li>
              <li>
                <span class="name">작성일 :</span> 2022-09-16
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