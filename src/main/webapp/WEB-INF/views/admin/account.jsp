<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="fr" %>
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
            <div class="above">
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
                            <input class="form-control">
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="col-auto">
                            <label class="col-form-label">Tên tài khoản</label>
                        </div>
                        <div class="col-auto">
                            <input class="form-control">
                        </div>
                    </div>
                    <div class="col-3">

                        <div class="row g-2">
                            <div class="col-md">
                                <div class="col-auto">
                                    <label class="col-form-label">Tên</label>
                                </div>
                                <div class="col-auto">
                                    <input class="form-control">
                                </div>
                            </div>
                            <div class="col-md">
                                <div class="col-auto">
                                    <label class="col-form-label">Họ</label>
                                </div>
                                <div class="col-auto">
                                    <input class="form-control">
                                </div>
                            </div>
                        </div>


                    </div>

                    <div class="col-3">
                        <div class="col-auto">
                            <label class="col-form-label">Email</label>
                        </div>
                        <div class="col-auto">
                            <input class="form-control">
                        </div>
                    </div>
                    <!--row2-->
                    <div class="col-3">
                        <div class="col-auto">
                            <label class="col-form-label">Mật khẩu</label>
                        </div>
                        <div class="col-auto">
                            <input class="form-control">
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="col-auto">
                            <label class="col-form-label">Số điện thoại</label>
                        </div>
                        <div class="col-auto">
                            <input class="form-control" type="number" max="10" min="1">
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="col-auto">
                            <label class="col-form-label">Địa chỉ</label>
                        </div>
                        <div class="col-auto">
                            <input class="form-control">
                        </div>
                    </div>

                    <!--row3-->
                    <div class="col-3">
                        <div class="col-auto">
                            <label class="col-form-label">Vai trò</label>
                        </div>
                        <div class="col-auto">
                            <select class="form-select" aria-label="Default select example">
                                <option selected>Quản lý</option>
                                <option value="1">Nhân viên</option>
                                <option value="2">Người dùng</option>

                            </select>
                        </div>
                       
                    </div>

                    <div class="col-3">
                        <div class="col-auto">
                            <label class="col-form-label">Ngày tạo</label>
                        </div>
                        <div class="col-auto">
                            <input class="form-control">
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="col-auto">
                            <label class="col-form-label">Ngày cập nhật</label>
                        </div>
                        <div class="col-auto">
                            <input class="form-control">
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="col-auto">
                            <label class="col-form-label">Ghi chú</label>
                        </div>
                        <div class="form-floating">
                            <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2"
                                style="height: 100px"></textarea>
                            <label for="floatingTextarea2"></label>
                        </div>
                    </div>

                </div>
                <!--btn-->

                <div class="btn-account">
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">

                        <!--btn cập nhật-->
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                            data-bs-target="#modaledit">

                            <i class="fa-solid fa-pen-to-square"></i>
                        </button>
                        <div class="modal fade" id="modaledit" data-bs-backdrop="static" data-bs-keyboard="false"
                            tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class=" modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">
                                            Cập nhật người dùng</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>

                                    <div class="modal-body">

                                        <p>Bạn có muốn cập nhật thông tin</p>

                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary">Yes</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--btn xóa-->
                        <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                            data-bs-target="#modaldelete " tabindex="-1">
                            <i class="fa-solid fa-trash-can"></i>
                        </button> <!-- Modal delete -->
                        <div class="modal fade" id="modaldelete" data-bs-backdrop="static" data-bs-keyboard="false"
                            tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class=" modal-dialog ">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">
                                            Xóa người dùng</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>

                                    <div class="modal-body">

                                        <p>Bạn có muốn xóa thông tin </p>

                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary">Yes</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
                                <th>Ghi chú</th>
                            </tr>
                        </thead>
                        <tbody>

                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
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
                <td></td>
                </tr>

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
