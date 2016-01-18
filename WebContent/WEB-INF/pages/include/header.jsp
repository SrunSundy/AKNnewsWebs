<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="a-nav">
	<div class="nav-search">
		<i class="fa fa-search"></i>
		<input type="text" name="searchkey" placeholder="ស្វែងរកព័ត៌មាន" ng-model="key"/>
		<button ng-click="searchArticles()">ស្វែងរក</button>
	</div>
	<div class="nav-category">
		<ul>
			<li><a href="${pageContext.request.contextPath }"><i class="fa fa-home"></i>ទំព័រដើម</a></li>
			<li ng-repeat="category in navCategory" ng-click="articleCategory(category.id)">{{category.name}}</li>
		</ul>
		<div class="user-profile" ng-click="toggleShowProfile()">
			<img src="${pageContext.request.contextPath}/resources/images/user/avatar.png"/>
		</div>
		<div class="clear"></div>
		<div ng-show="userprofileStatus" id="user-profile" class="user-profile-info">
			
			<ul class="profile-info">
				<li><i class="fa fa-user"></i>សូស្តី</li>
				<li><i class="fa fa-sign-in"></i>ចូលប្រើប្រាស់</li>
				<li><i class="fa fa-user-plus"></i>ចុះឈ្មោះប្រើប្រាស់</li>
				<li><i class="fa fa-info-circle"></i>អំពីយើង</li>
			</ul>
			
			<ul class="profile-after-login">
				<li><i class="fa fa-user"></i>សូស្តី! ភារុន</li>
				<li><i class="fa fa-user-secret"></i>គ្រប់គ្រងព័ត៌មាន</li>
				<li><i class="fa fa-bookmark"></i> ព័ត៌មានបាន រក្សាទុក</li>
				<li><i class="fa fa-key"></i>ប្តូរ លេខសម្ងាត់</li>
				<li><i class="fa fa-camera"></i>ប្តូរ រូបភាព</li>
				<li><i class="fa fa-sign-out"></i>ចាកចេញ</li>
				<li><i class="fa fa-info-circle"></i>អំពីយើង</li>
			</ul>
		</div>
	</div>
	<div class="phone-menu" ng-show="phoneMenuStatus">
		<ul>
			<li ng-repeat="category in categories" ng-click="articleCategory(category.id)"><i class="fa fa-angle-down"></i>{{category.name}}</li>
		</ul>
	</div>
	<div class="phone-menu-icon" ng-click="togglePhoneMenu()">
		<i class="fa fa-bars"></i>
	</div>
</div>