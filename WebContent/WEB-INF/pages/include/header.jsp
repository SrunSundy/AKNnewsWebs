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
		<div ng-if="userprofileStatus" id="user-profile" class="user-profile-info">
			
			<ul class="profile-info">
				<li><i class="fa fa-user"></i>សូស្តី</li>
				<li><i class="fa fa-sign-in"></i><a href="login">ចូលប្រើប្រាស់</a></li>
				<li><i class="fa fa-user-plus"></i><a href="signup">ចុះឈ្មោះប្រើប្រាស់</a></li>
				<li><i class="fa fa-info-circle"></i><a href="about">អំពីយើង</a></li>
			</ul>
			
			<ul class="profile-after-login">
				<li><i class="fa fa-user"></i>សូស្តី! ភារុន</li>
				<li><i class="fa fa-user-secret"></i><a href="admin">គ្រប់គ្រងព័ត៌មាន</a></li>
				<li><i class="fa fa-bookmark"></i><a href="saved-news"> ព័ត៌មានបាន រក្សាទុក</a></li>
				<li><i class="fa fa-key"></i><a href="change-passwd">ប្តូរ លេខសម្ងាត់</a></li>
				<li><i class="fa fa-camera"></i><a href="change-profile">ប្តូរ រូបភាព</a></li>
				<li><i class="fa fa-sign-out"></i><a href="logout">ចាកចេញ</a></li>
				<li><i class="fa fa-info-circle"></i><a href="about">អំពីយើង</a></li>
			</ul>
		</div>
	</div>
	<div class="phone-menu" ng-if="phoneMenuStatus">
		<ul>
			<li ng-repeat="category in categories" ng-click="articleCategory(category.id)"><i class="fa fa-angle-down"></i>{{category.name}}</li>
		</ul>
	</div>
	<div class="phone-menu-icon" ng-click="togglePhoneMenu()">
		<i class="fa fa-bars"></i>
	</div>
</div>