<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../common/header.jsp" %>

<h3>Write Post</h3>

<form id="write-form" method="POST" action="./writeProc" enctype="multipart/form-data">
	<input type="hidden" name="queryString" value="<c:out value="${ queryString }" />" />
	<div class="form-group">
		<label for="title">Title</label>
		<input type="text" id="title" class="form-control" name="title" />
	</div>
	<div class="form-group">
		<label for="content">Content</label>
		<textarea id="content" class="form-control" name="content"></textarea>
	</div>
	<div class="form-group">
		<label for="attachment">Attachment</label>
		<div id="file-div"></div>
		<div><button type="button" id="add-file-btn" class="btn btn-sm">Add</button></div>
	</div>
	<div class="mt-3">
		<button type="submit" class="btn btn-primary">Submit</button>
		<a href="./list<c:out value="${ queryString }" />" class="btn btn-info">List</a>
	</div>
</form>

<script>
$(document).ready(function(){
	$("#add-file-btn").click(function(){
		var file = '<div>'
		+ '<input type="file" name="files" />'
		+ '<button type="button" class="delete-file-btn btn btn-sm">Delete</button>';
		+ '</div>';
		var $file = $(file);
		deleteEvent($file);
		$("#file-div").append($file);
		
	});
});

function deleteEvent(elem){
	elem.find(".delete-file-btn").click(function(){
		$(this).parent().remove();
	});
}
</script>

<%@ include file="../common/footer.jsp" %>