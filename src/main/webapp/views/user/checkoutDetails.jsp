<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="container">
	<h2 class="breadcrumb text-center">
		<small> <a href="/cart/view">Shopping Cart</a> <span
			class="glyphicon glyphicon-menu-right"></span> <mark>
				<b>Checkout Details</b>
			</mark>
		</small>
	</h2>
	<div class="row">
		<div class="col-xs-8">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3>Thông Tin Thanh Toán</h3>
				</div>
				<div class="panel-body">
					<form:form role="form" action="/cart/checkout" method="POST" modelAttribute="order">
						<input name="account" value="${ User.username }" hidden>
						<div class="form-group">
							<label for="name">Họ và Tên *</label> <form:input type="text"
								class="form-control form-control-large" id="name" name="fullname" readonly="true"
								path="account" value="${ User.fullname }" />							
						</div>
						<div class="row">
							<div class="col-xs-6">
								<div class="form-group">
									<label for="phone">Số Điện Thoại *</label> <form:input type="text"
										class="form-control form-control-small" id="phone" path="phone"
										placeholder="Số điện thoại của bạn" />
								</div>
							</div>
							<div class="col-xs-6">
								<div class="form-group">
									<label for="email">Địa chỉ Email *</label> <form:input path="account"
								class="form-control form-control-large" id="email" readonly="true"
								value="${ User.email }" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="state" class="control-label">Địa chỉ giao
								hàng *</label> <form:input type="text" class="form-control" id="state" path="address"
								placeholder="Ví dụ: số 69, ngõ 8 Lê Quang Đạo, Nam Từ Liêm, Hà Nội" />
						</div>
						<h3>Thông tin bổ sung</h3>
						<div class="form-group">
							<label for="note" class="control-label">Ghi chú đơn hàng
								(Không bắt buộc)</label>
							<form:textarea class="form-control" rows="5" id="note" path="note"
								placeholder="Ghi chú về đơn hàng (thời gian nhận hàng hoặc điểm giao hàng chi tiết hơn)."></form:textarea>
						</div>
						<div class="well">
							<button type="submit" class="btn btn-lg btn-success btn-block" 
							${ cartItems.isEmpty() ? "disabled" : "" } >Đặt Hàng</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<div class="col-xs-4">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3>Đơn Hàng Của Bạn</h3>
				</div>
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table">
							<thead class="row">
								<tr>
									<th class="col-sm-8">Sản Phẩm</th>
									<th class="col-sm-4 text-right">Thành Tiền</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${ cartItems }">
									<tr>
										<td>${ item.productName }<b> x ${ item.quantity }</b></td>
										<td align="right"><b>${ item.price * item.quantity }
												VNĐ</b></td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr class="text-center">
									<td>Tổng Sản Phẩm: </td>
									<td><b>${ Count }</b></td>
								</tr>
								<tr>
									<td><h4>Tổng Tiền</h4></td>
									<td align="right"><h4>${ Amount }VNĐ</h4></td>
								</tr>
							</tfoot>
						</table>
						<hr>
						<b>Trả tiền mặt khi nhận hàng (Hóa đơn chưa kèm phí ship. Quý
							khách vui lòng thanh toán thêm phí ship khi nhận hàng)</b>
						<hr>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</div>
