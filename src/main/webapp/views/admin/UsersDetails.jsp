<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<h1>
	<small>Users Page</small>
</h1>
<hr>

<div class="panel-group" id="accordion">
	<div class="panel panel-info">
		<div class="panel-heading">
			<div class="table-responsive">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Username</th>
							<th>Password</th>
							<th>Fullname</th>
							<th>Email</th>
							<th>Photo</th>
							<th>Activated</th>
							<th>Role</th>
							<th colspan="2">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${page.getContent()}">
							<tr>
								<td>${ item.username }</td>
								<td>${ item.password }</td>
								<td>${ item.fullname }</td>
								<td>${ item.email }</td>
								<td><img alt="photo" src="${ item.photo }" width="100" height="200"></td>
								<td>${ item.activated == true ? 'Activated' : 'Not Activated' }</td>
								<td>${ item.role == true ? 'ADMIN' : 'USER' }</td>
								<td><a href="/admin/users/edit/${item.username}"><button
											class="btn btn-warning open-formEdit"><span class="glyphicon glyphicon-pencil"></span></button></a></td>
								<td><a href="/admin/users/delete/${item.username}"><button
											class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></button></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<ul class="pager">
					<li><a href="/admin/users?p=0"><span
							class="glyphicon glyphicon-fast-backward"></span></a></li>
					<li><a
						href="/admin/users?p=${page.number == 0 ?  0 : page.number-1}"><span
							class="glyphicon glyphicon-backward"></span></a></li>
					<li><span class="badge"><b class="text-default">${page.number+1}</b>
					</span></li>
					<li><a
						href="/admin/users?p=${page.number == page.totalPages-1 ? page.totalPages-1 : page.number+1}"><span
							class="glyphicon glyphicon-forward"></span></a></li>
					<li><a href="/admin/users?p=${page.totalPages-1}"><span
							class="glyphicon glyphicon-fast-forward"></span></a></li>
				</ul>
			</div>
		</div>
		<div class="panel-body">
			<div class="container">
				<form:form class="form-horizontal" action="/admin/users"
					modelAttribute="user">
					<div class="row">
						<div class="col-xs-2">
							<img src="cinqueterre.jpg" class="img-thumbnail"
								alt="image" width="300" height="400">							
						</div>
						<div class="col-xs-10">
							<div class="form-group">
								<label for="username">Username *</label>
								<form:input class="form-control form-control-large"
									id="username" path="username" placeholder="Enter Username" disabled="true"/>
							</div>
						</div>
						<div class="col-xs-10">
							<div class="form-group">
								<label for="pwd">Password *</label>
								<form:input class="form-control form-control-small" id="pwd"
									path="" placeholder="******" disabled="true"/>
							</div>
						</div>
						<div class="col-xs-10">
							<div class="form-group">
								<label for="fullname">Fullname *</label>
								<form:input class="form-control" id="fullname" path="fullname"
									placeholder="Enter Fullname" disabled="true"/>
							</div>
						</div>
						<div class="col-xs-2"></div>
						<div class="col-xs-10">
							<div class="form-group">
								<label for="email">Email *</label>
								<form:input class="form-control form-control-small" id="email"
									path="email" placeholder="Enter email" disabled="true"/>
							</div>
						</div>
						<div class="col-xs-2"></div>
						<div class="col-xs-5">
							<div class="form-group">
								<label for="activated">Activated</label> <br>
								<form:radiobuttons id="activated" path="activated" items="${ activated }"
									delimiter=" -_- " />
							</div>
						</div>
						<div class="col-xs-1"></div>
						<div class="col-xs-5">
							<div class="form-group">
								<label for="role">Role</label> <br>
								<form:radiobuttons path="role" items="${ roles }"
									delimiter=" -_- " />
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button class="btn btn-primary"
									formaction="/admin/users/save">
									<span class="glyphicon glyphicon-floppy-save">Save</span>
								</button>
								<!-- 
								<button class="btn btn-success"
									formaction="/admin/users/clear">
									<span class="glyphicon glyphicon-refresh">Clear</span>
								</button> -->
							</div>
						</div>
					</div>
					<br>
					<br>
				</form:form>
			</div>
		</div>
	</div>
</div>
