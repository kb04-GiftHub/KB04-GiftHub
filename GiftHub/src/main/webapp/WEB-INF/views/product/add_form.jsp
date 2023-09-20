<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<meta charset="UTF-8">
<title>상품 등록</title>
	<!-- 선택한 이미지 보여주기 -->
	<script>
   /*  function previewImage() {
        var input = document.getElementById('chooseFile');
        var preview = document.getElementById('preview');

        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                preview.src = e.target.result;
                preview.style.display = 'block';
            }

            reader.readAsDataURL(input.files[0]);
        }
    } */
    
</script>
	<script>
	$(function(){
		$('#chooseFile').change(function(){
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
</head>
<body>
	<c:import url="../top.jsp" />
	<div class="container-xxl py-5 bg-primary hero-header">
		<div class="container my-5 py-5 px-lg-5">
			<div class="row g-5 py-5">
				<div class="col-12 text-center">
					<h1 class="text-white animated slideInDown">기프티콘 등록</h1>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Contact Start -->
	<div class="container-xxl py-5">
		<div class="container py-5 px-lg-5">
			<h1 class="text-center text-black animated slideInDown">상품 등록</h1>
			<div class="row justify-content-center mb-5">
				<div class="col-lg-7 text-center">
					<div class="wow fadeInUp" data-wow-delay="0.3s">
						<form method="post" enctype="multipart/form-data"></form>
					</div>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-7">
					<div class="wow fadeInUp" data-wow-delay="0.3s">
						<form action="product/insert_action" method="POST"
							enctype="multipart/form-data">
							<!-- <img id="preview" src="#" alt="Image Preview"
								style="display: none; max-width: 100%; height: auto;">
							<input type="file" id="chooseFile" name="chooseFile" onchange="previewImage()"> 
							 -->
							<div class="col-12 text-center" id="image_container" style="margin-bottom: 50px;"></div>
							<div class="row g-3">
								<div class="col-12">
									<div class="form-floating">
										<input type="file" class="form-control" id="chooseFile" name="chooseFile">
										<label for="chooseFile">이미지 파일</label>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-floating">
										<input type="text" class="form-control" id="name" name="name"
											placeholder="Your Name"> <label for="name">상품명</label>
									</div>
								</div>

								<div class="col-12">
									<div class="form-floating">
										<input type="text" class="form-control" id="sellingPrice"
											name="sellingPrice" placeholder="Subject"> <label
											for="sellingPrice">판매금액</label>
									</div>
								</div>

								<div class="col-12">
									<div class="form-floating">
										<textarea class="form-control"
											placeholder="Leave a message here" id="productDescription"
											name="productDescription" style="height: 150px"></textarea>
										<label for="productDescription">상품설명</label>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-floating">
										<div>
											<label>판매 기간:</label> <input type="radio" id="expiry30"
												name="expiry" value="30" required checked> <label
												for="expiry30">30일</label> <input type="radio" id="expiry60"
												name="expiry" value="60"> <label for="expiry60">60일</label>
											<input type="radio" id="expiry90" name="expiry" value="90">
											<label for="expiry90">90일</label>
										</div>
									</div>
								</div>

								<div class="col-6">
									<a href="/" class="btn btn-secondary w-100 py-3">취소하기</a>
								</div>
								<div class="col-6">
									<button class="btn btn-primary w-100 py-3" type="submit">등록하기</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Contact End -->

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