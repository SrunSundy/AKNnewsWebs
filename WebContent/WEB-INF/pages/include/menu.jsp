<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="side-menu" ng-show="phoneMenuStatus">
	<p><i class="fa fa-tags"></i>ប្រភេទ</p>
	<ul>
		<li><a href="${pageContext.request.contextPath }"><i class="fa fa-home"></i>ទំព័រដើម</a></li>
		<li ng-repeat="category in categories" id="category{{category.id}}" value="{{category.id}}"><a href="${pageContext.request.contextPath }/{{category.id}}/category"><i class="fa fa-angle-down"></i><span ng-bind="category.name"></span></a></li>
	</ul>
	<p><i class="fa fa-key"></i>ការកំណត់</p>
	<div>
		<c:choose>
			<c:when test="${sessionScope.SessionUser == null || sessionScope.SessionUser == ''}">
				<c:set value="0" var="uid"></c:set>
				<ul class="profile-info">
					<li><i class="fa fa-sign-in"></i><a href="${pageContext.request.contextPath }/login">ចូលប្រើប្រាស់</a></li>
					<li><i class="fa fa-user-plus"></i><a href="${pageContext.request.contextPath }/signup">ចុះឈ្មោះប្រើប្រាស់</a></li>
					<li><i class="fa fa-info-circle"></i><a href="${pageContext.request.contextPath }/about">អំពីយើង</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<c:set value="${sessionScope.SessionUser.userId}" var="uid"></c:set>
				<ul class="profile-after-login">
					<li><i class="fa fa-user"></i>សូស្តី! ${sessionScope.SessionUser.username }</li>
					<li><i class="fa fa-user-secret"></i><a href="${pageContext.request.contextPath }/admin">គ្រប់គ្រងព័ត៌មាន</a></li>
					<li><i class="fa fa-bookmark"></i><a href="${pageContext.request.contextPath }/user/profile"> ព័ត៌មានបាន រក្សាទុក</a></li>
					<li><i class="fa fa-sign-out"></i><a href="${pageContext.request.contextPath }/logout">ចាកចេញ</a></li>
					<li><i class="fa fa-info-circle"></i><a href="${pageContext.request.contextPath }/about">អំពីយើង</a></li>
				</ul>
			</c:otherwise>
		</c:choose>
	</div>
</div>