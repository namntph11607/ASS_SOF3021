<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<h1>
	<small>Dashboard Page</small>
</h1>
<hr>
<!-- 
<div class="well">
	<h4>Dashboard</h4>
	<p>Some text..</p>
</div>
<div class="row">
	<div class="col-sm-3">
		<div class="well">
			<h4>User</h4>
			<p>1 Million</p>
		</div>
	</div>
	<div class="col-sm-3">
		<div class="well">
			<h4>Pages</h4>
			<p>100 Million</p>
		</div>
	</div>
	<div class="col-sm-3">
		<div class="well">
			<h4>Sessions</h4>
			<p>10 Million</p>
		</div>
	</div>
	<div class="col-sm-3">
		<div class="well">
			<h4>Bounce</h4>
			<p>30%</p>
		</div>
	</div>
</div> -->
<div class="table-responsive">
	<table class="table" >
		<thead >
			<tr>
				<th>Loại mặt hàng</th>
				<th>Doanh Thu</th>
				<th>Số Lượng Đã Bán</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="r" items="${ report }">
				<tr>
					<td>${ r.loai.name }</td>
					<td>${ r.doanhthu.toString().replace(".0", " VNĐ") }</td>
					<td>${ r.soLuong }</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
</div>