<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>B.S.C.Team - CarService</title>

<!-- Link To Base CSS -->
<%@include file="component/_linkCSS.jsp"%>

<!-- Link To Account CSS -->
<link rel="stylesheet" href="../css/Account_MAN.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@48,400,0,0" />
<style type="text/css">
.text-danger {
	font-size: 15px;
}
</style>
</head>


<body>
	<!-- Start Header -->
	<%@include file="component/_header.jsp"%>
	<!-- End Header -->

	<main style="grid-template-columns: 16rem auto 0;">
		<!-- Start Menu Aside -->
		<%@include file="component/_menu.jsp"%>
		<!-- End Menu Aside -->

		<section class="middle">

			<!--from-->
			<fr:form class="above" action="/account/create" method="POST"
				modelAttribute="users" enctype="multipart/form-data">
				<div class="px-4 p-3">
					<div class="row">
						<div class="col-5">
							<button class="btn btn-info text-white">Thêm mới</button>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<img src="" alt="">
					</div>
					<!--row1-->
					<div class="col-3">
						<div class="col-auto">
							<label class="col-form-label">ID</label>
						</div>
						<div class="col-auto">
							<input name="id" value="${users.id}" class="form-control"
								readonly />
						</div>
					</div>
					<div class="col-3">
						<div class="col-auto">
							<label class="col-form-label">Tên tài khoản</label>
						</div>
						<div class="col-auto">
							<fr:input path="user_names" class="form-control" />
							<fr:errors path="user_names" element="small"
								cssClass="form-text text-danger"></fr:errors>
						</div>
					</div>
					<div class="col-3">

						<div class="row g-2">
							<div class="col-md">
								<div class="col-auto">
									<label class="col-form-label">Tên</label>
								</div>
								<div class="col-auto">
									<fr:input path="first_names" class="form-control" />
									<br>

								</div>
								<fr:errors path="first_names" element="small"
									cssClass="form-text text-danger"></fr:errors>
							</div>
							<div class="col-md">
								<div class="col-auto">
									<label class="col-form-label">Họ</label>
								</div>
								<div class="col-auto">
									<fr:input path="last_names" class="form-control" />
									<br>

								</div>
								<fr:errors path="last_names" element="small"
									cssClass="form-text text-danger"></fr:errors>
							</div>
						</div>


					</div>

					<div class="col-3">
						<div class="col-auto">
							<label class="col-form-label">Email</label>

						</div>
						<div class="col-auto">
							<fr:input path="email" class="form-control" />
							<fr:errors path="email" element="small"
								cssClass="form-text text-danger"></fr:errors>
							<span>${error}</span>
						</div>
					</div>
					<!--row2-->
					<div class="col-3">
						<div class="col-auto">
							<label class="col-form-label">Mật khẩu</label>

						</div>
						<div class="col-auto">
							<fr:input path="pass_words" class="form-control" />
							<fr:errors path="pass_words" element="small"
								cssClass="form-text text-danger"></fr:errors>
						</div>
					</div>
					<div class="col-3">
						<div class="col-auto">
							<label class="col-form-label">Số điện thoại</label>
						</div>
						<div class="col-auto">
							<fr:input path="phones" class="form-control" type="text" />
							<fr:errors path="phones" element="small"
								cssClass="form-text text-danger"></fr:errors>
						</div>
					</div>
					<div class="col-3">
						<div class="col-auto">
							<label class="col-form-label">Địa chỉ</label>
						</div>
						<div class="col-auto">
							<fr:input path="address" class="form-control" />
							<fr:errors path="address" element="small"
								cssClass="form-text text-danger"></fr:errors>
						</div>
					</div>

					<!--row3-->
					<div class="col-3">
						<div class="col-auto">
							<label class="col-form-label">Vai trò</label>
						</div>
						<div class="col-auto">

							<fr:select path="roles" class="form-select"
								aria-label="Default select example">
									lý</option>
								<option ${users.roles.id == 3 ? 'selected':'' } value="3">Nhân
									viên</option>
								<option ${users.roles.id == 2 ? 'selected':'' } value="2">Người
									dùng</option>
							</fr:select>

														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-bs-dismiss="modal">NO</button>
															<a href="/account/close/${item.id}"
																class="btn btn-primary">YES</a>
														</div>
													</div>
												</div>
										</c:if>



										</div>
									</td>
									<td>${item.images}</td>
									<td>
										<!-- Modal update --> <a href="/account/edit/${item.id}"
										class="btn btn-primary"> <i class="bi bi-pencil-square"></i>
									</a>


										<button class="btn btn-danger" data-bs-toggle="modal"
											data-bs-target="#modalDelte${item.id }">
											<i class="bi bi-trash-fill"></i>
										</button> <!-- Modal delete -->

									</td>
								</tr>


								<!-- Modal -->
								<div class="modal fade" id="modalDelte${item.id }" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h1 class="modal-title fs-5" id="exampleModalLabel">Modal
													title</h1>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">Bạn muốn Xóa Tài Khoản</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">NO</button>
												<a href="/account/delete/${item.id}" class="btn btn-primary">YES</a>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal -->
							</c:forEach>

						</tbody>
					</table>
					<div class="d-flex justify-content-center">

						<div class="btn-toolbar" role="toolbar"
							aria-label="Toolbar with button groups">
							<div class="btn-group me-2" role="group" aria-label="First group">
								<a href="/admin/account?p=0"><button type="button" class="btn btn-primary">1</button></a>
								<a href="/admin/account?p=1"><button type="button" class="btn btn-primary">2</button></a>
								<a href="/admin/account?p=2"><button type="button" class="btn btn-primary">3</button></a>
								<a href="/admin/account?p=${listproduts.totalPages-1}"><button type="button" class="btn btn-primary">4</button></a>
							</div>
						</div>

					</div>
				</div>
			</div>

		</section>
		<!--end of middle-->

	</main>

	<!-- Link To Base JS -->
	<%@include file="component/_linkJS.jsp"%>

	<script type="text/javascript">
    const sidebarList = document.querySelectorAll('.sidebar');
    const sidebarActive = document.querySelector('.sidebar#account');

    let img = document.getElementById('img');
    let input = document.getElementById('inputGroupFile01');
    input.onchange = (e) => {
        if (input.files[0])
            img.src = URL.createObjectURL(input.files[0]);
    } 
    
    
    sidebarList.forEach((sidebar) => {
    	sidebar.firstElementChild.classList.remove('active');
        });
    sidebarActive.firstElementChild.classList.add('active');
    </script>
</body>

</html>








