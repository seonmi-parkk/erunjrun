<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 보기</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/common.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f0f0f0; /* 회색 배경 */
}

.main-container {
	display: flex; /* 사이드바와 컨테이너를 가로로 배치 */
	width: 80%; /* 전체 너비의 80%로 조정 */
	max-width: 1100px; /* 최대 너비 설정 */
	margin: 120px auto; /* 상하 여백 추가, 중앙 정렬 */
}

aside {
	width: 250px; /* 사이드바 너비 조정 */
	padding: 20px;
	background: #fff; /* 필요에 따라 배경색 추가 */
	border-top-left-radius: 8px; /* 왼쪽 위 모서리 둥글게 */
	border-bottom-left-radius: 8px; /* 왼쪽 아래 모서리 둥글게 */
}

.container {
	flex: 1; /* 남은 공간을 차지 */
	padding: 20px; /* 여백 추가 */
	background: white; /* 흰색 배경 */
	border-top-right-radius: 8px; /* 오른쪽 위 모서리 둥글게 */
	border-bottom-right-radius: 8px; /* 오른쪽 아래 모서리 둥글게 */
}

.image {
	text-align: center; /* 이미지 중앙 정렬 */
}

.title2 {
	font-weight: bold; /* 제목 강조 */
	font-size: 20px;
	margin-left: -6px;
	text-align: left;
}

.title3 {
	cursor: pointer; /* 클릭 가능 표시 */
	color: black; /* 링크 색상 */
	margin: 10px 24; /* 여백 추가 */
	margin-top: 10px;
	position: relative; /* 상대 위치 설정 */
	top: 30px;
}

.username {
	font-weight: bold; /* 사용자 이름을 강조 */
	font-size: 20px; /* 글자 크기 조정 */
	color: #333; /* 글자 색상 */
	margin-left: 25px; /* 기존과 동일한 여백 */
	margin-top: 10px;
}

.div, .div * {
	box-sizing: border-box;
}

h3 {
	text-align: left;
	margin-bottom: 20px;
	color: dark; /* 주황색 */
	font-size: 40px;
}

.form-group {
	margin-bottom: -16px;
	padding: 10px;
	border-radius: 8px; /* 모서리 둥글게 */
}

label {
	display: inline-block;
	margin-bottom: -5px;
	color: #555;
	background-color: #f9f9f9;
	padding: 4px 10px;
	border-radius: 4px;
	font-size: 14px;
}

.point-label {
	margin-bottom: 5px; /* 아래 여백을 추가 */
	margin-left: -12px;
	font-weight: normal; /* 볼드체 제거 */
	font-size: 14px; /* 다른 라벨과 같은 크기로 설정 */
}

input[type="text"], input[type="nickname"], input[type="email"], input[type="number"], input[type="password"]
	{
	width: calc(60% - 20px);
	padding: 10px;
	border: 1px solid #ccc; /* 테두리 제거 */
	border-radius: 4px; /* 모서리 둥글게 */
	background-color: white; /* 흰색 배경 */
	display: block;
	margin-top: 7px; /* 위쪽 여백 추가 */
}

input[readonly] {
	background-color: transparent;
	border: none; /* 테두리 제거 */
}

button {
	width: 15%;
	padding: 10px;
	background-color: #ff7f50; /* 주황색 */
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-top: 10px;
	margin-left: 10px;
}

button:hover {
	background-color: #ff6347; /* 버튼 hover 색상 */
}

.check-button {
	padding: 10px; /* 위아래 패딩을 줄이고 좌우 패딩도 조금 줄임 */
	background-color: #ff7f50;
	/* 주황색 */
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-left: 10px;
	background-color: #ff7f50; /* 입력 필드와 버튼 간 간격 */
}

.check-button:hover {
	background-color: #ff6347; /* hover 색상 */
}

.button-group {
	display: flex;
	justify-content: space-between; /* 버튼 사이 간격 조정 */
	margin-top: 20px; /* 버튼 상단 여백 추가 */
}

.submit-group {
	flex: 1; /* 남은 공간을 차지 */
}

.profile-image {
	max-width: 100px; /* 원하는 최대 너비 */
	max-height: 100px; /* 원하는 최대 높이 */
	border-radius: 4px; /* 모서리 둥글게 */
}

.profile-img1 {
	max-width: 100px; /* 원하는 최대 너비 */
	max-height: 100px; /* 원하는 최대 높이 */
	border-radius: 4px; /* 모서리 둥글게 */
	margin-left: -60px;
}

.profile-img2 {
	max-width: 100px; /* 원하는 최대 너비 */
	max-height: 100px; /* 원하는 최대 높이 */
	border-radius: 4px; /* 모서리 둥글게 */
	margin-left: -1px;
}

.image-info {
	display: flex; /* 수평 정렬 */
	align-items: center; /* 세로 중앙 정렬 */
	gap: 15px; /* 이미지와 정보 간의 간격을 조정 */
	margin-top: 40px; /* h3와의 간격을 조정 (20px으로 설정) */
}

.info {
	display: flex;
	flex-direction: column; /* 텍스트 세로 정렬 */
	align-items: center; /* 가운데 정렬 */
	text-align: center; /* 텍스트 가운데 정렬 */
}

.divider {
	width: 2px; /* 선의 두께 */
	background-color: #ccc; /* 선의 색상 */
	margin: 10px 0; /* 위아래 여백 */
}

.horizontal-divider {
	height: 2px; /* 선의 두께 */
	background-color: #ccc; /* 선의 색상 */
	margin: 10px 0; /* 위아래 여백 */
}

.title3.active {
    color: #black; /* 활성화된 메뉴 항목의 색상 */
    font-weight: bold; /* 강조 효과 */
    background-color: #f0f0f0; /* 배경 색상 (선택 사항) */
}

.icon-image1 {
	margin-top: -123px;
	margin-left: 2px;
}

.icon-image2 {
	margin-top: -2px;
	margin-left: -137px;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="main-container">
		<aside>
			<div class="image">
				<!-- 프로필 이미지 -->
				<c:choose>
					<c:when test="${not empty profile.image}">
						<img class="profile-img1" src="/photo/${profile.image}" alt="" />
					</c:when>
					<c:otherwise>
						<img class="profile-img1" src="resources/img/common/profile.png" alt="" />
					</c:otherwise>
				</c:choose>
			</div>
			<div class="icon">
				<!-- 아이콘 이미지 -->
				<c:choose>
					<c:when test="${not empty member.icon_image}">
						<img class="icon-image1" src="/resources/img/icon/${member.icon_image}" alt="" />
					</c:when>
					<c:otherwise>
						<img class="icon-image1" src="resources/img/icon/default-icon.png" alt="" />
					</c:otherwise>
				</c:choose>
			</div>
			<p class="username" id="name">${member.id}</p>
			<p class="title3 ${pageName == 'profileDetail' ? 'active' : ''}"
				onclick="location.href='profileDetail'">회원정보</p>
			<p
				class="title3 ${pageName == 'createExerciseProfile' || pageName == 'ExerciseProfile' ? 'active' : ''}"
				onclick="location.href='createExerciseProfile'">운동프로필</p>
			<p
				class="title3 ${pageName == 'pointHistoryListView' ? 'active' : ''}"
				onclick="location.href='pointHistoryListView'">포인트 내역</p>
			<p class="title3 ${pageName == 'memberCrewListView' ? 'active' : ''}"
				onclick="location.href='memberCrewListView'">크루 리스트</p>
			<p class="title3 ${pageName == 'myMateListView' ? 'active' : ''}"
				onclick="location.href='myMateListView'">내 운동 메이트</p>
			<p class="title3 ${pageName == 'likedMemberListView' ? 'active' : ''}"
				onclick="location.href='likedMemberListView'">내 관심/차단 회원</p>
			<p class="title3 ${pageName == 'messageListView' ? 'active' : ''}"
				onclick="location.href='messageListView'">쪽지</p>
			<p class="title3 ${pageName == 'myIconListView' ? 'active' : ''}"
				onclick="location.href='myIconListView'">아이콘</p>
			<p class="title3 ${pageName == 'myBoardListView' ? 'active' : ''}"
				onclick="location.href='myBoardListView'">내 게시글/댓글</p>
			<p class="title3 ${pageName == 'likedBoardListView' ? 'active' : ''}"
				onclick="location.href='likedBoardListView'">좋아요 게시글</p>
		</aside>
		<div class="divider"></div>
		<div class="container">
			<h3>회원정보 수정</h3>
			<form id="profile" action="profileUpdate" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="id" value="${member.id}" />
				<div class="image-info">
					<div class="image">
				<!-- 프로필 이미지 -->
				<c:choose>
					<c:when test="${not empty profile.image}">
						<img class="profile-img2" src="/photo/${profile.image}" alt="프로필 이미지" />
					</c:when>
					<c:otherwise>
						<img class="profile-img2" src="resources/img/common/profile.png" alt="기본 프로필 이미지" />
					</c:otherwise>
				</c:choose>
			</div>
			<div class="icon">
				<!-- 아이콘 이미지 -->
				<c:choose>
					<c:when test="${not empty member.icon_image}">
						<img class="icon-image2" src="/resources/img/icon/${member.icon_image}" alt="아이콘 이미지" />
					</c:when>
					<c:otherwise>
						<img class="icon-image2" src="resources/img/icon/default-icon.png" alt="" />
					</c:otherwise>
				</c:choose>
			</div>
					<div class="info">
						<p class="title2" id="name">${member.nickname}</p>
						<div class="form-group">
							<label for="point" class="title2 point-label">보유 포인트:</label> <span>${member.point}</span>
						</div>
					</div>
				</div>
				<div class="horizontal-divider"></div>

				<div class="form-group">
					<label for="id">아이디</label> <input type="text" name="id" id="id"
						value="${member.id}" readonly />
				</div>
				<div class="form-group">
					<label for="nickname">닉네임</label>
					<div style="display: flex; align-items: center;">
						<input type="text" name="nickname" id="nickname"
							value="${member.nickname}" />
						<button type="button" id="nickNameCheck" class="check-button">중복
							확인</button>
					</div>
					<div id="nickNameResult"></div>
				</div>
				<div class="form-group">
					<label for="phone">전화번호</label> <input type="text" name="phone"
						id="phone" value="${member.phone}" />
				</div>
				<div class="form-group">
					<label for="address">주소</label> <input type="text" name="address"
						id="address" value="${member.address}" />
				</div>
				<div class="form-group">
					<label for="email">이메일</label>
					<div style="display: flex; align-items: center;">
						<input type="text" name="email" id="email"
							value="${member.email}" />
						<button type="button" id="emailCheck" class="check-button">중복
							확인</button>
					</div>
					<div id="emailResult"></div>
				</div>
				<div class="form-group">
					<label for="pw">비밀번호</label> <input type="password" name="pw"
						id="pw" value="${member.pw}" />
				</div>
				<div class="button-group">
					<div class="submit-group">
						<button type="submit">수정완료</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
<script>
	$('#nickNameCheck').click(
			function() {
				var nickName = $('input[name="nickname"]').val();
				$.ajax({
					type : 'get',
					url : 'nickNameOverlay',
					data : {
						'nickName' : nickName
					},
					dataType : 'JSON',
					success : function(data) {
						if (data.overlay > 0) {
							$('#nickNameResult').html(
									nickName + ' 는 이미 사용중 입니다.').css('color',
									'red');
						} else {
							$('#nickNameResult')
									.html(nickName + ' 는 사용 가능합니다.').css(
											'color', 'green');
						}
					},
					error : function(e) {
						console.log(e);
					}
				});
			});

	$('#emailCheck').click(
			function() {
				var email = $('input[name="email"]').val();
				$.ajax({
					type : 'get',
					url : 'emailOverlay',
					data : {
						'email' : email
					},
					dataType : 'JSON',
					success : function(data) {
						if (data.overlay > 0) {
							$('#emailResult').html(email + ' 는 이미 사용중 입니다.')
									.css('color', 'red');
						} else {
							$('#emailResult').html(email + ' 는 사용 가능합니다.').css(
									'color', 'green');
						}
					},
					error : function(e) {
						console.log(e);
					}
				});
			});
</script>
</html>
