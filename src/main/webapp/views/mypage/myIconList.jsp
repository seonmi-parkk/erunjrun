<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>보유 아이콘 리스트</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/common.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f0f0f0;
}

aside {
	width: 250px;
	padding: 20px;
	background: #fff;
	border-top-left-radius: 8px;
	border-bottom-left-radius: 8px;
}

.main-container {
	display: flex;
	width: 80%;
	max-width: 1100px;
	margin: 120px auto;
}

.container {
	flex: 1;
	padding: 20px;
	background: white;
	border-top-right-radius: 8px;
	border-bottom-right-radius: 8px;
}

.icon-list {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
	gap: 15px;
	margin-top: 20px;
	min-height: 200px;
	overflow-y: auto;
}

.card {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: white;
	transition: background-color 0.3s;
	cursor: pointer;
	height: 200px;
	width: 170px;
}

.card:hover {
	background-color: #f1f1f1;
}

.icon-image {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	margin-bottom: 30px;
	z-index: 2;  /* 다른 이미지보다 위에 위치하도록 설정 */
}

.icon-name {
	font-size: 16px;
	color: #555;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1000;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 600px;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

h3 {
	text-align: left;
	margin-bottom: 20px;
	color: dark;
	font-size: 40px;
}

.image {
	text-align: center;
}

.title2 {
	font-weight: bold;
	font-size: 20px;
	margin-left: -6px;
	text-align: left;
}

.title3 {
	cursor: pointer;
	color: black;
	margin: 10px 24;
	margin-top: 10px;
	position: relative;
	top: 30px;
}

.username {
	font-weight: bold;
	font-size: 20px;
	color: #333;
	margin-left: 25px;
	margin-top: 10px;
}

.title1 {
	font-size: 24px;
	margin-bottom: 20px;
}

.profile-img1 {
	max-width: 100px;
	max-height: 100px;
	border-radius: 4px;
	margin-left: -60px;
	
}

.profile-img2 {
	width: 71px;        /* 크기 조정 (너비) */
    height: 71px;       /* 크기 조정 (높이) */
    position: absolute; /* 절대 위치 지정 */
    top: 24px;         /* 위로 올리기 (위쪽에서 20px 만큼 올림) */
    right: 48px;        /* 오른쪽으로 10px 이동 */
    border-radius: 50%; /* 둥근 이미지 */
	z-index: 1;  /* 다른 이미지보다 위에 위치하도록 설정 */
	
}

.divider {
	width: 2px;
	background-color: #ccc;
	margin: 10px 0;
}

.mate-options {
	display: flex;
	justify-content: flex-start;
	margin-bottom: 50px;
}

.mate-options .title3 {
	margin-right: 5px;
	cursor: pointer;
	color: black;
	text-decoration: underline;
	margin-left: 0;
}

.mate-options .title3:hover {
	color: #0056b3;
}

.pagination-container {
	text-align: center;
	margin-top: 20px;
}

.title3.active {
	color: black;
	font-weight: bold;
	background-color: #f0f0f0;
}

.action-buttons {
    display: flex;
    justify-content: space-between; /* 버튼 간격을 자동으로 조절 */
    margin-top: 10px; /* 버튼과 카드 간의 간격 추가 */
}

.action-buttons button {
    margin: 0 5px; /* 좌우로 5px 간격 추가 */
}

#updateIconBtn {
    background-color: white; /* 주황색 배경 */
    color: #FFA500; /* 텍스트 색상은 흰색 */
    border: 2px solid #FFA500; /* 테두리 색상도 주황색 */
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
    border-radius: 5px; /* 둥근 모서리 */
}

</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="main-container">
		<aside>
			<div class="image">
				<img class="profile-img1" src="resources/img/common/profile.png"
					alt="프로필 이미지" />
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
			<p
				class="title3 ${pageName == 'likedMemberListView' ? 'active' : ''}"
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
			<h3>내 아이콘 리스트</h3>
			<div class="icon-list">
				<!-- 아이콘 리스트는 AJAX로 동적으로 추가됩니다 -->
			</div>
			<div class="no-icon-message"
				style="display: none; text-align: center; margin-top: -100px;">
				구매한 아이콘이 없습니다.</div>
				<div class="action-buttons">
                <button id="updateIconBtn" class="btn btn-primary" disabled>수정하기</button>
            </div>
			<div class="pagination-container">
				<nav aria-label="Page navigation">
					<ul class="pagination" id="pagination"></ul>
				</nav>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
<script>
$(document).ready(function() {
    loadIconList(1); // 첫 페이지 로드

    function loadIconList(page) {
        $.ajax({
            type: 'GET',
            url: 'myIconList.ajax',
            data: { page: page, cnt: 8 },
            dataType: 'JSON',
            success: function(data) {
                console.log("AJAX 요청 성공:", data);
                if (data.error) {
                    alert(data.error);
                } else {
                    $('.icon-list').empty(); // 기존 리스트 초기화
                    $('.no-icon-message').hide(); // 초기에는 메시지 숨김
                    if (data.list.length === 0) {
                        $('.no-icon-message').show(); // 데이터가 없을 경우 메시지 표시
                    } else {
                        $.each(data.list, function(index, icon) {
                            var imageSrc = (icon.image && icon.image.trim()) ? '/resources/img/icon/' + icon.image : '/resources/img/icon/default.png';
                            var profileImageSrc = '/resources/img/common/profile.png'; // 기본 프로필 이미지
                            var iconCard = '<div class="card" data-id="' + icon.icon_idx + '">' +
                                '<img class="icon-image" src="' + imageSrc + '" alt="아이콘 이미지" />' +
                                '<img class="profile-img2" src="' + profileImageSrc + '" alt="기본 프로필 이미지" />' +  // 기본 프로필 이미지 추가
                                '<p class="icon-name">' + (icon.icon_name || '이름 없음') + '</p>' +
                                '<input type="radio" name="icon-radio" class="icon-radio" data-id="' + icon.icon_idx + '" />' +  <!-- 라디오 버튼으로 변경 -->
                                '</div>';
                            $('.icon-list').append(iconCard);
                        });
                        $('.no-icon-message').hide(); // 데이터가 있을 경우 메시지 숨김
                        setupPagination(data.totalCount, page); // 페이지네이션 생성
                        $('.pagination-container').show(); // 데이터가 있을 경우 페이지네이션 표시
                    }
                }
            },
            error: function(e) {
                console.error('아이콘 리스트를 불러오는 중 오류 발생:', e);
            }
        });
    }

    function setupPagination(totalCount, currentPage) {
        var totalPages = Math.ceil(totalCount / 8);
        if (totalPages === 0) {
            totalPages = 1;
        }

        $('#pagination').twbsPagination({
            totalPages: totalPages,
            startPage: currentPage,
            visiblePages: 5,
            onPageClick: function(evt, page) {
                loadIconList(page); // 선택한 페이지의 아이콘 리스트 로드
            }
        });
    }
    
    $(document).on('change', '.icon-radio', function() {
        var checkedCount = $('.icon-radio:checked').length;
        $('#updateIconBtn').prop('disabled', checkedCount === 0); // 라디오 버튼이 선택되면 수정 버튼 활성화
    });

    $('#updateIconBtn').click(function() {
        var selectedIcon = $('.icon-radio:checked').data('id'); // 선택된 아이콘의 ID를 가져옵니다.

        if (selectedIcon) {
            $.ajax({
                type: 'POST',
                url: 'iconImageUpdate.ajax', // 서버에 해당 요청을 보내기 위한 URL
                data: { iconId: selectedIcon },  // 하나의 아이콘만 변경하므로 {iconId}로 보냄
                dataType: 'json',
                success: function(response) {
                    if (response.success) {
                        alert('아이콘 이미지가 성공적으로 변경되었습니다.');
                        location.reload(); // 페이지 새로고침 (변경된 내용을 반영하기 위해)
                    } else {
                        alert('아이콘 이미지 변경에 실패했습니다.');
                    }
                },
                error: function(error) {
                    console.error('아이콘 이미지를 업데이트하는 중 오류 발생:', error);
                }
            });
        }
    });
});
</script>
</html>
