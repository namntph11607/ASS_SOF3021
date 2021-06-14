<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ TitlePage }</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.affix {
	top: 0;
	width: 100%;
	z-index: 9999 !important;
}

.affix+.container-fluid {
	padding-top: 70px;
}
/* Remove the navbar's default rounded borders and increase the bottom margin */
.navbar {
	margin-bottom: 50px;
	border-radius: 0;
}

/* Remove the jumbotron's default bottom margin */
.jumbotron {
	margin-bottom: 0;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}
</style>
</head>
<body>
	<div class="jumbotron">
		<div class="container text-center">
			<h1>Online Store</h1>
			<p>Assginment Java5-SOF3021</p>
		</div>
	</div>

	<nav class="navbar-inverse" data-spy="affix" data-offset-top="197">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/">ABC</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="/">Trang Chủ</a></li>
					<li><a class="dropdown-toggle" data-toggle="dropdown" href="">Loại
							Sản Phẩm<span class="caret"></span>
					</a>
						<ul class="nav dropdown-menu">
							<c:forEach var="cate" items="${ categories }">
								<li><a href="/shop/${ cate.id }">${ cate.name }</a></li>
							</c:forEach>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${ User == null }">
						<li><a href="/login"> <span
								class="glyphicon glyphicon-log-in"></span> Đăng Nhập
						</a></li>
					</c:if>
					<c:if test="${ User != null }">
						<li><a class="dropdown-toggle" data-toggle="dropdown"
							href="/#"><span class="glyphicon glyphicon-user"></span>Tải
								Khoản</a>
							<ul class="nav dropdown-menu">
								<c:if test="${ User.isRole() == true }">
									<li><a href="/admin">Quản Lý Bán Hàng</a></li>
								</c:if>
								<li><a href="/myProfile">Quản Lý Tài Khoản</a></li>
								<li><a href="/login">Đăng Xuất</a></li>
							</ul></li>
					</c:if>

					<li><a href="/cart/view"> <span
							class="glyphicon glyphicon-shopping-cart"></span>Giỏ Hàng <span
							class="badge">${ Count }</span>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<jsp:include page="${ view }"></jsp:include>

	<br>
	<br>

	<footer class="text-center">
		<br>
		<p>
			Design By <b>Nguyễn Thành Nam © ASS_SOF3021</b>
		</p>
	</footer>

</body>
</html>