<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<head>
<meta charset="utf-8">
<title>커뮤니티</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500&family=Jost:wght@500;600;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">
</head>

<body>
	<c:import url="../top.jsp" />

	<div class="container-xxl py-5 bg-primary hero-header">
		<div class="container my-5 py-5 px-lg-5">
			<div class="row g-5 py-5">
				<div class="col-12 text-center">
					<h1 class="text-white animated slideInDown">커뮤니티</h1>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$('#imageInput').change(
				function() {
					var file = this.files[0];
					var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
					if (!file.type.match(reg)) {
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}
					document.querySelector('div#image_container').innerHTML = "";
					var reader = new FileReader();
					reader.onload = function(event) {
						var img = document.createElement("img");
						img.setAttribute("src",	event.target.result);
						img.setAttribute("style","width:50%;height:auto;");
						img.setAttribute("class", "rectangular");
						document.querySelector('#image_container').appendChild(img);
					};
					reader.readAsDataURL(this.files[0]);
				})
		})
	</script>
	<!-- Contact Start -->
	<div class="container-xxl py-5">
		<div class="container py-5 px-lg-5">
			<div class="wow fadeInUp" data-wow-delay="0.1s">
				<p class="section-title text-secondary justify-content-center">
					<span></span>커뮤니티<span></span>
				</p>
				<h1 class="text-center mb-5">게시물 등록</h1>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-7">
					<div class="wow fadeInUp" data-wow-delay="0.3s">
						<p class="text-center mb-4">가게 홍보 및 이벤트 게시물을 작성해주세요.</p>
						<form action="/promotion_store/promotion_insert" method="post" modelAttribute="promotionDto" enctype="multipart/form-data">
							<div class="row g-3">
								<div class="col-12">
									<div class="form-floating">
										<select name="promotionType" id="promotionType" class="form-control">
											<option value="1">홍보</option>
											<option value="2">이벤트</option>
										</select>
										<label for="category">게시글 종류</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="text" class="form-control" id="promotionTitle" name="promotionTitle" placeholder="제목">
										<label for="promotionTitle">제목</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<textarea class="form-control" id="promotionContent" name="promotionContent" style="resize: vertical; overflow-y: scroll; height: 150px;"></textarea>
										<label for="promotionContent">내용</label>
									</div>
								</div>
								<div class="col-12 text-center" id=image_container class="pt-2 text-center"></div>
								<div class="col-12">
									<div class="form-floating">
										<input type="file" class="form-control"	name="promotionImage" id="imageInput" placeholder="이미지">
										<label for="promotionImage">이미지 파일</label>
									</div>
									
								</div>
								<div class="col-12">
									<button class="btn btn-primary w-100 py-3" type="submit">등록하기</button>
								</div>
								<a href="promotion_list">게시물 목록으로 이동하기</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Contact End -->


	 <!-- Footer Start -->
        <c:import url="../footer.jsp" />


	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-secondary btn-lg-square back-to-top"><i
		class="bi bi-arrow-up"></i></a>
	

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="lib/wow/wow.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/counterup/counterup.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/isotope/isotope.pkgd.min.js"></script>
	<script src="lib/lightbox/js/lightbox.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>

</html>