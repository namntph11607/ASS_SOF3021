<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="container">
	<div class="row">
		<br> <br>
		<div class="col-xs-12 col-sm-12 ">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title	">${ user.fullname }</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-md-3 col-lg-3 " align="center">
							<img alt="User Pic"
								src="/image/1.jpeg"
								class="img-circle img-responsive">
						</div>

						<div class=" col-md-9 col-lg-9 ">
							<form:form class="form-horizontal" action="/myProfile"
								modelAttribute="user">
								<table class="table table-user-information text-center"
									style="font-size: medium;">
									<tbody>

										<tr>
											<td class="col-sm-3">Username:</td>
											<td class="col-sm-9"><form:input readonly="true"
													path="username" class="form-control"
													/></td>
										</tr>
										<tr>
											<td class="col-sm-3">Password:</td>
											<td class="col-sm-9"><form:password path="password" value="${ user.password }"
													class="form-control"/></td>
										</tr>
										<tr>
											<td class="col-sm-3">Fullname:</td>
											<td class="col-sm-9"><form:input path="fullname"
													class="form-control"/></td>
										</tr>
										<tr>
											<td class="col-sm-3">Email:</td>
											<td class="col-sm-9"><form:input path="email"
													class="form-control"/></td>
										</tr>
										<tr>
											<td class="col-sm-3">Photo:</td>
											<td class="col-sm-9"><input type="file" name="photo"
												class="form-control"></td>
										</tr>

									</tbody>
								</table>

								<button class="btn btn-primary" formaction="/myProfile/edit">
									<span class="glyphicon glyphicon-floppy-save">SaveChange</span>
								</button>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>