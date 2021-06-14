<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">
		<br> <br>
		<div class="col-xs-12 col-sm-12 ">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title	">${ User.fullname }</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-md-3 col-lg-3 " align="center">
							<img alt="User Pic"
								src="/image/1.jpeg"
								class="img-circle img-responsive">
						</div>

						<div class=" col-md-9 col-lg-9 ">
							<table class="table table-user-information text-center" style="font-size: medium;">
								<tbody>
									<tr>
										<td class="col-sm-3">Username:</td>
										<td class="col-sm-9"><input type="text" class="form-control" value="${ User.username }"></td>
									</tr>
									<tr>
										<td class="col-sm-3">Password:</td>
										<td class="col-sm-9"><input type="password" class="form-control" value="${ User.password }"></td>
									</tr>
									<tr>
										<td class="col-sm-3">Fullname:</td>
										<td class="col-sm-9"><input type="text" class="form-control" value="${ User.fullname }"></td>
									</tr>
									<tr>
										<td class="col-sm-3">Email:</td>
										<td class="col-sm-9"><input type="email" class="form-control" value="${ User.email }"></td>
									</tr>
<tr>
										<td class="col-sm-3">Photo:</td>
										<td class="col-sm-9"><input type="file" class="form-control" value="${ User.photo }"></td>
									</tr>

								</tbody>
							</table>

							<a href="#" class="btn btn-primary">Save Change</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>