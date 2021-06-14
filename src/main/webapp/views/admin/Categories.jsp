<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<h1>
	<small>Categories Page</small>
</h1>
<hr>
<div class="panel panel-info">
	<div class="panel-heading">
		<div class="container">
			<form:form class="form-horizontal" action="/admin/category"
				modelAttribute="cate">
				<div class="form-group">
					<label class="control-label col-sm-2" for="idCate">ID:</label>
					<div class="col-sm-5">
						<form:input path="Id" type="text" class="form-control" id="idCate"
							placeholder="Category ID" name="id" readonly="true" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="catename">Name:
					</label>
					<div class="col-sm-5">
						<form:input path="Name" type="text" class="form-control"
							id="catename" placeholder="Category Name" cssClass="form-control"/>
						<br>
						<form:errors path="*" element="span" cssClass="text-danger" />										
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button class="btn btn-primary"
							formaction="/admin/category/save"><span class="glyphicon glyphicon-floppy-save">Save</span></button>
						<button class="btn btn-success"
							formaction="/admin/category/clear"><span class="glyphicon glyphicon-refresh">Clear</span></button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
	<div class="panel-body">
		<table class="table table-striped">
			<thead class="row">
				<tr>
					<th class="col-sm-1">Id</th>
					<th class="col-sm-9">Name</th>
					<th class="col-sm-2" colspan="2">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${page.getContent()}">
					<tr>
						<td>${item.id}</td>
						<td>${item.name}</td>
						<td><a href="/admin/category/edit/${item.id}"><button
									class="btn btn-warning"><span class="glyphicon glyphicon-pencil"></span></button></a></td>
						<td><a href="/admin/category/delete/${item.id}"><button
									class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></button></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<ul class="pager">
			<li><a href="/admin/category?p=0"><span
					class="glyphicon glyphicon-fast-backward"></span></a></li>
			<li><a
				href="/admin/category?p=${page.number == 0 ?  0 : page.number-1}"><span
					class="glyphicon glyphicon-backward"></span></a></li>
			<li><span class="badge"><b class="text-info">${page.number+1}</b>
			</span></li>
			<li><a
				href="/admin/category?p=${page.number == page.totalPages-1 ? page.totalPages-1 : page.number+1}"><span
					class="glyphicon glyphicon-forward"></span></a></li>
			<li><a href="/admin/category?p=${page.totalPages-1}"><span
					class="glyphicon glyphicon-fast-forward"></span></a></li>
		</ul>
	</div>
</div>