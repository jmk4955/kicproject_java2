<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/petBoardInfo.css">
<style>
    .boardImg {
      background-image: url("${ pageContext.request.contextPath }/view/images/banner/adoptBoard.jpg");
      background-position: center;
    }
  </style>
 <script type="text/javascript">
		const confirmDisable = () => {

			const con = confirm("게시물을 삭제하시겠습니까?");
			if(con) {
				console.log(con);
				location.href = "${ pageContext.request.contextPath }/board/disablePost?postId=${board.postId}";
			} else {
				console.log(con);
				return;
			}
		}
  </script>
  
  <script type="text/javascript">
		function win_report(reportType, postId, repoUserId) {
			const op = "width=500, height=400, left=50, top=150";
			open("${pageContext.request.contextPath}/board/reportForm?postId="+postId+"&boardType=4&reportType="+reportType+"&repoUserId="+repoUserId, "", op);
		}
  </script>
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

<!-- content -->
  <section class="content">
    <div class="inner center">

      <div class="contentHead center">
        <ul class="regDate center">
          <li>
            <span class="name">작성일 : </span>${ board.regDate }
          </li>
        </ul>

        <div class="box center">
        <c:if test="${ sessionScope.userId == board.userId }">
          <a href="${ pageContext.request.contextPath }/board/petBoardUpdate?postId=${board.postId}" class="btn">수정</a>
          <a href="javascript:confirmDisable()" class="btn">삭제</a>
        </c:if>
         <c:if test="${ sessionScope.userId != null }">
			<c:if test="${ sessionScope.userId != board.userId }">
          		<a href="javascript:win_report(1, ${ board.postId }, '${ board.userId }')" class="btn">신고</a>
          	</c:if>
        </c:if>
          <a href="${ pageContext.request.contextPath }/board/petBoard?boardType=${ boardType }&petType=${ board.petType }" class="btn">목록</a>
        </div>
      </div>

      <div class="contentImg">
        <img src="${ pageContext.request.contextPath }/view/board/img/${ board.petImg }" alt="img">
      </div>

      <div class="contentInfo">
        <ul class="center info1">
          <li>
            <span class="name">제목 : </span>${ board.subject }
          </li>
          <li>
            <span class="name">종류 : </span>${ board.petType == 0 ? "강아지" : "고양이" }
          </li>
        </ul>
        
        <ul class="info1">
          <li>
            <span class="name">이름 : </span>${ board.petName }
          </li>
        </ul>
        <div class="info1">
          <div class="name">상세설명</div>
          <textarea readonly>${ board.content }</textarea>
        </div>
      </div>

    </div>
  </section>
<!-- content -->

<!-- comment -->
  <section class="comment">
    <h2>덧글 ${ commCount }</h2>
    <ul class="commentList">
    <c:if test="${ commCount == 0 }">
   	  <li class="center">작성된 덧글이 없습니다.</li>
    </c:if>
    <c:if test="${ commCount > 0 }">
    <c:forEach var="b" items="${ commList }">
      <li style="margin-bottom: 10px;">
        <ul class="commentInfo center">
          <li>
            아이디 : ${ b.userId }
          </li>
          <li class="center">
            작성일 : ${ b.regDate }
            <c:if test="${ sessionScope.userId != null }">
            <div class="btn">신고</div>
            </c:if>
            <c:if test="${ sessionScope.userId == b.userId }">
            <a href="${ pageContext.request.contextPath }/board/deleteComm?commId=${ b.commId }&postId=${b.postId}" class="btn">삭제</a>
            </c:if>
          </li>
        </ul>
        <textarea readonly>${ b.content }</textarea>
      </li>
    </c:forEach>
    </c:if>
    </ul>

    <form action="${ pageContext.request.contextPath }/board/commentPro" method="post" class="center">
      <input type="hidden" name="postId" value="${ board.postId }">
      <input type="hidden" name="userId" value="${ sessionScope.userId }">
      <input type="hidden" name="boardType" value="${ sessionScope.boardType }">
      <textarea name="content" required></textarea>
      <input type="submit" value="작성">
    </form>
  </section>
<!-- comment -->
</body>
</html>