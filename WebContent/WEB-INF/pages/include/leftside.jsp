<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="a-left-side">
	<ul class="a-source">
		<select ng-model="site" ng-change="articleSite(site)">
			<option ng-value="0" id="domain.png">គេហទំព័រ</option>
			<option ng-value="{{site.id}}" ng-repeat="site in sites" id="{{site.logo}}" ng-bind="site.name"></option>
		</select>
	</ul>
	<ul class="a-category">
		<li class="bg-color"><i class="fa fa-tags"></i>ប្រភេទ</li>
		<li ng-repeat="category in categories" ng-click="articleCategory(category.id)" id="category{{category.id}}" value="{{category.id}}"><i class="fa fa-angle-down"></i><span ng-bind="category.name"></span></li>
	</ul>
</div><!--/end a-left-side  -->