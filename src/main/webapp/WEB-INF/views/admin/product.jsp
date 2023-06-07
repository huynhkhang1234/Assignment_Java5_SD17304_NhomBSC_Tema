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
    <%@include file="component/_linkCSS.jsp" %>s

    <!-- Link To Own CSS -->
    <link rel="stylesheet" href="../css/Product_MAN.css">

</head>

<body>
    <!-- Start Header -->
    <%@include file="component/_header.jsp" %>
    <!-- End Header -->

    <main>
    
        <!-- Start Menu Aside -->
    	<%@include file="component/_menu.jsp" %>
    	<!-- End Menu Aside -->

        <section class="middle">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
                data-bs-whatever="@mdo">Thêm</button>

            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Thêm Sản Phẩm</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form class="row g-3">
                                <div class="col-md-6">
                                    <label for="inputTitle" class="form-label">Tiêu đề:</label>
                                    <input type="text" class="form-control" id="title">
                                </div>
                                <div class="col-md-6">
                                    <label for="inputPrice" class="form-label">Giá:</label>
                                    <input type="number" class="form-control" id="price">
                                </div>

                                <div class="col-md-12">
                                    <label for="inputCraetDate" class="form-label">Ngày đăng:</label>
                                    <input type="date" class="form-control" id="start" name="trip-start"
                                        min="2023-01-01" max="2025-12-31">
                                </div>

                                <div class="col-md-12">
                                    <label for="categoryId" class="form-label">Loại:</label>
                                    <select id="categoryId" class="form-select">
                                        <option selected>Màn hình</option>
                                        <option>Thảm lót</option>
                                        <option>Âm thanh</option>
                                        <option>Camera</option>
                                        <option>Cảm biến</option>
                                        <option>Đèn</option>
                                    </select>
                                </div>

                                <fieldset class="row mb-3" style="margin-top: 1rem;">
                                    <legend class="col-form-label col-sm-2 pt-0">Trạng thái:</legend>
                                    <div class="col-sm-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="gridRadios"
                                                id="gridRadios1" value="option1" checked>
                                            <label class="form-check-label" for="gridRadios1">
                                                Còn hàng
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="gridRadios"
                                                id="gridRadios2" value="option2">
                                            <label class="form-check-label" for="gridRadios2">
                                                Hết hàng
                                            </label>
                                        </div>
                                    </div>

                                </fieldset>

                                <div class="col-12">
                                    <label for="inputDescription" class="form-label">Miêu tả</label>
                                    <textarea class="form-control" id="description"
                                        placeholder="Viết bình luận của bạn"></textarea>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            <button type="button" class="btn btn-primary">Gửi</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="product">
                <div class="prod">
                    <div class="column1">
                        <div class="name">Camera</div>

                        <p class="caption">
                            Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích
                            thước
                            nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban
                            ngày và
                            ban đêm.
                        </p>
                    </div>
                    <div class="column2">
                        <img class="image" src="/images/camera1.png" />
                    </div>
                </div>

                <div class="prod">
                    <div class="column1">
                        <div class="name">Cảm biến</div>

                        <p class="caption">
                            Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích
                            thước
                            nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban
                            ngày và
                            ban đêm.
                        </p>

                    </div>
                    <div class="column2">
                        <img class="image" src="/images/cambien1.png" />
                    </div>
                </div>

                <div class="prod">
                    <div class="column1">
                        <div class="name">Camera</div>

                        <p class="caption">
                            Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích
                            thước
                            nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban
                            ngày và
                            ban đêm.
                        </p>

                    </div>
                    <div class="column2">
                        <img class="image" src="/images/den1.png" />
                    </div>
                </div>

                <div class="prod">
                    <div class="column1">
                        <div class="name">Camera</div>

                        <p class="caption">
                            Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích
                            thước
                            nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban
                            ngày và
                            ban đêm.
                        </p>

                    </div>
                    <div class="column2">
                        <img class="image" src="/images/loa1.jpg" />
                    </div>
                </div>

                <div class="prod">
                    <div class="column1">
                        <div class="name">Camera</div>

                        <p class="caption">
                            Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích
                            thước
                            nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban
                            ngày và
                            ban đêm.
                        </p>

                    </div>
                    <div class="column2">
                        <img class="image" src="/images/manhinh1.png" />
                    </div>
                </div>

                <div class="prod">
                    <div class="column1">
                        <div class="name">Camera</div>

                        <p class="caption">
                            Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích
                            thước
                            nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban
                            ngày và
                            ban đêm.
                        </p>

                    </div>
                    <div class="column2">
                        <img class="image" src="/images/volang.jpg" />
                    </div>
                </div>

                <div class="prod">
                    <div class="column1">
                        <div class="name">Camera</div>

                        <p class="caption">
                            Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích
                            thước
                            nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban
                            ngày và
                            ban đêm.
                        </p>
                    </div>
                    <div class="column2">
                        <img class="image" src="/images/pic-51.jpg" />
                    </div>
                </div>

                <div class="prod">
                    <div class="column1">
                        <div class="name">Camera</div>

                        <p class="caption">
                            Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích
                            thước
                            nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban
                            ngày và
                            ban đêm.
                        </p>

                    </div>
                    <div class="column2">
                        <img class="image" src="/images/phukien1.jpg" />
                    </div>
                </div>

                <div class="prod">
                    <div class="column1">
                        <div class="name">Camera</div>

                        <p class="caption">
                            Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích
                            thước
                            nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban
                            ngày và
                            ban đêm.
                        </p>
                    </div>
                    <div class="column2">
                        <img class="image" src="/images/thamlot1.jpg" />
                    </div>
                </div>
            </div>


            <div class="prod">
                <div class="column1">
                    <div class="name">Camera</div>

                    <p class="caption">
                        Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích thước
                        nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban ngày và
                        ban đêm.
                    </p>
                    <div class="bt-group">
                        <button class="btn btn-primary" type="submit">New</button>
                        <button class="btn btn-primary" type="submit">Update</button>
                        <button class="btn btn-primary" type="submit">Delete</button>
                        <button class="btn btn-primary" type="submit">Detail</button>
                    </div>
                </div>
                <div class="column2">
                    <img class="image" src="/images/camera1.png" />
                </div>
            </div>

            <div class="prod">
                <div class="column1">
                    <div class="name">Camera</div>

                    <p class="caption">
                        Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích thước
                        nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban ngày và
                        ban đêm.
                    </p>
                    <div class="bt-group">
                        <button class="btn btn-primary" type="submit">New</button>
                        <button class="btn btn-primary" type="submit">Update</button>
                        <button class="btn btn-primary" type="submit">Delete</button>
                        <button class="btn btn-primary" type="submit">Detail</button>
                    </div>
                </div>
                <div class="column2">
                    <img class="image" src="/images/camera1.png" />
                </div>
            </div>

            <div class="prod">
                <div class="column1">
                    <div class="name">Camera</div>

                    <p class="caption">
                        Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích thước
                        nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban ngày và
                        ban đêm.
                    </p>
                    <div class="bt-group">
                        <button class="btn btn-primary" type="submit">New</button>
                        <button class="btn btn-primary" type="submit">Update</button>
                        <button class="btn btn-primary" type="submit">Delete</button>
                        <button class="btn btn-primary" type="submit">Detail</button>
                    </div>
                </div>
                <div class="column2">
                    <img class="image" src="/images/camera1.png" />
                </div>
            </div>

            <div class="prod">
                <div class="column1">
                    <div class="name">Camera</div>

                    <p class="caption">
                        Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích thước
                        nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban ngày và
                        ban đêm.
                    </p>
                    <div class="bt-group">
                        <button class="btn btn-primary" type="submit">New</button>
                        <button class="btn btn-primary" type="submit">Update</button>
                        <button class="btn btn-primary" type="submit">Delete</button>
                        <button class="btn btn-primary" type="submit">Detail</button>
                    </div>
                </div>
                <div class="column2">
                    <img class="image" src="/images/camera1.png" />
                </div>
            </div>

            <div class="prod">
                <div class="column1">
                    <div class="name">Camera</div>

                    <p class="caption">
                        Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích thước
                        nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban ngày và
                        ban đêm.
                    </p>
                    <div class="bt-group">
                        <button class="btn btn-primary" type="submit">New</button>
                        <button class="btn btn-primary" type="submit">Update</button>
                        <button class="btn btn-primary" type="submit">Delete</button>
                        <button class="btn btn-primary" type="submit">Detail</button>
                    </div>
                </div>
                <div class="column2">
                    <img class="image" src="/images/camera1.png" />
                </div>
            </div>

            <div class="prod">
                <div class="column1">
                    <div class="name">Camera</div>

                    <p class="caption">
                        Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích thước
                        nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban ngày và
                        ban đêm.
                    </p>
                    <div class="bt-group">
                        <button class="btn btn-primary" type="submit">New</button>
                        <button class="btn btn-primary" type="submit">Update</button>
                        <button class="btn btn-primary" type="submit">Delete</button>
                        <button class="btn btn-primary" type="submit">Detail</button>
                    </div>
                </div>
                <div class="column2">
                    <img class="image" src="/images/camera1.png" />
                </div>
            </div>

            <div class="prod">
                <div class="column1">
                    <div class="name">Camera</div>

                    <p class="caption">
                        Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích thước
                        nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban ngày và
                        ban đêm.
                    </p>
                    <div class="bt-group">
                        <button class="btn btn-primary" type="submit">New</button>
                        <button class="btn btn-primary" type="submit">Update</button>
                        <button class="btn btn-primary" type="submit">Delete</button>
                        <button class="btn btn-primary" type="submit">Detail</button>
                    </div>
                </div>
                <div class="column2">
                    <img class="image" src="/images/camera1.png" />
                </div>
            </div>

            <div class="prod">
                <div class="column1">
                    <div class="name">Camera</div>

                    <p class="caption">
                        Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích thước
                        nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban ngày và
                        ban đêm.
                    </p>
                    <div class="bt-group">
                        <button class="btn btn-primary" type="submit">New</button>
                        <button class="btn btn-primary" type="submit">Update</button>
                        <button class="btn btn-primary" type="submit">Delete</button>
                        <button class="btn btn-primary" type="submit">Detail</button>
                    </div>
                </div>
                <div class="column2">
                    <img class="image" src="/images/camera1.png" />
                </div>
            </div>

            <div class="prod">
                <div class="column1">
                    <div class="name">Camera</div>

                    <p class="caption">
                        Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích thước
                        nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban ngày và
                        ban đêm.
                    </p>
                    <div class="bt-group">
                        <button class="btn btn-primary" type="submit">New</button>
                        <button class="btn btn-primary" type="submit">Update</button>
                        <button class="btn btn-primary" type="submit">Delete</button>
                        <button class="btn btn-primary" type="submit">Detail</button>
                    </div>
                </div>
                <div class="column2">
                    <img class="image" src="/images/camera1.png" />
                </div>
            </div>


            <div class="prod">
                <div class="column1">
                    <div class="name">Camera</div>

                    <p class="caption">
                        Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích thước
                        nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban ngày và
                        ban đêm.
                    </p>
                    <div class="bt-group">
                        <button class="btn btn-primary" type="submit">New</button>
                        <button class="btn btn-primary" type="submit">Update</button>
                        <button class="btn btn-primary" type="submit">Delete</button>
                        <button class="btn btn-primary" type="submit">Detail</button>
                    </div>
                </div>
                <div class="column2">
                    <img class="image" src="/images/camera1.png" />
                </div>
            </div>

            <div class="prod">
                <div class="column1">
                    <div class="name">Camera</div>

                    <p class="caption">
                        Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích thước
                        nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban ngày và
                        ban đêm.
                    </p>
                    <div class="bt-group">
                        <button class="btn btn-primary" type="submit">New</button>
                        <button class="btn btn-primary" type="submit">Update</button>
                        <button class="btn btn-primary" type="submit">Delete</button>
                        <button class="btn btn-primary" type="submit">Detail</button>
                    </div>
                </div>
                <div class="column2">
                    <img class="image" src="/images/camera1.png" />
                </div>
            </div>

            <div class="prod">
                <div class="column1">
                    <div class="name">Camera</div>

                    <p class="caption">
                        Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích thước
                        nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban ngày và
                        ban đêm.
                    </p>
                    <div class="bt-group">
                        <button class="btn btn-primary" type="submit">New</button>
                        <button class="btn btn-primary" type="submit">Update</button>
                        <button class="btn btn-primary" type="submit">Delete</button>
                        <button class="btn btn-primary" type="submit">Detail</button>
                    </div>
                </div>
                <div class="column2">
                    <img class="image" src="/images/camera1.png" />
                </div>
            </div>

            <div class="prod">
                <div class="column1">
                    <div class="name">Camera</div>

                    <p class="caption">
                        Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích thước
                        nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban ngày và
                        ban đêm.
                    </p>
                    <div class="bt-group">
                        <button class="btn btn-primary" type="submit">New</button>
                        <button class="btn btn-primary" type="submit">Update</button>
                        <button class="btn btn-primary" type="submit">Delete</button>
                        <button class="btn btn-primary" type="submit">Detail</button>
                    </div>
                </div>
                <div class="column2">
                    <img class="image" src="/images/camera1.png" />
                </div>
            </div>

            <div class="prod">
                <div class="column1">
                    <div class="name">Camera</div>

                    <p class="caption">
                        Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích thước
                        nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban ngày và
                        ban đêm.
                    </p>
                    <div class="bt-group">
                        <button class="btn btn-primary" type="submit">New</button>
                        <button class="btn btn-primary" type="submit">Update</button>
                        <button class="btn btn-primary" type="submit">Delete</button>
                        <button class="btn btn-primary" type="submit">Detail</button>
                    </div>
                </div>
                <div class="column2">
                    <img class="image" src="/images/camera1.png" />
                </div>
            </div>

            <div class="prod">
                <div class="column1">
                    <div class="name">Camera</div>

                    <p class="caption">
                        Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích thước
                        nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban ngày và
                        ban đêm.
                    </p>
                    <div class="bt-group">
                        <button class="btn btn-primary" type="submit">New</button>
                        <button class="btn btn-primary" type="submit">Update</button>
                        <button class="btn btn-primary" type="submit">Delete</button>
                        <button class="btn btn-primary" type="submit">Detail</button>
                    </div>
                </div>
                <div class="column2">
                    <img class="image" src="/images/camera1.png" />
                </div>
            </div>

            <div class="prod">
                <div class="column1">
                    <div class="name">Camera</div>

                    <p class="caption">
                        Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích thước
                        nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban ngày và
                        ban đêm.
                    </p>
                    <div class="bt-group">
                        <button class="btn btn-primary" type="submit">New</button>
                        <button class="btn btn-primary" type="submit">Update</button>
                        <button class="btn btn-primary" type="submit">Delete</button>
                        <button class="btn btn-primary" type="submit">Detail</button>
                    </div>
                </div>
                <div class="column2">
                    <img class="image" src="/images/camera1.png" />
                </div>
            </div>

            <div class="prod">
                <div class="column1">
                    <div class="name">Camera</div>

                    <p class="caption">
                        Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích thước
                        nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban ngày và
                        ban đêm.
                    </p>
                    <div class="bt-group">
                        <button class="btn btn-primary" type="submit">New</button>
                        <button class="btn btn-primary" type="submit">Update</button>
                        <button class="btn btn-primary" type="submit">Delete</button>
                        <button class="btn btn-primary" type="submit">Detail</button>
                    </div>
                </div>
                <div class="column2">
                    <img class="image" src="/images/camera1.png" />
                </div>
            </div>

            <div class="prod">
                <div class="column1">
                    <div class="name">Camera</div>

                    <p class="caption">
                        Camera 70Mai M300 là phiên bản nâng cấp mới nhất dựa trên mẫu 70mai Minutes, với có kích thước
                        nhỏ gọn, chất lượng hình ảnh độ phân giải cao 2K cho phép ghi lại hình ảnh rõ nét cả ban ngày và
                        ban đêm.
                    </p>
                    <div class="bt-group">
                        <button class="btn btn-primary" type="submit">New</button>
                        <button class="btn btn-primary" type="submit">Update</button>
                        <button class="btn btn-primary" type="submit">Delete</button>
                        <button class="btn btn-primary" type="submit">Detail</button>
                    </div>
                </div>
                <div class="column2">
                    <img class="image" src="/images/camera1.png" />
                </div>
            </div>


            <!-- Nav tabs -->
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home"
                        type="button" role="tab" aria-controls="home" aria-selected="true">Home</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile"
                        type="button" role="tab" aria-controls="profile" aria-selected="false">Profile</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="messages-tab" data-bs-toggle="tab" data-bs-target="#messages"
                        type="button" role="tab" aria-controls="messages" aria-selected="false">Messages</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="settings-tab" data-bs-toggle="tab" data-bs-target="#settings"
                        type="button" role="tab" aria-controls="settings" aria-selected="false">Settings</button>
                </li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane active" id="home" role="tabpanel" aria-labelledby="home-tab" tabindex="0">...</div>
                <div class="tab-pane" id="profile" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">1313123</div>
                <div class="tab-pane" id="messages" role="tabpanel" aria-labelledby="messages-tab" tabindex="0">321313123
                </div>
                <div class="tab-pane" id="settings" role="tabpanel" aria-labelledby="settings-tab" tabindex="0">...
                </div>
            </div>
        </section>
        <!--end of middle-->

    </main>

	<!-- Link To Base JS -->
    <%@include file="component/_linkJS.jsp" %>
</body>


</html>