<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<h1>
	<small>Hóa Đơn</small>
</h1>
<hr>
<div class="table-responsive">
	<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>Tên Người Đặt</th>
				<th>Địa chỉ</th>
				<th>Ngày Tạo</th>
				<th>Trạng Thái</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="o" items="${page.getContent()}">
				<tr>
					<td>${ o.id }</td>
					<td>${ o.account.fullname }</td>
					<td>${ o.address }</td>
					<td>${ o.createDate }</td>
					<td>
						<form action="/admin/bill/${ o.id }" method="post">
							<select class="form-control" onchange="this.form.submit()" name="stt"
							 ${ o.status == 3 ? 'style="color: green;" disabled' : ''}>
								<option value="0" ${ o.status == 0 ? 'selected' : ''} style="color: orange;">Đang Xử Lý</option>
								<option value="1" ${ o.status == 1 ? 'selected' : ''} style="color: navy;">Đang Lấy Hàng</option>
								<option value="2" ${ o.status == 2 ? 'selected' : ''} style="color: blue;">Đang Giao Hàng</option>
								<option value="3" ${ o.status == 3 ? 'selected' : ''} 
								${ o.status < 2 ? 'disabled' : ''} style="color: lime;">Đã Giao Hàng</option>
							</select>
						</form>
					</td>
					<td><a href="/admin/bill/OrderDetails/${ o.id }"><button class="btn btn-info">Order Details</button></a></td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	<ul class="pager">
		<li><a href="/admin/bill?p=0"><span
				class="glyphicon glyphicon-fast-backward"></span></a></li>
		<li><a
			href="/admin/bill?p=${page.number == 0 ?  0 : page.number-1}"><span
				class="glyphicon glyphicon-backward"></span></a></li>
		<li><span class="badge"><b class="text-info">${page.number+1}</b>
		</span></li>
		<li><a
			href="/admin/bill?p=${page.number == page.totalPages-1 ? page.totalPages-1 : page.number+1}"><span
				class="glyphicon glyphicon-forward"></span></a></li>
		<li><a href="/admin/bill?p=${page.totalPages-1}"><span
				class="glyphicon glyphicon-fast-forward"></span></a></li>
	</ul>
</div>