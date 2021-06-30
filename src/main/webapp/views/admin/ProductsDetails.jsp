<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<h1>
	<small>Products Page</small>
</h1>
<hr>

<div class="panel-group" >
	<div class="panel panel-info">
		<div class="panel-heading">
			<div class="table-responsive">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>ID</th>
							<th>Product Name</th>
							<th>Price</th>
							<th>CreateDate</th>
							<th>Available</th>
							<th>Category</th>
							<th colspan="2">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${page.getContent()}">
							<tr>
								<td>${ item.id }</td>
								<td>${ item.name }</td>
								<td>${ item.price }</td>
								<td>${ item.createDate }</td>
								<td>${ item.available == true ? 'Available' : 'Not Available' }</td>
								<td>${ item.category.name }</td>					
								<td><a href="/admin/product/edit/${item.id}"><button
											class="btn btn-warning open-formEdit"><span class="glyphicon glyphicon-pencil"></span></button></a></td>
								<td><a href="/admin/product/delete/${item.id}"><button
											class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></button></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<ul class="pager">
					<li><a href="/admin/product?p=0"><span
							class="glyphicon glyphicon-fast-backward"></span></a></li>
					<li><a
						href="/admin/product?p=${page.number == 0 ?  0 : page.number-1}"><span
							class="glyphicon glyphicon-backward"></span></a></li>
					<li><span class="badge"><b class="text-default">${page.number+1}</b>
					</span></li>
					<li><a
						href="/admin/product?p=${page.number == page.totalPages-1 ? page.totalPages-1 : page.number+1}"><span
							class="glyphicon glyphicon-forward"></span></a></li>
					<li><a href="/admin/product?p=${page.totalPages-1}"><span
							class="glyphicon glyphicon-fast-forward"></span></a></li>
				</ul>
			</div>
		</div>
		<div class="panel-body">
			<div class="container">
				<form:form class="form-horizontal" action="/admin/product"
					modelAttribute="prod">
						<div class="col-sm-2">
							<img src="/image/2.jpeg" class="img-thumbnail" alt=""
								width="300" height="400">
						</div>
					<div class="input-group col-sm-10">
						<span class="input-group-addon" style="width: 3cm;"><b>ID</b></span>
						<form:input type="text" class="form-control"
							path="Id" readonly="true" />
					</div>
					<br>
					<div class="input-group col-sm-10">
						<span class="input-group-addon" style="width: 3cm;"><b>Name</b></span>
						<form:input type="text" class="form-control"
							path="name" placeholder="Name Product" />
					</div>
					<br>
					<div class="input-group col-sm-10">
						<span class="input-group-addon" style="width: 3cm;"><b>Price</b></span>
						<form:input type="text" class="form-control"
							path="price" placeholder="Price Product" />
					</div>
					<br>
					<div class="input-group col-sm-10">
					<div class="col-xs-5">
							<div class="form-group">
								<label for="cate">Category</label> <br>
								<select id="cate" name="category" class="form-control">
									<c:forEach var="cate" items="${ categories }">
										<option value="${ cate.id }">${ cate.name }</option>
									</c:forEach>									
								</select>
							</div>
						</div>
						<div class="col-xs-2"></div>
						<div class="col-xs-5">
							<div class="form-group">
								<label for="avai">Available</label> <br>
								<form:radiobuttons id="avai" path="available"
									items="${ availables }" delimiter=" -_- " />
							</div>
						</div>
					</div>
					<br>
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button class="btn btn-primary" formaction="/admin/product/save">
								<span class="glyphicon glyphicon-floppy-save">Save</span>
							</button>
							<button class="btn btn-success"
								formaction="/admin/product/clear">
								<span class="glyphicon glyphicon-refresh">Clear</span>
							</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>


