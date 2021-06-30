<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="container">
	<h2 class="breadcrumb text-center">
		<small> <mark>
				<b>Shopping Cart</b>
			</mark> <span class="glyphicon glyphicon-menu-right"></span> <a
			href="/cart/checkout">Checkout Details</a>
		</small>
	</h2>
	<div class="row">
		<div class="col-sm-8">
			<div class="table-responsive">
				<table class="table text-center">
					<thead class="row">
						<tr>
							<th class="col-sm-5 text-center">Sản Phẩm</th>
							<th class="col-sm-2 text-center">Giá</th>
							<th class="col-sm-2 text-center">Số Lượng</th>
							<th class="col-sm-2 text-center">Tạm Tính</th>
							<th class="col-sm-1 text-center">Acction</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${ cart.getItems() }">
							<input type="hidden" name="id" value="${item.productId}">
							<tr>							
								<td><b>${ item.productName }</b> <br>
								<br> <img alt="" src="/image/1.jpeg" width="70%"></td>
								<td>${ item.price } VNĐ</td>
								<td>
									<form action="/cart/update/${item.productId}" method="post">
										<input type="number" class="input-sm text-center"
											onchange="this.form.submit()" name="quantity" min="1"
											max="99"
											value="${ item.quantity <= 0 || item.quantity >= 100 ?  item.setQuantity(1) : item.quantity }"
											style="width: 100%;">
									</form>
								</td>
								<td>${ item.price * item.quantity } VNĐ</td>
								<td><a href="/cart/remove/${item.productId}"><button
											class="btn btn-danger">Xóa</button></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:if test="${ cart.getItems().isEmpty() }">
					<h1 style="padding: 100px;">
						<small> Giỏ Hàng Trống</small>
					</h1>
				</c:if>
				<a href="/">
					<button class="btn btn-success">
						<span class="glyphicon glyphicon-menu-left"></span> <b>Thêm
							Sản Phẩm Khác</b>
					</button>
				</a> <a href="/cart/clear"><button class="btn btn-warning" >
						<b>Làm mới giỏ hàng</b>
					</button></a>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>Cộng Giỏ Hàng</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Tạm Tính</td>
							<td align="right"><b>${ cart.amount } VNĐ</b></td>
						</tr>
						<tr>
							<td>Tổng Sản Phẩm</td>
							<td align="right"><b>${ cart.count }</b></td>
						</tr>

					</tbody>
					<tfoot>
						<tr>
							<td><h4>Tổng Tiền</h4></td>
							<td align="right">
								<h4>${ cart.amount } VNĐ</h4>
							</td>
						</tr>
					</tfoot>
				</table>
				<hr>
				<a href="/cart/checkout" >
					<button class="btn btn-primary" style="width: 100%;">
						<b>Tiến Hành Đặt Hàng</b>
					</button>
				</a>
			</div>
		</div>

	</div>
</div>
