<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="container">
	<h1 style="padding-top: 1cm;">
		<small>Lịch Sử Order</small>
	</h1>
		<br>
	<hr>
	<br>
	<br>
	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th>Tên Người Đặt</th>
					<th>Địa chỉ</th>
					<th>Ngày Đặt</th>
					<th>Trạng Thái</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="o" items="${page.getContent()}">
					<tr>
						<td>${ o.account.fullname }</td>
						<td>${ o.address }</td>
						<td>${ o.createDate }</td>
						<td><c:if test="${ o.status == 0}">
								<b style="color: orange;">Đang Xử Lý</b>
							</c:if> <c:if test="${ o.status == 1}">
								<b style="color: aqua;">Đang Lấy Hàng</b>
							</c:if> <c:if test="${ o.status == 2}">
								<b style="color: blue;">Đang Giao Hàng</b>
							</c:if> <c:if test="${ o.status == 3}">
								<b style="color: green;">Đã Giao Hàng</b>
							</c:if></td>
						<td><a href="/myAcc/historyOrderDetails/${ o.id }"><button class="btn btn-info">Order Details</button></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<br>
		<c:if test="${ page.getContent().isEmpty() }">
			<h1 style="padding: 100px;">
				<small>Không có Order</small>
			</h1>
		</c:if>
		<ul class="pager">
			<li><a href="/myAcc/historyOrder?p=0"><span
					class="glyphicon glyphicon-fast-backward"></span></a></li>
			<li><a
				href="/myAcc/historyOrder?p=${page.number == 0 ?  0 : page.number-1}"><span
					class="glyphicon glyphicon-backward"></span></a></li>
			<li><span class="badge"><b class="text-info">${page.number+1}</b>
			</span></li>
			<li><a
				href="/myAcc/historyOrder?p=${page.number == page.totalPages-1 ? page.totalPages-1 : page.number+1}"><span
					class="glyphicon glyphicon-forward"></span></a></li>
			<li><a href="/myAcc/historyOrder?p=${page.totalPages-1}"><span
					class="glyphicon glyphicon-fast-forward"></span></a></li>
		</ul>
		<br>
	</div>
</div>