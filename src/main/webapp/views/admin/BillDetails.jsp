<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<h1>
	<small>OrderDetails</small>
</h1>
<hr>
<div class="container">
	<h3><a href="/admin/bill"><span class="glyphicon glyphicon-arrow-left"></span></a></h3>
	<br>
	<div class="table-responsive">
		<table class="table text-center">
			<thead class="row">
				<tr>
					<th class="col-sm-4 text-center">Sản Phẩm</th>
					<th class="col-sm-2 text-center">Hình Ảnh</th>
					<th class="col-sm-2 text-center">Giá</th>
					<th class="col-sm-1 text-center">Số Lượng</th>
					<th class="col-sm-2 text-center">Tạm Tính</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${ listOD }">
					<tr>
						<td><b>${ item.product.name }</b> <br> <br></td>
						<td><img alt="" src="/image/1.jpeg" width="100%"></td>
						<td>${ item.price }VNĐ</td>
						<td><b>${ item.quantity }</b></td>
						<td>${ item.price * item.quantity }VNĐ</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<h1 class="breadcrumb text-center">
			<small style="padding-right: 3cm; color: teal;"> <span
				class="glyphicon glyphicon-heart"></span> 
				<b>Tình Trạng: <c:if test="${ Status == 0}">
						Đang Xử Lý
					</c:if> <c:if test="${ Status == 1}">
						Đang Lấy Hàng
					</c:if> <c:if test="${ Status == 2}">
						Đang Giao Hàng
					</c:if> <c:if test="${ Status == 3}">
						Đã Giao Hàng
					</c:if>
				</b>
			</small> <small style="padding-left: 3cm; color: fuchsia;"> <span
				class="glyphicon glyphicon-usd"></span> <b>Tổng Tiền: ${ TongTien }
					VNĐ</b>
			</small>
		</h1>
		<br>
	</div>
</div>
