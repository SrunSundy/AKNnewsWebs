<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="a-nav">
	<div class="nav-search">
		<i class="fa fa-search"></i>
		<input type="text" name="searchkey" placeholder="ស្វែងរកព័ត៌មាន" ng-model="key"/>
		<button ng-click="searchArticles()">ស្វែងរក</button>
		<%-- <a class="color" href="${pageContext.request.contextPath}/search?key={{key}}">ស្វែងរក</a> --%>
	</div>
	<div class="nav-category">
		<ul>
			<li><a href="${pageContext.request.contextPath }"><i class="fa fa-home"></i>ទំព័រដើម</a></li>
			<li ng-repeat="category in navCategory"><a href="${pageContext.request.contextPath}/{{category.id}}/category" ng-bind="category.name"></a></li>
		</ul>
		<div class="user-profile" ng-click="toggleShowProfile()">
			<c:choose>
				<c:when test="${sessionScope.SessionUser == null || sessionScope.SessionUser == ''}">
					<img src="${pageContext.request.contextPath}/resources/images/user/avatar.png"/>
				</c:when>
				<c:otherwise>
					<img ng-src="{{baseurl}}resources/images/user/${sessionScope.SessionUser.image}"/>
				</c:otherwise>
			</c:choose>
			
		</div>
		<div class="clear"></div>
		<div ng-if="userprofileStatus" id="user-profile" class="user-profile-info">
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
					<c:set value="${sessionScope.SessionUser.id }" var="uid"></c:set>
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
	<%-- <div class="phone-menu" ng-if="phoneMenuStatus">
		<ul​​>
			<li ng-repeat="category in categories"><a href="${pageContext.request.contextPath}/{{category.id}}/category"><i class="fa fa-angle-down"></i><span ng-bind="category.name"></span></a></li>
		</ul>
	</div> --%>
	<div class="phone-menu-icon" ng-click="togglePhoneMenu()">
		<i class="fa fa-bars"></i>
	</div>
</div>
