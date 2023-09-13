<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기프티콘 사용</title>
 <!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<c:import url="../top.jsp" />
	<div class="container-xxl py-5 bg-primary hero-header">
		<div class="container my-5 py-5 px-lg-5">
			<div class="row g-5 py-5">
				<div class="col-12 text-center">
					<h1 class="text-white animated slideInDown">기프티콘 관리</h1>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(function(){
		$('#imageInput').change(function(){
			var file = this.files[0];
			var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
		    if (!file.type.match(reg)) {
		        alert("확장자는 이미지 확장자만 가능합니다.");
		        return;
		    }
			document.querySelector('#image_container').innerHTML="";
			var reader = new FileReader();
			reader.onload = function(event) {
				var img = document.createElement("img");
				img.setAttribute("src", event.target.result);
				img.setAttribute("style", "width:50%;height:auto;");
				img.setAttribute("class","rectangular border");
				document.querySelector('#image_container').appendChild(img);
			};
			reader.readAsDataURL(this.files[0]);
		})
	})
	</script>
		
	<!-- Contact Start -->
        <div class="container-xxl py-5">
					<h1 class="text-center text-black animated slideInDown">기프티콘 사용</h1>
					<div class="card">
          <div class="card-body pt-3">
          
          <script>
          	//$(function(){
          		//$('#imageUsed').click(function(){
          		//	var file = $('#imageInput').files[0];
          		//	 if (!file) {
          		   //     // 파일 입력 요소의 값을 비웁니다.
          		   //     this.value = ''; // 이렇게 하면 다시 선택할 수 있습니다.
          		  //  }
          		//})
         // 	})
          </script>
          <c:set var="path" value="${pageContext.request.contextPath}" />
            <!-- Bordered Tabs -->
            <ul class="nav nav-tabs nav-tabs-bordered justify-content-center">
              <li class="nav-item">
                <button id="imageUsed" class="nav-link active" data-bs-toggle="tab" data-bs-target="#image_used"><strong>기프티콘 이미지</strong></button>
              </li>

              <li class="nav-item">
                <button id="codeUsed" class="nav-link" data-bs-toggle="tab" data-bs-target="#code_used"><strong>쿠폰번호</strong></button>
              </li>
            </ul>
            </div>
			
			<!-- 이미지로 쿠폰사용 -->	
			<div class="tab-content pt-2">		
	            <div class="tab-pane fade show active container py-5 px-lg-5" id="image_used">
	                <div class="row justify-content-center">
	                    <div class="col-lg-7">
	                        <div class="wow">
	                            <form action="image_use" method="post" enctype="multipart/form-data">
	                                <div class="row g-3">
	                                    	 <div class="col-12 text-center" id="image_container"></div>
	                                    <div class="col-12">
	                                        <div class="form-floating">
	                                            <input type="file" class="form-control" name="image" id="imageInput" placeholder="이미지">
	                                        </div>
	                                    </div>
	                                    <div class="col-12">
	                                        <button class="btn btn-primary w-100 py-3" type="submit">쿠폰 사용하기</button>
	                                    </div>
	                                    <div class="col-12">
	                                        <a href="barcode_generate?userId=123123123" class="btn btn-primary w-100 py-3">바코드</a>
	                                    </div>
	                                </div>
	                            </form>
	                        </div>
	                    </div>
	                </div>
	            </div>
            
            <!-- 쿠폰번호로 쿠폰사용 -->
            <div class="tab-pane fade container show py-5 px-lg-5" id="code_used">
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="fadeInUp" data-wow-delay="0.1s">
                            <form action="code_use" method="post">
                                <div class="row g-3">
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <input type="number" class="form-control" name="gifticonNo" id="gifticonNoInput" placeholder="쿠폰번호">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button class="btn btn-primary w-100 py-3" type="submit">쿠폰 사용하기</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            
            
        </div>
        <!-- Contact End -->
	
	<c:import url="../footer.jsp" />








	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-secondary btn-lg-square back-to-top"><i
		class="bi bi-arrow-up"></i></a>
	</div>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/lib/wow/wow.min.js"></script>
	<script src="/lib/easing/easing.min.js"></script>
	<script src="/lib/waypoints/waypoints.min.js"></script>
	<script src="/lib/counterup/counterup.min.js"></script>
	<script src="/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="/lib/isotope/isotope.pkgd.min.js"></script>
	<script src="/lib/lightbox/js/lightbox.min.js"></script>

	<!-- Template Javascript -->
	<script src="/js/main.js"></script>
</body>
</html>