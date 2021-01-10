<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
var boardNum = '${inquiry.boardNum}'; //게시글 번호
var inId = '${inquiry.userID}'; //게시글 작성자
var isSelected = '${inquiry.isSelected}'; //게시글 채택 여부
/* 댓글 내용이 없으면 alert창 띄우기  */
$(document).on('click', '#btnAnswer', function(e){
	if($("#answerContent").val()==""){
		alert("댓글 내용을 입력하세요");
		$("#answerContent").focus();
		return false;
	}
	 var insertData = $('#answerForm').serialize();
	 answerInsert(insertData); 
});
	   
//댓글 목록 
function answerList(){
	var url = '${pageContext.request.contextPath}/answerList';
    $.ajax({
        url : url,
        type : 'get',
        data : {"boardNum":boardNum, "inId":inId, "isSelected":isSelected}, 
        dataType: 'json',
        success : function(data){
            var html =''; 
            if(data.length < 1){
				html += ("등록된 댓글이 없습니다.");
			}
            else {
	            $.each(data, function(key, value){
	            	var userID = "<%=(String)session.getAttribute("userID")%>"
	            	/* 부모 댓글일 경우  */
	            	if (value.replyParents == 0) {
		            	html += '<li class="comment">';
		                html += '<div class="comment-body" id="answerNum' + this.answerNum + '">';
		                html += '<div class="well well-lg">';
		                if (inId == userID) {
			                if (value.isSelected != 1) {
		                        html += '<a onclick="answerSelect('+value.answerNum+',\''+ value.boardNum+'\');" class="btn btn-info btn-circle text-uppercase float-right"> 채택 </a>';
			                }
		                }
		                if (value.isSelected == 1)
               				html +='<img src="resources/img/select.png" align="right">'	
               			else
                   			html+='<p/>'
		                html += '<h3>' + value.userID + '</h3>';
		                html += '<div class="meta">' + value.answerDate + '</div>';
	                    html += '<p>' + value.answerContent + '</p>';
	                    /* 로그인한 사용자에게만 적용 */
	                    if (userID != 'null') {
	                    	if (value.isSelected != 1)
	                    	html += '<p><a onclick="insertAnswerReply('+value.answerNum+',\''+ value.boardNum+'\');" class="btn btn-info btn-circle text-uppercase">Reply</a></p>';
	                   		/* 현재 사용자가 댓글 작성자일 때  */
		                   	if (userID == value.userID) {
			                   	if (isSelected == 0){
		                       		html += '<a style="padding-right:5px" onclick="answerUpdate(' + this.answerNum + ', \'' + this.answerContent + '\', \'' + this.userID + '\' );"> 수정 </a>';
		                        	html += '<a onclick="answerDelete('+value.answerNum+',\''+ value.boardNum+'\');"> 삭제 </a>';
			                   	}
		                    }
	                    }
	  	              	html += '</div>';
	  	             	html += '</div>';
	  	              	html += '</li>';
	  	              	html += '<div id="answerReply' + this.answerNum +'"></div>';
	            	}
	            	/* 답글일 경우, 부모 댓글과 답글 기능이 없다는 점 빼고는 동일  */
	            	else {
		            		html += '<ul class="children">';
		            		html += '<li class="comment">';
			                html += '<div class="comment-body" id="answerNum' + this.answerNum + '">';
			                html += '<div class="well well-lg">';
			                html += '<h3>' + value.userID + '</h3>';
			                html += '<div class="meta">' + value.answerDate + '</div>';
		                    html += '<p>' + value.answerContent + '</p>';
		                    /* 로그인한 사용자에게만 적용 */
		                    if (userID != 'null') {
		                   		/* 현재 사용자가 댓글 작성자일 때  */
			                   	if (userID == value.userID) {
			                   		if (value.isSelected != 0) {
			                       		html += '<a style="padding-right:5px" onclick="answerUpdate(' + this.answerNum + ', \'' + this.answerContent + '\', \'' + this.userID + '\' );"> 수정 </a>';
			                        	html += '<a onclick="answerDelete('+value.answerNum+',\''+ value.boardNum+'\');"> 삭제 </a>';
			                   		}
			                    }
		                    }
		  	              	html += '</div>';
		  	              	html += '</div>';
		  	              	html += '</li>';
		  	              	html += '</ul>'
		            }
	            }); 
            }
            $("#answerList").html(html);
        }
    });
}
 
//댓글 등록
function answerInsert(insertData){
    $.ajax({
        url : '${pageContext.request.contextPath}/insertAnswer',
        type : 'post',
        data : insertData,
        success : function(data){
        	answerList();
            $('#answerContent').val('');
        }
    });
}
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function answerUpdate(answerNum, answerContent, userID){
	var htmls = "";
	htmls += '<div class="form-group" id="answerNum' + answerNum + '">';
	htmls += '<textarea class="form-control" cols="10" rows="5" id="editContent" name="editContent" style="border:1px solid #ccc">';
	htmls += answerContent;
	htmls += '</textarea>';
	htmls+= '<div style="float:right">';
	htmls += '<a onclick="answerUpdateProc('+answerNum+')">저장</a>';
	htmls += '<a onClick="answerList()" style="padding-left:5px">취소<a>';
	htmls += '</div>';
	htmls += '</div>';
	$('#answerNum' + answerNum).replaceWith(htmls);
	$('#answerNum' + answerNum + ' #editContent').focus();
}
 
//댓글 수정
function answerUpdateProc(answerNum){
	if($("#editContent").val()==""){
		alert("댓글 내용을 입력하세요");
		$("#editContent").focus();
		return false;
	}
    var updateContent = $('#editContent').val(); 
    $.ajax({
        url : '${pageContext.request.contextPath}/updateAnswer',
        type : 'post',
        data : {"answerNum" : answerNum, "answerContent" : updateContent},
        success : function(data){
        	answerList();
        }
    });
}
// 답글 작성
function insertAnswerReply(answerNum, boardNum){
	var htmls = "";
	htmls += '<form id="answerReplyForm">';
	htmls += '<ul class="children">';
	htmls += '<li class="comment">';
    htmls += '<div class="comment-body" id="answerNum' + this.answerNum + '">'
	htmls += '<textarea class="form-control" cols="10" rows="5" id="answerReplyContent" name="answerReplyContent" style="border:1px solid #ccc"></textarea>';
	htmls+= '<div style="float:right">';
	htmls += '<a onclick="answerReplyProc('+answerNum+')" style="padding-right:15px">저장</a>';
	htmls += '<a onClick="answerList()">취소<a>';
	htmls += '</div>';
	htmls += '</div>';
	htmls += '</form>';
	$("#answerReply" + answerNum).html(htmls);
}
//답글 저장
function answerReplyProc(answerNum){
	if($("#answerReplyContent").val()==""){
		alert("댓글 내용을 입력하세요");
		$("#answerReplyContent").focus();
		return false;
	}
	var answerReplyContent = $('#answerReplyContent').val();
    $.ajax({
        url : '${pageContext.request.contextPath}/answerReply',
        type : 'post',
        data : {'answerContent' : answerReplyContent, 'answerNum' : answerNum},
        success : function(data){
        	answerList();
        }
    });
}
 
//댓글 삭제 
function answerDelete(answerNum, boardNum){
	if (confirm('댓글을 삭제하시겠습니까?')) {
	    $.ajax({
	        url : '${pageContext.request.contextPath}/deleteAnswer',
	        data: {"answerNum":answerNum, 'boardNum':boardNum},
	        type : 'post',
	        success : function(data){
	        	answerList(); //댓글 삭제후 목록 출력 
	        }
	    });
	}
}

//댓글 채택
function answerSelect(answerNum, boardNum){
	if (confirm('댓글을 채택하시겠습니까?')) {
	    $.ajax({
	        url : '${pageContext.request.contextPath}/selectAnswer',
	        data: {'answerNum':answerNum, 'boardNum':boardNum},
	        type : 'post',
	        success : function(data){
	       		location.reload();
	        }
	    });
	}
}
$(document).ready(function(){
	answerList(); //페이지 로딩시 댓글 목록 출력 
});
</script>