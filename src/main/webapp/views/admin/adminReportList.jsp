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
	/* 전체 페이지 레이아웃 */
	body {
	    display: flex;
	    flex-direction: column;
	    min-height: 100vh;
	    margin: 0;
	}
	
	/* 헤더 스타일 */
	
	
	/* 콘텐츠와 사이드바 감싸는 래퍼 */
	.content-wrapper {
	    display: flex;
	    width: 100%;
	    margin-top: 80px; /* 헤더 높이만큼 여백 */
	    flex-grow: 1; /* 남은 공간 채우기 */
	}
	
	/* 사이드바 스타일 */
	.fixed-left {
	    width: 300px;
	    border-right: 1px solid #ccc;
	    padding: 20px;
	    position: sticky;
	    top: 80px; /* 헤더 아래에 고정 */
	    height: calc(100vh - 80px); /* 화면 높이에 맞추기 */
	    overflow-y: auto;
	}
	.fixed-left p{
	    margin: 15px 0;
	    line-height: 1.5;
	    font-size: 20px;
	}
	
	#admin_name{
	font-weight: 800;
	font-size: 23px;
	}
	
	.image img {
	    width: 35%;  /* 또는 원하는 픽셀 값 */
	    height: auto;
	    margin-bottom: 20px; /* 비율을 유지 */
		}
	/* 메인 콘텐츠 */
	.main-content {
	    flex: 1; /* 남은 공간 채우기 */
	    padding: 20px;
	    overflow: auto;
	}
	.btn02-l{
	margin-top: 0px;
	margin-bottom: 50px;
	}
</style>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../header.jsp"/> 
	
	<!-- inner 클래스 하위에 모든 요소들을 넣어서 만드시면 됩니다. -->
	<div class="content-wrapper">
    <aside class="fixed-left">
        <div class="image">
            <img class="profile-img" src="resources/img/common/admin_profile.png" alt="관리자 프로필 이미지"/>
        </div>
        <p class="title2" id="admin_name">관리자</p>
        <p class="title3" onclick="location.href='adminMember'">회원정보</p>
        <p class="title3" onclick="location.href='adminReport'">신고</p>
        <p class="title3" onclick="location.href='adminAsk'">문의하기</p>
        <p class="title3" onclick="location.href='adminTag'">태그</p>
        <p class="title3" onclick="location.href='adminIcon'">아이콘</p>
        <p class="title3" onclick="location.href='adminPopup'">팝업</p>
        <p class="title3" onclick="location.href='adminCode'">구분코드</p>
        <p class="title3" onclick="location.href='adminJoin'">회원가입</p>
       </aside>
	
   	 <main class="main-content">
		<div class="btn02-l btn-category" data-category="all">전체</div>
		<div class="btn03-l btn-category" data-category="게시글 신고">게시글</div>
		<div class="btn03-l btn-category" data-category="댓글 신고">댓글</div>
	    
	   	 
		<p class="title1" >신고</p>
		 <table>
			<thead>
			<colgroup>
		 		<col width="20%"/>
		 		<col width="20%"/>
		 		<col width="20%"/>
		 		<col width="20%"/>
		 		<col width="20%"/>
		 	</colgroup>
			
			<tr>
				<th>카테고리</th>
				<th>작성자</th>
				<th>처리자</th>
				<th>처리여부</th>
				<th>작성일자</th>
			</tr>
		
		 	<tbody id="list">
		 		
	
		 	</tbody>
			 	<tr>
		         <th colspan="6">
		            <div class="container">
		             <nav aria-label="Page navigation">
		              <ul class="pagination" id="pagination"></ul>
		             </nav>
		            </div>
		         </th>
		      	</tr>
			</table>
	   	 </main>
	</div>
	
	<!-- 푸터 -->
	<jsp:include page="../footer.jsp" />
</body>



<script>
var currentCategory = 'all'; // 기본값 설정
var show = 1; // 기본 페이지 설정

// 페이지 로딩 시 호출
$(document).ready(function () {
    pageCall(show, currentCategory);
});

// 카테고리 버튼 클릭 시 이벤트 처리
$('.btn-category').on('click', function () {
    currentCategory = $(this).data('category'); // 클릭한 버튼의 카테고리 값 가져오기
    show = 1; // 페이지를 초기화
    pageCall(show, currentCategory); // 페이지 호출
});

// 페이지 호출 함수
function pageCall(page, category) {
    $.ajax({
        type: 'GET',
        url: 'adminReportList',
        data: {
            page: page,
            cnt: 15,
            category: category
        },
        dataType: 'JSON',
        success: function (data) {
            console.log(data);
            drawList(data.list);
            $('#pagination').twbsPagination({
                startPage: page,
                totalPages: data.totalPages,
                visiblePages: 10,
                onPageClick: function (evt, page) {
                    pageCall(page, currentCategory);
                }
            });
        },
        error: function (e) {
            console.log(e);
        }
    });
}



	function drawList(list) {
		var content ='';
		 for (var view of list) {
			content +='<tr>';
            content += '<td>'+view.category+'</td>';
			content += '<td><a href="adminReportDetail?report_idx='+view.report_idx+'">'+view.unlike_id+'<a/></td>';
			 var admin_name = view.name ? view.name : '관리자';
			content +='<td>'+admin_name+'</td>';
			var processValue = view.process ? view.process : '미확인';
			content +='<td>'+processValue+'</td>';
			content +='<td>'+view.create_date+'</td>';
			content +='</tr>';
		  }
	      $('#list').html(content);
	   }
	
    
	
    
</script>
<script src="resources/js/common.js" type="text/javascript"></script>
<script src="resources/js/layerPopup.js"></script>
</html>