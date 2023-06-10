<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="fr" %>
<!DOCTYPE html>
<html lang="en" >

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>B.S.C.Team - CarService</title>
    
    <!-- Link To Base CSS -->
    <%@include file="component/_linkCSS.jsp" %>
    
</head>

<body>
    <!-- Start Header -->
    <%@include file="component/_header.jsp" %>
    <!-- End Header -->

	<main>
        
    <!-- Start Header -->
    <%@include file="component/_menu.jsp" %>
    <!-- End Header -->

        <section class="middle">
            <div class="header">
                <h1>Overview</h1>
               

            </div>

            <div class="cards">
                <div class="card">
                    <div class="top">
                        <div class="left">
                        
                            <h2>Doanh thu</h2>
                        </div>

                       </div>

                    <div class="middle">
                        <h1>$456,89</h1>
                        <div class="chip">
                            
                           <img src="../images/icons8-chart-50.png" alt="" style="width: 50px;">
                        </div>

                    </div>

                    <div class="bottom">
                        

                  
                    </div>

                </div>
                <!--end of card 1-->
                <div class="card">
                    <div class="top">
                        <div class="left">
                        
                            <h2>Số lượng</h2>
                        </div>

                       </div>

                    <div class="middle">
                        <h1>$456,89</h1>
                        <div class="chip">
                            <img src="../images/icons8-money-50.png" alt="" style="width: 50px;">
                                </span>
                        </div>

                    </div>

                    <div class="bottom">
                        

                  
                    </div>

                </div>
                <!--end of card 2-->
                <div class="card">
                    <div class="top">
                        <div class="left">
                        
                            <h2>Chi phí</h2>
                        </div>

                       </div>

                    <div class="middle">
                        <h1>$456,89</h1>
                        <div class="chip">
                            <img src="../images/icons8-expense-64.png" alt="" style="width: 50px;">
                        </div>

                    </div>

                    <div class="bottom">
                        

                  
                    </div>

                </div>
                <!--end of card 3-->
                <div class="card">
                    <div class="top">
                        <div class="left">
                        
                            <h2>Chi phí khác</h2>
                        </div>

                       </div>

                    <div class="middle">
                        <h1>$456,89</h1>
                        <div class="chip">
                            <img src="../images/icons8-transaction-list-64.png" alt="" style="width: 40px;">
                        </div>

                    </div>

                    <div class="bottom">
                        

                  
                    </div>

                </div>
                <!--end of card 4-->
            </div>
            <!--end of cards-->
            <div class="monthly-report">
                <div class="report">
                    <h3>Doanh thu</h3>
                    <div>
                        <details>
                            <h1>$29,023</h1>
                            <h6 class="success">+3.5%</h6>
                        </details>
                        <p class="text-mutes">Compared to 26, 938 last moth</p>
                    </div>
                </div>
                <!--end of income report -->
                <div class="report">
                    <h3>Số lượng</h3>
                    <div>
                        <details>
                            <h1>$9,005</h1>
                            <h6 class="danger">-6.5%</h6>
                        </details>
                        <p class="text-mutes">Compared to $26, 938 last moth</p>
                    </div>
                </div>
                <!--end of income Expenses-->
                <div class="report">
                    <h3>Chi phí</h3>
                    <div>
                        <details>
                            <h1>$4,4507</h1>
                            <h6 class="success">+7.1%</h6>
                        </details>
                        <p class="text-mutes">Compared to 3, 938 last moth</p>
                    </div>
                </div>
                <!--end of income Cashback-->
                <div class="report">
                    <h3>Chi phí khác</h3>
                    <div>
                        <details>
                            <h1>$29,023</h1>
                            <h6 class="success">+3.5%</h6>
                        </details>
                        <p class="text-mutes">Compared to 26, 938 last moth</p>
                    </div>
                </div>
                <!--end of income report -->
            </div>
            <!--end of monthy report-->
            <!--biểu đồ-->
            <div class="div-date ">
                  <div class="col-12">
                    <div class="col-6">
                        <label for="">Từ:</label>
                        <input type="date" class="form-control">
                    </div>
                    <div class="col-6">
                        <label for="">Đến:</label>
                        <input type="date" class="form-control">
                    </div>
                  </div>
                    

            
                
                
               
            </div>
            <canvas id="chart">
                
            </canvas>

        

        </section>
        <!--end of middle-->

      
        <!--end of right-->

    </main>
	
    
	<!-- Link To Chart JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.6.0/chart.min.js"
	        integrity="sha512-GMGzUEevhWh8Tc/njS0bDpwgxdCJLQBWG3Z2Ct+JGOpVnEmjvNx6ts4v6A2XJf1HOrtOsfhv3hBKpK9kE5z8AQ=="
	        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        
	<!-- Link To Base JS -->
    <%@include file="component/_linkJS.jsp" %>
    
</body>

</html>