<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>crew Notice Update</title>
	<link rel="stylesheet" href="/resources/css/crew.css">
	<link rel="stylesheet" href="/resources/css/common.css"></link>
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/resources/js/summernote.js"></script>
	<script src="/resources/js/layerPopup.js"></script>
</head>
<body>
    <jsp:include page="../header.jsp" />
    
    <div class="crewWriteView">
	<div class="inner">
	    <form enctype="multipart/form-data">
		    <input type="hidden" name="notice_idx" value="${notice_idx}"/>
		    <input type="hidden" name="crew_idx" value="${result.crew_idx}"/>
		    <input type="hidden" name="loginId" value="${loginId}"/> 
		    <input type="hidden" name="leaderId" value="${leaderId}"/>
	        <p class="title1">크루 공지사항 수정</p>
	
	        <div id="doricn">
	            <div class="firstbox"> <!-- 레이아웃 구성을 위한 div -->
	
	                <div class="boxheigth">
	                    <span class="title2cn">제목</span>
	                    <input type="text" class="textB" name="subject" value="${result.subject}" required />
	                </div> <br>
	
	
	                <div class="boxheigth">
	                    <span class="title2cn">필독</span>
	                    <input type="radio" name="priority" value=""  id="priorityChack"  
	                    	<c:if test="${result.priority == 1 || result.priority == 2 || result.priority == 3}">checked</c:if>/>
	                    	<span class="basictex">필독</span>
                        <input type="radio" name="priority" value=""  id="checkReturn" 
                        	<c:if test="${result.priority == 0}">checked</c:if>/><span class="basictex">일반</span>
	                    <select id="priorityOption" style='visibility : hidden'>
	                    	<option value="">순위선택</option>
					        <option value="pr1" <c:if test="${result.priority == 1}">selected</c:if>>1순위</option>
					        <option value="pr2" <c:if test="${result.priority == 2}">selected</c:if>>2순위</option>
					        <option value="pr3" <c:if test="${result.priority == 3}">selected</c:if>>3순위</option>
				    	</select>
				    	<span id="priorityOverlay" style='visibility : hidden'></span>
	                </div> <br>
	
	
	            </div> <!-- 레이아웃 구성을 위한 div --> <br>
	
	            <div class="content_layoutcn"> <!-- 레이아웃 구성을 위한 div -->
	                <p class="title2cn">공지 내용</p> <br><br>
	                <div class="post-form">
	                    <textarea name="postContent" id="summernote" maxlength="10000"></textarea>
	                </div>
	            </div>
	
	        </div>
	
	        <div class="btn-parentcn">
	            <button type="button" class="btn03-l" onclick="location.href='/crewNoticeList/${result.crew_idx}'">수정 취소하기</button>
	            <button type="button" class="btn01-l" onclick="sendUpdatePost()">공지사항 수정하기</button>
	        </div>
	    </form>
	</div>
    </div>
    <div class="layoutbox1"></div>
    
    <jsp:include page="../footer.jsp" />
</body>

<script src="/resources/js/common.js"></script>
<script src="/resources/js/chatting.js"></script>
<script>
	var notice_idx = $('input[name="notice_idx"]').val();
	var crew_idx = $('input[name="crew_idx"]').val();
	var leaderId = $('input[name="leaderId"]').val();
	
	$(document).ready(function(){
		if(leaderId !== loginId){
			alert('작성자만 수정 가능합니다.');
			location.href='/';
		}else{
		    // 서버에서 가져온 content 값을 에디터에 삽입
		    var content = '<c:out value="${result.content}" escapeXml="false" />';
		    if (content) {
		        // summernote가 초기화된 후에만 내용을 설정
		        $('#summernote').summernote('code', content);
		    }
		    
		    var priorityValue = ${result.priority}; // 서버에서 전달된 priority 값
		    
		    if (priorityValue === 1 || priorityValue === 2 || priorityValue === 3) {
		        $('#priorityOption').css('visibility', 'visible');
		    } else {
		        $('#priorityOption').css('visibility', 'hidden');
		    }
		    
		    $('#priorityChack').on('change', function(){
				$('#priorityOption').css('visibility', 'visible');
		    });
		    
		    $('#checkReturn').on('change', function(){
				$('#priorityOption').css('visibility', 'hidden');
		    });
		}
	
	});

	
	var overlayCheck = 'Y'; // 일반공지일 경우
	var notice_idx = '';
	var loginId = $('input[name="loginId"]').val();
	var sub = '';
	
	function sendUpdatePost(){
		sub = $('input[name="subject"]').val();
		if(overlayCheck === 'Y'){
			if(!sub){
	    		layerPopup('제목을 입력해주세요.', '확인',false, applBtn2Act, applBtn2Act);
	    	}else{
				layerPopup('공지사항을 수정하시겠습니까?', '확인', '취소', updatePost, applBtn2Act);
	    	}
		}else{
			layerPopup('기존 공지 순위를 변경하시겠습니까?', '확인', '취소', updatePriority, applBtn2Act);
		}
	}
	
	function updatePost() {
		loading();
	    var formData = new FormData($('form')[0]); 
	    var content = $('#summernote').summernote('code');
	    var priority = $('#priorityOption').val();
	    priority = priority.replace(/^,|,$/g, '');
	    
	
	    formData.append('id', loginId); 
	    formData.append('content', content); 
		formData.append('priority', priority); 
		
		var crew_idx = $('input[name="crew_idx"]').val(); // Hidden input에서 값 가져오기
	    var notice_idx = $('input[name="notice_idx"]').val();
		
	    formData.append('crew_idx', crew_idx);
		formData.append('notice_idx', notice_idx);
		
		
	    var tempDom = $('<div>').html(content);
	    var imgsInEditor = [];
	
	    tempDom.find('img').each(function () {
	        var src = $(this).attr('src');
	        if (src && src.includes('/photo-temp/')) {  
	            var filename = src.split('/').pop();  
	            imgsInEditor.push(filename);  
	        }
	    });
	
	    var finalImgs = tempImg.filter(function (temp) {
	        return imgsInEditor.includes(temp.img_new);  
	    });
	    formData.append('imgsJson', JSON.stringify(finalImgs));  
	
	    $.ajax({
	        type: 'POST',
	        url: '/crew/sendNoticeUpdate', 
	        data: formData,  
	        contentType: false, 
	        processData: false,  
	        enctype: 'multipart/form-data', 
	        success: function (response) {
	            if(response.success){
	            	removeAlert();
	            	layerPopup('공지사항 수정이 완료되었습니다.', '확인',false, locationHref ,locationHref);
	            	loadingComplete();
	            }
	        },
	        error: function (e) {
	            console.log('글 전송 에러:', e);
	            removeAlert();
	            loadingComplete();
	        }
	    });
	}
	
	function updatePriority(){
		var priority = $('#priorityOption').val();
		var crew_idx = $('input[name="crew_idx"]').val();
		var notice_idx = notice_idx;
		
		$.ajax({
			type: 'PUT',
			url: '/crew/noticePriorityUpdate',
			data: {'crew_idx' : crew_idx,
					'priority' : priority},
			dataType: 'JSON',
			success: function(response){
				if(response.success){
					updatePost();
				}
			},error: function(e){
				console.log('순위 수정 중 에러 => ', e);
			}
		});
	}
	
	
	$('#priorityOption').on('change', function(){
		
		 var priority = $('#priorityOption').val();
		 console.log(priority);
		 
		 var crew_idx = $('input[name="crew_idx"]').val();
		 console.log(crew_idx);
		 
		 if(priority === 'pr1' || priority === 'pr2' || priority === 'pr3'){
	    	 $.ajax({
	    		type: 'POST',
	    		url: '/crew/priorityOverlay',
	    		data: {'crew_idx' : crew_idx,
	    				'priority' : priority},
	    		dataType: 'JSON',
	    		success: function(response){
	    			console.log(response);
	    			console.log(response.notice_idx);
	    			
	    			if(response.count > 0){
	    				$('#priorityOverlay').css('visibility', 'visible');
	    				$('#priorityOverlay').html('이미 사용중인 순위입니다.');
	    				$('#priorityOverlay').css('color', '#666666');
	    				overlayCheck = 'N';
	    				notice_idx = response.notice_idx;
	    			}else{
	    				$('#priorityOverlay').css('visibility', 'visible');
	    				$('#priorityOverlay').html('사용 가능한 순위입니다.');
	    				$('#priorityOverlay').css('color', '#FF903F');
	    				overlayCheck = 'Y';
	    			}
	    			
	    		},error: function(e){
	    			console.log('중복체크 중 에러 => ', e);
	    		}
	    	 });
		 }
	});
	
	function locationHref(){
		location.href = '/crewNoticeDetail/'+$('input[name="notice_idx"]').val();
	}
	
	// 팝업 취소
	function applBtn2Act() {
	    removeAlert(); 
	}
</script>
</html>