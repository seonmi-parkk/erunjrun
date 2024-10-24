<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CrewDetail</title>
<link rel="stylesheet" href="/resources/css/crew.css">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	.innerr {
	    max-width: 1300px;
	    margin: 80px auto 0;
	    display: flex;                  
	    justify-content: space-between; 
	    align-items: flex-start;        
	    gap: 20px;                      
	}
	
	.one {
	    width: 70%;                     
	    padding: 20px;                  
	    box-sizing: border-box;          
	    /* background-color: #D5D5D5; */
	    position: relative;              /* 기본 요소 배치를 유지 */
	    z-index: 1;                      /* 다른 요소들 위에 놓기 */
	}
	
    .two {
        width: 30%;
        padding: 20px;
        box-sizing: border-box;
/*         background-color: #FFD9EC; */
        position: relative;
        max-height: 500px;
        overflow-y: hidden;
        position: sticky;
        top: 100px;
        z-index: 80;
        display: flex;
        flex-direction: column;
        justify-content: space-between; /* 자식 요소들이 위아래로 배치되도록 설정 */
    }
	
	.layoutbox {
	    height: 90px;                  /* 이 높이와 동일한 값을 .two의 top에 설정 */
	    background-color: white;        /* 헤더 영역이 배경과 겹치지 않도록 배경색 추가 */
	}
	
	#imgbox{
		width : 100%;
		height: 400px;
		border-radius: 10px;
	}
	
	.btn03-s1{
		display: inline-block;
	    height: 32px;
	    padding: 6px 11px;
	    margin: 10px 4px;
	    border-radius: 10px;
	    border: 1px solid var(--btn-bd-g);
	    color: var(--btn-bd-g);
	    background: #fff;
	    cursor: pointer;
	    font-size: 14px;
	    float: inline-end; /* 오른쪽 끝으로 배치 */
	    
	}
	
	.btn03-s2{
		display: inline-block;
	    height: 32px;
	    padding: 0px 11px;
	    margin: 0px 4px;
	    border-radius: 10px;
	    border: 1px solid var(--btn-bd-g);
	    color: var(--btn-bd-g);
	    background: #fff;
	    cursor: pointer;
	    font-size: 14px;
	    float: inline-end; /* 오른쪽 끝으로 배치 */
	    margin-right: 10px;
	}

    .title2-1 {
        color: var(--main-color);
        font-family: "Pretendard Variable", sans-serif;
        font-size: 20px;
        font-weight: 500;
        display: inline-block;
   		width: 200px;
   		padding: 16px 11px 6px 3px;
    }
    
    .title2-2{
    	color: var(--main-color);
        font-family: "Pretendard Variable", sans-serif;
        font-size: 20px;
        font-weight: 500;
        display: inline-block;
   		width: 200px;
   		padding: 0px 11px 0px 6px;
   		position: relative; /* 상대적인 위치 설정 */
   		bottom: 3px;
    }
    
    .contentbox{
    	width: 100%;
   		padding: 6px 18px;
   		line-height: 30px;
    }
    
    .right-x{
    	float: inline-end;
    	margin: 15px 3px;
    }
    
    .right-x1{
    	float: inline-end;
    	margin: 10px 12px;
    }
    
    .title1-1 {
        color: var(--font-color);
        font-family: "GmarketSans", sans-serif;
        font-size: 25px;
        font-weight: 700;
        padding: 10px 0px 10px;
    }
    
    .fixbox {
	    position: sticky;                /* 이 부분은 고정 */
	    top: 0;                          /* 상단에 고정 */
/* 	    background-color: #FFD9EC;        *//* 스크롤 시 배경이 덮이지 않도록 설정 */
    	z-index: 10;
	}
	
	.scrollable-content {
	    max-height: 300px;               /* 스크롤할 영역의 최대 높이 설정 */
	    overflow-y: auto;                /* 이 부분만 스크롤 가능하게 설정 */
	    margin-top: 20px;                /* 위쪽 고정 영역과의 간격 */
	    
	    margin: 0;
        padding: 0;
        border: 0;
        font-size: 16px;
        font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
        vertical-align: baseline;
        box-sizing: border-box;
        color: var(--font-color);
	    
	    
	    
	}

    .btn-box {
/*         background-color: #FFD9EC; */
        padding: 10px;
        text-align: center;
    }
    
    .profilebox{
    	border: 1px solid var(--btn-bd-g);
    	border-radius: 7px;
    	height: 55px;
    	width: 98%;
    	display: flex;   
    	align-items: center;
    	justify-content: space-between;
    	background: #fff;
    	display: flex; /*수직 정렬 flex, center*/
    	align-items: center; 
    }
    
    .profile-text{
    	margin-left: 10px; 
    	/* display: flex; */ /*수직 정렬 flex, center*/
    	/* align-items: center;  */
    }
    
	.crew-box {
		padding: 25px 0px 0px 12px;
	    height: 40px;
	    width: 100%; /* 가로 100%로 설정 */
	    display: flex;
	    align-items: center;
	    justify-content: space-between; /* 버튼은 왼쪽, 하트는 오른쪽 끝에 위치 */
	}
	
	.btn01-l2 {
	    margin: 0 auto; /* 버튼을 중앙에 배치 */
	    padding: 10px 20px;
	    cursor: pointer;
	    
	    display: inline-block;
        padding: 12px 30px 30px;
        height: 48px;
        border: 1px solid var(--main-color);
        border-radius: 10px;
        background: var(--main-color);
        color: #fff;
        cursor: pointer;
        justify-content: center;
        margin-left: 28px;
	}
	
	.textSpan{
		margin: 0;
	    padding: 0;
	    border: 0;
	    font-size: 16px;
	    font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
	    vertical-align: baseline;
	    box-sizing: border-box;
	    color: var(--font-color);
	}
	
	.one .imglayout{
		margin-right: 10px;
		margin-bottom: -2px;
	}
 
	.btn02-s1 {
    	 display: inline-block;
         height: 32px;
         padding: 8px 11px;
         margin: 0 4px;
         border-radius: 10px;
         border: 1px solid var(--main-color);
         color: var(--main-color);
         background: #fff;
         cursor: pointer;
         font-size: 14px;
	}
	
	.profile-text img {
 	   margin-right: 13px; /* 이미지 오른쪽에 간격 */
	}
	
	.profile-text{
		writing-mode: horizontal-tb;
		flex-direction: column; /*세로로 이상하게 되면 가로로 다시 돌림*/
	}
	
	.profile-text {
    
    flex-wrap: nowrap; /* 아이템을 한 줄로 배치하고 줄바꿈 방지 */
    overflow-x: auto;  /* 아이템이 너무 많으면 가로 스크롤 추가 */
    
    justify-content: flex-start; /* 아이템을 가로로 시작점에 정렬 */
}


	.profile-text > div {
	    margin-right: 30px; /* 각 크루원 정보 블록 사이 간격 추가 */
	}
	
	.testeee{
		margin-left: 10px;
		display: flex;  /*수직 정렬 flex, center*/
    	align-items: center;  
    	padding: 9px 0px 0px 0px;
	}
	
	.leaderjb{
		display: flex;  /*수직 정렬 flex, center*/
    	align-items: center;  
	}
	
	.leaderjb > img{
		
	}
	
 	.testeee > img{
 		
 	}
  
</style>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<input type="hidden" name="crew_idx" value="52"/>
	
	<div class="layoutbox"></div>
	
	<div class="innerr">
		<div class="one">
			<div id="imgbox">
				<img id="crew-img" src="/resources/img/crew/crewImg800.png" width="100%" height="100%"/>
			</div>
	
			<button class="btn03-s1">수정하기</button>
			<button class="btn03-s1">크루삭제</button>
	
			<div class="title2-1">크루소개</div>
	
			<div class="contentbox" id="crew-content">
				<!-- 크루 소개 내용이 여기에 표시됩니다. -->
			</div>
	
			<div class="title2-1">안내사항</div>
	
			<div class="contentbox">
				<p><img src="/resources/img/crew/img01.png" width="10px" class="imglayout" /> <span id="crew-address"></span></p>
				<p><img src="/resources/img/crew/img02.png" width="13px" class="imglayout"/> <span id="crew-member"></span> 명</p>
				<p><img src="/resources/img/crew/img03.png" width="14px" class="imglayout"/> 매주 <span id="crew-days"></span></p>
				<p><img src="/resources/img/crew/img04.png" width="14px" class="imglayout"/> <span id="crew-minute"></span> 분 / <span id="crew-distance"></span> km</p>
			</div>
	
			<div class="title2-1">크루 공지사항</div>
			<div class="right-x">
				<img src="/resources/img/crew/img07.png" width="40px"/> 
				<span class="right-x1"><a href="#">바로가기</a></span>
			</div>
			<div class="contentbox">
				<img src="/resources/img/crew/img05.png" width="17px" class="imglayout"/> 최근 공지사항 yyyy.mm.dd
			</div>
	
			<div class="title2-1">크루 채팅방</div>
			<div class="right-x">
				<img src="/resources/img/crew/img07.png" width="40px" /> 
				<span class="right-x1"><a href="#">바로가기</a></span>
			</div>
			<div class="contentbox">
				<span><img src="/resources/img/crew/img06.png" width="17px" class="imglayout"/> 마지막 대화 n 분 전</span>
			</div>
		</div>

		<div class="two">
			<div class="fixbox">
				<div>
					<img src="/resources/img/crew/img08.png" width="14px" /> 
					<span class="title2-2" id="crew-location"></span>
				</div>
				
				<div class="title1-1" id="crew-name"></div>
				
				<div class="profilebox">
					<span class="profile-text" id="leaderprofile"></span> <!-- 크루장 정보 -->
					<button class="btn03-s2">크루관리</button>
				</div>
			</div>
			
		    <div class="scrollable-content" id="crew-member">
				<span class="profile-text" id="crew-member-profile"></span> <!-- 크루원 정보 -->
		    </div>
		    
		    <div class="btn-box">
		    
		    	<div class="crew-box">
			    	<button class="btn01-l2">러닝크루 신청하기</button>
			    	
			    	<div class="btn-like btn02-s1" onclick="like()">
			           	<c:choose>
				           	<c:when test="${result.isLiked eq false}">
				           		<img src="resources/img/common/ico_heart_no_act.png" alt="좋아요비활성">
			           		</c:when>
			           		<c:otherwise>
				          		<img src="resources/img/common/ico_heart_act.png" alt="좋아요활성">				           			
			        		</c:otherwise>
		           		</c:choose>
		           	</div>
		    	</div>
		    </div>

		</div>
	
	</div>
	
	<div class="layoutbox"></div>
	
	<jsp:include page="../footer.jsp"/>
</body>
<script>

	$(document).ready(function () {
	    var crew_idx = $('input[name="crew_idx"]').val();
	    
	    console.log('crew_idx =>', crew_idx);
	    
	    crewDetail();
	    
	    crewMemberList();
	
	    function crewDetail() {
	        console.log('크루 데이터 요청');
	        
	        $.ajax({
	            type: 'POST',
	            url: '/crew/detail',
	            data: { 'crew_idx': crew_idx },
	            dataType: 'JSON',
	            success: function (response) {
	                console.log('데이터 받아옴 => ', response);
	                if (response.success) {
	                    // 받아온 데이터를 HTML에 반영
	                    var result = response.result;
	
	                    // 이미지 업데이트
	                    if (result.img_new) {
	                        $('#crew-img').attr('src', '/photo/' + result.img_new);
	                    }
	                    var day = result.days; // 예: "mon"
	
		                // replace를 사용해서 변환
		                day = day.replace('mon', '월')
		                         .replace('tue', '화')
		                         .replace('wen', '수')
		                         .replace('thu', '목')
		                         .replace('fri', '금')
		                         .replace('sat', '토')
		                         .replace('sun', '일');
	
	                    // 크루명, 소개, 안내사항 등 업데이트
	                    $('#crew-name').text(result.crew_name);
	                    $('#crew-content').html(result.content);
	                    $('#crew-address').text(result.address);
	                    $('#crew-member').text(result.member);
	                    $('#crew-days').text(day);
	                    $('#crew-minute').text(result.minute);
	                    $('#crew-distance').text(result.distance);
	                    $('#crew-location').text(result.shortsido + ' ' + result.sigungu);
	                    
	                    
	                }
	            },
	            error: function (e) {
	                console.log('에러 발생 => ', e);
	            }
	        });
	    }
	    
	    function crewMemberList(){
			console.log('크루 회원 리스트 요청');
	        
	        $.ajax({
	            type: 'POST',
	            url: '/crew/memberList',
	            data: { 'crew_idx': crew_idx },
	            dataType: 'JSON',
	            success: function (response) {
	                console.log('회원 데이터 받아옴 => ', response);
	                if (response.success) {
	                	
	                    var result = response.result;
	                    
	                    var leader = '';
	                    
	                    var content = '';
	                    var profileImg = '<img src="resources/img/common/profile.png" width="32px"/>';
	                    
	                    var genderImg = '';
	                    
	                    result.forEach(function(item, idx){
	                    	
	                    	if(item.gender === '남'){
	                    		genderImg = '<img src="resources/img/common/ico_male.png" width="9px"/>';
	                    	}else{
	                    		genderImg = '<img src="resources/img/common/ico_female.png" width="9px"/>';
	                    	}
	                    	
		                    if(item.is_leader === 'Y'){
		                    	$('#leaderprofile').html('<div class="leaderjb">' + profileImg + ' ' + item.nickname + ' / ' + genderImg + ' / ' + '크루장' + '</div>');
		                    }else{
		                    	content += '<div class="testeee">' + profileImg + ' ' + item.nickname + ' / ' + genderImg + ' / ' + '크루원'  + '</div>';
		                    }
		                    
		                    $('#crew-member-profile').html(content);
		                  	console.log(item);
	                    });
	                    
	                   /*  var profileImg = '<img src="/photo/' + result.image + '"/>';  */
	                }
	            },
	            error: function (e) {
	                console.log('에러 발생 => ', e);
	            }
	        });
	    }
	    
	    
	});

</script>
</html>