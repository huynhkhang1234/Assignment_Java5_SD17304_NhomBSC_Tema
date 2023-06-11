<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="fr" %>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>B.S.C.Team - CarService</title>
    
    <!-- Link To Base CSS -->
    <%@include file="component/_linkCSS.jsp" %>

    <!-- Link To Account CSS -->
    <link rel="stylesheet" href="../css/Account_MAN.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@48,400,0,0" />
</head>

<body>
    <!-- Start Header -->
    <%@include file="component/_header.jsp" %>
    <!-- End Header -->

    <main style="grid-template-columns: 16rem auto 0;">
        <!-- Start Menu Aside -->
    	<%@include file="component/_menu.jsp" %>
    	<!-- End Menu Aside -->

        <section class="middle">
            <div class="px-4 p-3">
                <div class="row">
                    <div class="col-5">
                        <button class="btn btn-info text-white">Thêm mới</button>
                    </div>
                </div>
            </div>
            <!--from-->
            <fr:form class="above" action="/admin/account"  method="POST" modelAttribute="news" enctype="multipart/form-data">
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
                            <fr:input path="id" class="form-control"/>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="col-auto">
                            <label class="col-form-label">Tên tài khoản</label>
                        </div>
                        <div class="col-auto">
                            <fr:input path="user_names" class="form-control"/>
                        </div>
                    </div>
                    <div class="col-3">

                        <div class="row g-2">
                            <div class="col-md">
                                <div class="col-auto">
                                    <label class="col-form-label">Tên</label>
                                </div>
                                <div class="col-auto">
                                    <fr:input path="first_names" class="form-control"/>
                                </div>
                            </div>
                            <div class="col-md">
                                <div class="col-auto">
                                    <label class="col-form-label">Họ</label>
                                </div>
                                <div class="col-auto">
                                    <fr:input path="last_names" class="form-control"/>
                                </div>
                            </div>
                        </div>


                    </div>

                    <div class="col-3">
                        <div class="col-auto">
                            <label class="col-form-label">Email</label>
                        </div>
                        <div class="col-auto">
                            <fr:input path="email" class="form-control"/>
                        </div>
                    </div>
                    <!--row2-->
                    <div class="col-3">
                        <div class="col-auto">
                            <label class="col-form-label">Mật khẩu</label>
                        </div>
                        <div class="col-auto">
                            <fr:input path="pass_words" class="form-control"/>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="col-auto">
                            <label class="col-form-label">Số điện thoại</label>
                        </div>
                        <div class="col-auto">
                            <fr:input path="phones" class="form-control" type="number"/>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="col-auto">
                            <label class="col-form-label">Địa chỉ</label>
                        </div>
                        <div class="col-auto">
                            <fr:input path="address" class="form-control"/>
                        </div>
                    </div>

                    <!--row3-->
                    <div class="col-3">
                        <div class="col-auto">
                            <label class="col-form-label">Vai trò</label>
                        </div>
                        <div class="col-auto">
                        
                            <fr:select path="${roles.id}" class="form-select" aria-label="Default select example">
                                <option selected value="1">Quản lý</option>
                                <option value="3">Nhân viên</option>
                                <option value="2">Người dùng</option>
                            </fr:select>
                        </div>
                       
                    </div>

                    <div class="col-3">
                        <div class="col-auto">
                            <label class="col-form-label">Ngày tạo</label>
                        </div>
                        <div class="col-auto">
                        <fr:input path="create_date" class="form-control"/>
                            
                             <input type="text"  name="create_date"/>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="col-auto">
                            <label class="col-form-label">Ngày cập nhật</label>
                        </div>
                        <div class="col-auto">
                            <fr:input path="update_date" class="form-control"/>
                            
                        </div>
                    </div>
                   

                </div>
                <!--btn-->

                <div class="btn-account">
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">

                        <fr:button class="btn btn-warning"
				formaction="/account/update/${users.id}">Cập nhật</fr:button>

                    </div>
                </div>
            </fr:form>
            
            <div class="below">
                <div class="table-responsive mt-5" style="overflow-x: auto">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên tài khoản</th>
                                <th>Tên</th>
                                <th>Họ</th>
                                <th>Email</th>
                                <th>Mật khẩu</th>
                                <th>Số điện thoại</th>
                                <th>Địa chỉ</th>
                                <th>Vai trò</th>
                                <th>Tình trạng</th>
                                <th>Hình ảnh</th>
                                <th colspan="2">Thao Tác</th>
                            </tr>
                        </thead>
                        <tbody>
							<c:forEach var="item" items="${list}">
                            <tr>
                                <td>${item.id}</td>
                                <td>${item.user_names}</td>
                                <td>${item.first_names}</td>
                                <td>${item.last_names}</td>
                                <td>${item.email}</td>
                                <td>${item.pass_words}</td>
                                <td>${item.phones}</td>
                                <td>${item.address}</td>
                                <td>${item.roles.id}</td>
                                <td style="text-align: center;">
                                    <button type="button" class="btn btn-warning" data-bs-toggle="modal"
                                        data-bs-target="#modal-active">

                                        <i class="fa-solid fa-lock "></i>
                                    </button>

                                    <div class="modal fade" id="modal-active" data-bs-backdrop="static"
                                        data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel"
                                        aria-hidden="true">
                                        <div class=" modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="staticBackdropLabel">
                                                    Khóa tài khoản </h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                            </div>

                                            <div class="modal-body">

                                                <p style="font-size: 19px;">Bạn có muốn khóa thông tin </p>

                                            </div>

                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                    data-bs-dismiss="modal">Close</button>
                                                <button type="button" class="btn btn-primary">Yes</button>
                                            </div>
                                        </div>
                                    </div>
                </div>
                </td>

                <td></td>
                <td>
                <!-- Modal update --> 
                				<a href="/account/edit/${item.id}"
										class="btn btn-primary"> 
										<i class="bi bi-pencil-square"></i>
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

                    <a class="page-link" href="#">1</a>
                    <a class="page-link" href="#">2</a>
                    <a class="page-link" href="#">3</a>
                    <a class="page-link" href="#">4</a>

                </div>
            </div>
            </div>

        </section>
        <!--end of middle-->

    </main>

    <!-- Link To Base JS -->
    <%@include file="component/_linkJS.jsp" %>
    
    <script type="text/javascript">
    const sidebarList = document.querySelectorAll('.sidebar');
    const sidebarActive = document.querySelector('.sidebar#account');

    sidebarList.forEach((sidebar) => {
    	sidebar.firstElementChild.classList.remove('active');
        });
    sidebarActive.firstElementChild.classList.add('active');
    </script>
</body>

</html>