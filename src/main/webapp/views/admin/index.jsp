<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
/* Set height of the grid so .sidenav can be 100% (adjust if needed) */
.row.content {
	height: 1111px;
}

/* Set gray background color and 100% height */
.sidenav {
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 35px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>
</head>
<body>

	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-2 sidenav hidden-xs">
				<br> <a href="/"><button class="btn btn-warning"
						style="width: 100%;">
						<span class="glyphicon glyphicon-arrow-left"></span> Quay về Shop
					</button></a>
				<h2>Online Store</h2>
				<br>
				<ul class="nav nav-pills nav-stacked text-lg">
					<li><a href="/admin"><span
							class="glyphicon glyphicon-dashboard"></span> Thống Kê</a></li>
					<li><a href="#" data-toggle="collapse"
						data-target="#myNavbar1"><span
							class="glyphicon glyphicon-shopping-cart"></span> Sản Phẩm <span
							class="caret"></span></a>
						<ul class="nav nav-pills nav-stacked collapse" id="myNavbar1">
							<li class="text-center"><a href="/admin/product"><span
									class="glyphicon glyphicon-hand-right"></span> Quản Lý Sản Phẩm</a></li>
							<li class="text-center"><a href="/admin/category"><span
									class="glyphicon glyphicon-hand-right"></span> Quản Lý LSP</a></li>
						</ul></li>
					<li><a href="/admin/bill"><span
							class="glyphicon glyphicon-list-alt"></span> Hóa Đơn </a></li>
					<li><a href="/admin/users"><span
							class="glyphicon glyphicon-user"></span> Người Dùng</a></li>
				</ul>
				<ul class="nav nav-pills nav-stacked text-lg" style="padding-top: 20cm;">
					<li><a href="/login"> <span
								class="glyphicon glyphicon-log-in"></span> Đăng Xuất
						</a></li>
				</ul>
			</div>
			<br>

			<div class="col-sm-10">
				<jsp:include page="${ views }"></jsp:include>
			</div>
		</div>
	</div>

	<footer class="container-fluid text-center">
		<p>
			Design By <b>Nguyễn Thành Nam © ASS_SOF3021</b>
		</p>
	</footer>






</body>
</html>