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
				<th>Username</th>
				<th>CrateDate</th>
				<th>Address</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="o" items="${page.getContent()}">
				<tr>
					<td>${ o.id }</td>
					<td>${ o.account.fullname }</td>
					<td>${ o.address }</td>
					<td>${ o.createDate }</td>
					<td><button class="btn btn-info">Order Details</button></td>
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