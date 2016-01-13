<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="a-nav">
	<div class="nav-search">
		<i class="fa fa-search"></i>
		<input type="text" name="searchkey" placeholder="Search here..." ng-model="key"/>
		<button ng-click="searchArticles()">Search</button>
	</div>
	<div class="nav-category">
		<ul>
			<li><a href="${pageContext.request.contextPath }"><i class="fa fa-home"></i>ទំព័រដើម</a></li>
			<li ng-repeat="category in navCategory" ng-click="articleCategory(category.id)">{{category.name}}</li>
		</ul>
	</div>
	
</div>