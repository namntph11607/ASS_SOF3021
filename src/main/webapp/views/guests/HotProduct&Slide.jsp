<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner">

		<div class="item active">
			<img
				src="https://s3-ap-southeast-1.amazonaws.com/images.spiderum.com/sp-images/debc11f0653911ea9a2edd2e2afa0bc1.png"
				alt="Los Angeles" style="width: 100%; height: 20cm;">
			<div class="carousel-caption">
				<h3>Los Angeles</h3>
				<p>LA is always so much fun!</p>
			</div>
		</div>

		<div class="item">
			<img
				src="https://shop.mixigaming.com/wp-content/uploads/2019/06/logo-mixi-t%C3%A9t.png"
				alt="Chicago" style="width: 100%; height: 20cm;">
			<div class="carousel-caption">
				<h3>Chicago</h3>
				<p>Thank you, Chicago!</p>
			</div>
		</div>

		<div class="item">
			<img src="https://i.ytimg.com/vi/kMVJfyzDmtM/maxresdefault.jpg"
				alt="New York" style="width: 100%; height: 20cm;">
			<div class="carousel-caption">
				<h3>New York</h3>
				<p>We love the Big Apple!</p>
			</div>
		</div>

	</div>

	<!-- Left and right controls -->
	<a class="left carousel-control" href="#myCarousel" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left"></span> <span
		class="sr-only">Previous</span>
	</a> <a class="right carousel-control" href="#myCarousel" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right"></span> <span
		class="sr-only">Next</span>
	</a>
</div>

<div class="container" align="center">
	<h3>Sản Phẩm Nổi Bật</h3>
	<br>
	<div class="row">
		<c:forEach var="hp" items="${ hotProducts }" end="2">
			<div class="col-sm-4">
				<div class="panel panel-primary text-center">
					<div class="panel-heading">${ hp.name }</div>
					<div class="panel-body">
						<a href="#"> <img
							src="/image/1.jpeg"
							class="img-responsive" style="width: 100%" alt="Image">
						</a>
					</div>
					<div class="panel-footer">
						<h4 class="text-info">
							<b> ${ hp.price.toString().replace(".0", " VNĐ") }</b>
						</h4>
						<a href="/cart/add/${hp.id}">
							<button class="btn btn-primary">Thêm Vào Giỏ Hàng</button>
						</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>


	<hr>
	<a href="/shop">
		<button type="button" class="btn-lg btn-info"
			style="align-content: center;">Xem Thêm</button>
	</a>
	<hr>
</div>

<div class="container" align="center">
	<h3>Sản Phẩm Mới</h3>
	<br>
	<div class="row">
		<c:forEach var="np" items="${ newProducts }" end="2">
			<div class="col-sm-4">
				<div class="panel panel-primary text-center">
					<div class="panel-heading">${ np.name }</div>
					<div class="panel-body">
						<a href="#"> <img
							src="/image/2.jpeg"
							class="img-responsive" style="width: 100%" alt="Image">
						</a>
					</div>
					<div class="panel-footer">
						<h4 class="text-info">
							<b> ${ np.price.toString().replace(".0", " VNĐ") }</b>
						</h4>
						<a href="/cart/add/${np.id}">
							<button class="btn btn-primary">Thêm Vào Giỏ Hàng</button>
						</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<hr>
	<a href="/shop">
		<button type="button" class="btn-lg btn-info"
			style="align-content: center;">Xem Thêm</button>
	</a>
	<hr>
</div>

<div class="container" align="center">
	<h3>Đang Giảm Giá</h3>
	<br>
	<div class="row">
		<c:forEach var="sp" items="${ saleProducts }" end="7">
			<div class="col-sm-3">
				<div class="panel panel-primary text-center">
					<div class="panel-heading">${ sp.name }</div>
					<div class="panel-body">
						<a href="#"> <img
							src="https://cf.shopee.vn/file/ee8eb646591071f3c109fc79478a8db6"
							class="img-responsive" style="width: 100%" alt="Image">
						</a>
					</div>
					<div class="panel-footer">
						<mark>
							<del>${ sp.price / 0.5 } VNĐ</del>
						</mark>
						<h4 class="text-info">
							<b>${ sp.price.toString().replace(".0", " VNĐ") }</b>
						</h4>
						<a href="/cart/add/${sp.id}">
							<button class="btn btn-primary">Thêm Vào Giỏ Hàng</button>
						</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<hr>
	<a href="/shop">
		<button type="button" class="btn-lg btn-info"
			style="align-content: center;">Xem Thêm</button>
	</a>
	<hr>
</div>
