<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>이런저런</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/common.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
.inner{
    margin-left: 300px;
	}
	#searchForm{
	margin-left: 300px;
	
	}
	.
	.title2#admin_name {
        color: var(--font-color);
        font-family: "Pretendard Variable", sans-serif;
        font-size: 20px;
        font-weight: 700;
    }

	 #catagory {
        color: var(--font-color);
        font-family: "Pretendard Variable", sans-serif;
        font-size: 16px;
        font-weight: 500;
    }
    .fixed-left {
    position: fixed;
    top: 80; /* 화면 상단에 고정 */
    left: 50; /* 화면 왼쪽에 고정 */
    width: 200px; /* 원하는 너비 설정 */
    padding: 10px;
   /* background-color: #f0f0f0;  배경색 설정 */
    border-right: 1px solid #ccc; /* 오른쪽에 구분선 */
    height: 100%; /* 전체 높이 설정 */
    overflow-y: auto; /* 글이 길면 스크롤 가능하도록 설정 */
	}
	.image img {
    width: 50%;  /* 또는 원하는 픽셀 값 */
    height: auto; /* 비율을 유지 */
	}

	
</style>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../header.jsp"/> 
	
	<!-- inner 클래스 하위에 모든 요소들을 넣어서 만드시면 됩니다. -->
		
	<div class="inner">
	
	<p class="title1" >회원정보</p>
	<p class="title1" >${info.nickname}님</p>
	
	
		 <div class="fixed-left">
	    <div class="image">
		    <img class="profile-img" src="resources/img/common/admin_profile.png" alt="관리자 프로필 이미지"/>
	    </div>
	    <p>&nbsp;&nbsp;&nbsp;&nbsp;</p>
	    <p class="title2" id="admin_name">관리자</p>
	    <p>&nbsp;&nbsp;&nbsp;&nbsp;</p>
	    <p class="title3" onclick="location.href='adminMember'"> 회원정보</p>
	    <p>&nbsp;&nbsp;&nbsp;&nbsp;</p>
	    <p class="title3" onclick="location.href='adminReport'">신고</p>
	    <p>&nbsp;&nbsp;&nbsp;&nbsp;</p>
	    <p class="title3" onclick="location.href='adminAsk'">문의하기</p>
	    <p>&nbsp;&nbsp;&nbsp;&nbsp;</p>
	    <p class="title3" onclick="location.href='adminTag'">태그</p>
	    <p>&nbsp;&nbsp;&nbsp;&nbsp;</p>
	    <p class="title3" onclick="location.href='adminIcon'">아이콘</p>
	    <p>&nbsp;&nbsp;&nbsp;&nbsp;</p>
	    <p class="title3" onclick="location.href='adminPopup'">팝업</p>
	    <p>&nbsp;&nbsp;&nbsp;&nbsp;</p>
	    <p class="title3" onclick="location.href='adminCode'">구븐코드</p>
	    <p>&nbsp;&nbsp;&nbsp;&nbsp;</p>
	    <p class="title3" onclick="location.href='adminJoin'">회원가입</p>
	    
	    </div>
		
	 
	  	
				<p class="title2" id="admin_name">카테고리${info.content}</p>
					
			
						
			
				<p class="title2" id="admin_name">정지기간${info.start_date} ~ ${info.end_date}</p>
			
					
			
				
			
				<p class="title2" id="admin_name">정지내용 ${info.ban_content}</p>
			
				
				
			
   	
	<div class="btn01-l" onclick="location.href='memberRightUpdate?id=${info.id}'">수정</div> <!-- 클릭시 색깔변경 -->
	<div class="btn02-l" onclick="location.href='adminMemberDetail?id=${info.id}'">취소</div> <!-- 클릭시 색깔변경 -->
	
	</div>
	
	<!-- 푸터 -->
	<jsp:include page="footer.jsp"/>
</body>



<script>

    
</script>
<script src="resources/js/common.js" type="text/javascript"></script>
<script src="resources/js/layerPopup.js"></script>
</html>