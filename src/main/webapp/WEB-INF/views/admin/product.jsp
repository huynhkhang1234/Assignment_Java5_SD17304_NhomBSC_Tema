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

    <!-- Link To Own CSS -->
    <link rel="stylesheet" href="../css/Product_MAN.css">
    
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
        integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g=="
        crossorigin="anonymous" />
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"
        integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw=="
        crossorigin="anonymous" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

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
                data-bs-whatever="@mdo">Add New</button>

            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
               
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Thêm Sản Phẩm</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                         <form action="/admin/save" modelAttribute="products">
                        	<div class="modal-body">
                        
                                <div class="col-md-6">
                                    <label for="inputId" class="form-label">Mã:</label>                                   
                                    <input name="id" value="${products.id}" class="form-control"/>
                                    
                                </div>
                                
                                <div class="col-md-6">
                                    <label for="inputTitle" class="form-label">Tiêu đề:</label>
                                    <input name="titles" value="${products.titles}" class="form-control" />
                                </div>
                                
                                <div class="col-md-12">
                                    <label for="inputPrice" class="form-label">Giá:</label>
                                    <input name="price" value="${products.price}" class="form-control" />
                                    
                                </div>

                                <div class="col-md-12">
                                    <label for="inputCraetDate" class="form-label">Ngày đăng:</label>
                                    <input name="create_date" value="${products.create_date}" class="form-control" />
                                    
                                </div>
                                
                                <div class="col-md-12">
                                    <label for="inputCraetDate" class="form-label">Ngày cập nhật:</label>
                                    <input name="update_date" value="${products.update_date}" class="form-control" />
                                    
                                </div>

                                <div class="col-md-12">
                                    <label for="categoryId" class="form-label">Loại:</label>
									<input name="categories_id" value="${products.categories.id}" class="form-control" />
									
                                </div>

                                <fieldset class="row mb-3" style="margin-top: 1rem;">
                                    <legend class="col-form-label col-sm-2 pt-0">Trạng thái:</legend>
                                    <div class="col-sm-4">      
                                        <div class="form-check">
                                        
                                            <input name="is_active" value="${products.is_active}" class="form-check-input" 
                                            type="radio" name="gridRadios" id="gridRadios1" value="option1" checked/>
                                                
                                            <label class="form-check-label" for="gridRadios1">
                                                Còn hàng
                                            </label>
                                        </div>
                                    </div>
                                    
                                    <div class="col-sm-4">
                                    
                                        <div class="form-check">
                                            <input name="is_active" value="${products.is_active}" class="form-check-input" 
                                            type="radio" name="gridRadios" id="gridRadios2" value="option2"/>
                                                
                                            <label class="form-check-label" for="gridRadios2">
                                                Hết hàng
                                            </label>
                                        </div>
                                    </div>
                                </fieldset>

                                <div class="col-md-12">
                                    <label for="inputSuppliers" class="form-label">Nhà cung cấp:</label>
                                    <input name="suppliers_id" value="${products.suppliers.id}" class="form-control"/>
                                </div>
                                
                                <div class="col-md-6">
                                    <label for="inputSuppliers" class="form-label">Giá gốc:</label>
                                    <input name="original_price" value="${products.original_price}" class="form-control"/>
                                    
                                </div>
                                
                                <div class="col-md-6">
                                    <label for="inputSuppliers" class="form-label">Giảm gía:</label>
                                    <input name="discounts_id" value="${products.discounts.id}" class="form-control"/>
                                    
                                </div>
                                
                            
                                <label class="form-label" for="customFile">Tải ảnh:</label>
                                <input name="images" value="${products.images}" type="file" class="form-control" id="customFile"/>
                                    

                                <div class="col-12">
                                    <label for="inputDescription" class="form-label">Mô tả</label>
                                    <textarea name="description" value="${products.description}" class="form-control" placeholder="Viết bình luận của bạn" ></textarea>
                                </div>
                        	</div>                        
                        
	                        <div class="modal-footer">
	                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
	                            
	                            <button type="button" class="btn btn-primary">Thêm mới</button>
	                        </div> 
                       </form>
                    </div>
                </div>
            </div>
            


            <div class="tab">
      
                <ul class="nav nav-pills mb-3 avtive" id="pills-tab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill"
                            data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home"
                            aria-selected="true">Sản phẩm</button>
                    </li>
                    <li class="nav-item " role="presentation">
                        <button class="nav-link " id="pills-profile-tab" data-bs-toggle="pill"
                            data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile"
                            aria-selected="false">Mã giảm giá</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill"
                            data-bs-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact"
                            aria-selected="false">Loại sản phẩm</button>
                    </li>
                </ul>

                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
    
                        <!-- đèn -->
                        <div class="list-products">
                            <div class="title">
                                <h2>Đèn ô tô</h2>
                            </div>
                            <div class="container">
                                <div class="row">
                                <c:forEach var="item" items="${list}">
                                    <div class="owl-carousel owl-theme">
                                        <div class="item">
                                            <div class="column1">
                                            
                                            	
                                             
                                                	<div class="name">${item.titles}</div>
                                                	<div class="caption">  
	                                                    <ul>
	                                                        <li class="price">Price: ${item.price}</li>
	                                                        <li>Ngày đăng: ${item.create_date}</li>
	                                                        <li>Ngày cập nhật: ${item.update_date}</li>
	                                                        <li>Loại: ${item.categories.id}</li>
	                                                        <li>Trạng thái: ${item.is_active}</li>
	                                                        <li>Nhà cung cấp: ${item.suppliers.id}</li>
	                                                        <li>Giá gốc: ${item.original_price}</li>
	                                                        <li>Giảm giá: ${item.discounts.id}</li>
	                                                        <li>Mô tả: ${item.description}</li>
	                                                    </ul>
	                                                    </div>
                                            </div>
                                            
                                            <div class="column2">
                                                <img class="image" src="/images/den1.jpg" />
                                            </div>

                                            <div class="btn-product">
                                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            								
            									<a href="/admin/edit/${item.id}">
                                                     <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
	                                                    data-bs-whatever="@mdo" id="add-product">
	                                                    <i class="bi bi-pencil-square"></i>Edit
                                                    </button>
                                               	</a> 
                
                                                    <button class="btn btn-danger">
                                                        <i class="bi bi-trash"></i> 
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                         
                                    </div>                                   
                               </c:forEach>
                               
                                </div>
                            </div>
                        </div>
                    </div>

                     
                    <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">						
							<section class="middle">
								<!--form-->
                           <form action="/admin/save" modelAttribute="discounts">
								<div class="above">
									<div class="row">
										<!--row1-->

										<div class="col-6">
											<div class="col-auto">
												<label class="col-form-label">Mã:</label>
											</div>

											<input name="id" value="${discounts.id}" class="form-control" />
										</div>

										<div class="col-6">
											<div class="col-auto">
												<label class="col-form-label">Tiêu đề:</label>
											</div>

											<input name="titles" value="${discounts.titles}" class="form-control" />
										</div>

										<div class="col-12">
											<div class="col-auto">
												<label class="col-form-label">Giảm giá:</label>
											</div>

											<input name="price_discounts" value="${discounts.price_discounts}"
											 type="number" class="form-control" />
										</div>

										<div class="col-6">
											<div class="col-auto">
												<label class="col-form-label">Ngày bắt đầu</label>
											</div>
											<input name="start_day" value="${discounts.start_day}" class="form-control"/>
										</div>

										<!--row2-->
											<div class="col-6">
												<div class="col-auto">
													<label class="col-form-label">Ngày kết thúc</label>
												</div>
											<input name="end_day" value="${discounts.end_day}" class="form-control" />
										</div>

										<div class="col-12">
											<div class="col-auto">
												<label class="col-form-label">Mô tả</label>
											</div>
									
											<textarea name="descriptions" value="${discounts.descriptions}" class="form-control"
												placeholder="Leave a comment here" style="height: 100px"></textarea>
												
											<label for="floatingTextarea2"></label>							
										</div>
									</div>
									<!--btn-->

									<div class="btn-add">
										<div class="d-grid gap-2 d-md-flex justify-content-md-end">

											<a href="/admin/reset">
												<button class="btn btn-primary">
													<i class="bi bi-bootstrap-reboot"></i>reset
												</button> 
											</a>

											<button class="btn btn-primary">
												<i class="bi bi-plus-lg"></i>create
											</button>

											<button formaction="/admin/update/${discounts.id}" class="btn btn-primary">
												<i class="bi bi-pencil-square"></i>update
											</button>

										</div>
									</div>
								</div>
							</form>
							
								<div class="below">
									<div class="table-responsive mt-5" style="overflow-x: auto">
										<table class="table table-bordered col-12">
											<thead>
												<tr>
													<th>Mã</th>
													<th>Tiêu đề</th>
													<th>Giảm giá</th>
													<th>Ngày bắt đầu</th>
													<th>Ngày kết thúc</th>
													<th>Mô tả</th>
													<th></th>
												</tr>
											</thead>

											<tbody>
												<c:forEach var="item" items="${listDis}">
													<tr>
														<td>${item.id}</td>
														<td>${item.titles}</td>
														<td>${item.price_discounts}</td>
														<td>${item.start_day}</td>
														<td>${item.end_day}</td>
														<td>${item.descriptions}</td>

														<td><a href="/admin/edit/${item.id}">
																<button class="btn btn-primary">
																	<i class="bi bi-pencil-square"></i>Edit
																</button>
															</a> 
																
															<a href="/admin/delete/${discounts.id}">
																<button class="btn btn-danger">
																	<i class="bi bi-trash"></i>delete
																</button>
															</a>
														</td>
														
													</tr>
												</c:forEach>
											</tbody>

										</table>


										<nav class="d-flex justify-content-center">
											<ul class="pagination pagination-s">
												<li class="page-item disabled"><a class="page-link"
													href="#" tabindex="-1">1</a></li>
												<li class="page-item"><a class="page-link" href="#">2</a></li>
												<li class="page-item"><a class="page-link" href="#">3</a></li>
											</ul>
										</nav>

									</div>
								</div>
							</section>
						
					</div>

                    <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab"> 
                        <section class="middle">
                            <!--from-->
                          <form action="/admin/save" modelAttribute="categories">
                            <div class="above">
                                <div class="row">
                                    <!--row1-->
                                    <div class="col-12">
                                        <div class="col-auto">
                                            <label class="col-form-label">Mã:</label>
                                        </div>
                                        <div class="col-auto">
                                            <input name="id" value="${categories.id}" class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="col-auto">
                                            <label class="col-form-label">Tên:</label>
                                        </div>
                                        <div class="col-auto">
                                            <input name="names" value="${categories.names}" class="form-control"/>
                                        </div>
                                    </div>
                                </div>
                                <!--btn-->
    
                                <div class="btn-add">
                                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
	                                     <a href="/admin/reset">
	                                      	<button class="btn btn-primary">
	                                           <i class="bi bi-bootstrap-reboot"></i>reset
	                                        </button>
	                                      </a>
	                                                
	                                     <button class="btn btn-primary">
	                                            <i class="bi bi-plus-lg"></i>create
	                                     </button>
	                                       
										<button formaction="/admin/update/${categories.id}" class="btn btn-primary">
											<i class="bi bi-pencil-square"></i>update
										</button>
                                    </div>
                                </div>
                            </div>
                            </form>
                            
                            <div class="below">
                                <div class="table-responsive mt-5" style="overflow-x: auto">
                                    <table class="table table-bordered col-12">
                                        <thead>
                                            <tr>
                                                <th>Mã:</th>
                                                <th>Tên:</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                           <c:forEach var="item" items="${listCate}">
                                            <tr>
                                                <td>${item.id}</td>
                                                <td>${item.names}</td>                                                  
                                                <td>
                                               
                                                <a href="/admin/edit/${item.id}">
                                                	<button class="btn btn-primary">
                                                        <i class="bi bi-pencil-square"></i>edit
                                                    </button>
                                                </a>
                                                     
            									<a href="/admin/delete/${categories.id}">
                                                    <button class="btn btn-danger">
                                                        <i class="bi bi-trash"></i>delete
                                                    </button>
                                                 </a>
                                                 
                                                </td>                                    
                                            </tr>
                                            </c:forEach>
    
                                        </tbody>
                                    </table>
    
                                    <nav class="d-flex justify-content-center">
                                        <ul class="pagination pagination-s">
                                            <li class="page-item disabled">
                                                <a class="page-link" href="#" tabindex="-1">1</a>
                                            </li>
                                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        </ul>
                                    </nav>   
                                </div>
                            </div> 
                        </section>
                        
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
    const sidebarActive = document.querySelector('.sidebar#product');

    sidebarList.forEach((sidebar) => {
    	sidebar.firstElementChild.classList.remove('active');
        });
    sidebarActive.firstElementChild.classList.add('active');
    </script>
    
    <script type="text/javascript">
        $(document).ready(function () {
            $(".owl-carousel").owlCarousel();
        });

        $('.owl-carousel').owlCarousel({
            loop: true,
            margin: 10,
            nav: true,
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 2
                },
                1000: {
                    items: 3
                }
            }
        })
    </script>
    
</body>


</html>