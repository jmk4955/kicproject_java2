<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/petBoardInfo.css">
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
		function win_report(reportType, reportId, repoUserId) {
			const op = "width=500, height=400, left=50, top=150";
			open("${pageContext.request.contextPath}/board/reportForm?reportId="+reportId+"&boardType=4&reportType="+reportType+"&repoUserId="+repoUserId, "", op);
		}
  </script>
</head>
<body>
	<!-- boardImg -->
  <div class="boardImg center">
    <div class="box center">
      <h2 class="boardName">보호중인 동물</h2>
      <div class="bar"></div>
      <p>
        반려동물도 주인을 그리워하며 기다릴거에요. <br>
        포기하지마세요!
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
          <li>
            <span class="name">조회수 : </span>${ board.readCnt }
          </li>
        </ul>

        <div class="box center">
        <c:if test="${ sessionScope.userId == board.userId }">
          <a href="${ pageContext.request.contextPath }/board/petBoardUpdate?postId=${board.postId}" class="btn">수정</a>
		  <a href="javascript:confirmDisable()" class="btn">삭제</a>
        </c:if>
        <c:if test="${ sessionScope.userId != null}">
          <div class="btn">신고</div>
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
            <span class="name">이름 : </span>${ board.petName }
          </li>
          <li>
            <span class="name">종류 : </span>${ board.petType == 0 ? "강아지" : "고양이" }
            <span class="name">성별 : </span>${ board.petGender == 0 ? "여아" : "남아" }
          </li>
        </ul>

        <ul class="center info1">
          <li>
            <span class="name">특징 : </span>${ board.petDetail }
          </li>
          <li>
            <span class="name">보호자 전화번호 : </span>${ board.tel }
          </li>
        </ul>
        
        <ul class="center info1">
          <li>
            <span class="name">발견장소 : </span>${ board.place }
          </li>
          <li>
            <span class="name">발견날짜 : </span>${ board.petDate }
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