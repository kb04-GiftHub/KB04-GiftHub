<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기프티콘 사용</title>

<style>
	.nav-link {
	    color: #0058C6 !important;
	}
	
	.nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
	    color: #495057 !important;
	    background-color: #E2EFFF !important;
	}
</style>

 <!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</head>
<body>
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
	
	<div class="container-xxl py-5">
		<div class="container py-5 px-lg-5">
			<div class="wow fadeInUp" data-wow-delay="0.1s">
				<h1 class="text-center mb-5">기프티콘 사용</h1>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-10">
					<div class="wow fadeInUp" data-wow-delay="0.3s">
						<p class="text-center mb-4"></p>
						<div class="row g-3">
							<div class="card">
								<div class="card-body pt-3">
									<c:set var="path" value="${pageContext.request.contextPath}" />
									<!-- Bordered Tabs -->
									<ul class="nav nav-tabs nav-tabs-bordered justify-content-center">
										<li class="nav-item">
											<button id="imageUsed" class="nav-link active" data-bs-toggle="tab"
												data-bs-target="#image_used">
												<strong>기프티콘 이미지</strong>
											</button>
										</li>
						
										<li class="nav-item">
											<button id="codeUsed" class="nav-link" data-bs-toggle="tab"
												data-bs-target="#code_used">
												<strong>쿠폰번호</strong>
											</button>
										</li>
									</ul>
								</div>
						
								<!-- 이미지로 쿠폰사용 -->
								<div class="tab-content pt-2">
									<div class="tab-pane fade show active container py-5 px-lg-5" id="image_used" style="padding-top: 15px !important;">
										<div class="row justify-content-center">
											<div class="col-lg-9">
												<div class="wow">
													<form action="image_use" method="post" enctype="multipart/form-data">
														<div class="row g-3">
															<div class="col-12 text-center" id="image_container"></div>
																<div class="form-floating">
																	<input type="file" class="form-control" name="image" id="imageInput">
																	<label for="imageInput">이미지 파일</label>
																	<input type="hidden" name="storeId" value="${storeUser.storeId}">
																</div>
																<div class="form-floating text-end">
																	<input type="checkbox" id="nonMemberImage"> 비회원
																</div>
																<div class="form-floating text-center">
																	<input type="text" class="form-control" name="customerId"
																		id="idImageForm" placeholder="ID를 입력하세요">
																	<label for="idImageForm">사용자 아이디</label>
																	<div id="msgImg" class="mt-1"></div>
																	<div class="text-end">
																		<button class="mt-1 btn-sm btn-primary" id="btnCheckImg" type="button">ID검사</button>
																	</div>
																</div>
															<div class="col-12">
																<button id="useBtnImg" disabled
																	class="btn btn-primary w-100 py-3" type="submit">쿠폰 사용하기</button>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
									<script>
						            	$(function(){
						            		$('#nonMemberImage').change(function(){
						            			if ($(this).is(":checked")) {
						                            // 체크되었을 때 실행할 코드를 여기에 추가
						                            $('#idImageForm').val('비회원')
						                            $('#idImageForm').prop("readonly",true);
						                            $('#btnCheckImg').css("visibility","hidden")
						                            $('#useBtnImg').prop("disabled",false);
						                        } else {
						                            // 체크가 해제되었을 때 실행할 코드를 여기에 추가
						                            $('#idImageForm').val('')
						                            $('#idImageForm').prop("readonly",false);
						                            $('#btnCheckImg').css("visibility","visible")
						                        }
						            		})
						            		$('#nonMemberCode').change(function(){
						            			if ($(this).is(":checked")) {
						                            $('#idCodeForm').val('비회원')
						                            $('#idCodeForm').prop("readonly",true);
						                            $('#useBtnCode').prop("disabled",false);
						                        } else {
						                            $('#idCodeForm').val('')
						                            $('#idCodeForm').prop("readonly",false);
						                        }
						            		})
						            		
						            		$('#idImageForm').focus(function(){
						            			$('#useBtnImg').prop("disabled",true);
						            			$('#msgImg').html('')
						            		})
						            		$('#idCodeForm').focus(function(){
						            			$('#useBtnCode').prop("disabled",true);
						            			$('#msgCode').html('')
						            		})
						            		
						            		$('#btnCheckImg').click(function(){
						            			var imgIdValue = $('#idImageForm').val()
						            			$.ajax({
						            				type:'get',
						            				url:'/product/checkId?customerId='+imgIdValue,
						            				dataType:'json',
						            				success:function(res){
						            					if(res.res === '실패'){
						            						$('#msgImg').html('<div class="text-danger">ID가 존재하지 않습니다.</div>')
						            						$('#useBtnImg').prop("disabled",true);
						            					}else{
						            						$('#msgImg').html('<div class="text" style="color:green;">ID를 사용 가능합니다.</div>')
						            						$('#useBtnImg').prop("disabled",false);
						            					}
						            				}
						            			})
						            		})
						            		$('#btnCheckCode').click(function(){
						            			var imgIdValue = $('#idCodeForm').val()
						            			$.ajax({
						            				type:'get',
						            				url:'/product/checkId?customerId='+imgIdValue,
						            				dataType:'json',
						            				success:function(res){
						            					if(res.res === '실패'){
						            						$('#msgCode').html('<div class="text-danger">ID가 존재하지 않습니다.</div>')
						            						$('#useBtnCode').prop("disabled",true);
						            					}else{
						            						$('#msgCode').html('<div class="text" style="color:green;">ID를 사용 가능합니다.</div>')
						            						$('#useBtnCode').prop("disabled",false);
						            					}
						            				}
						            			})
						            		})
						            		
						            		
						            	})
						            </script>
									<!-- 쿠폰번호로 쿠폰사용 -->
									<div class="tab-pane fade container show py-5 px-lg-5" id="code_used" >
										<div class="row justify-content-center">
											<div class="col-lg-9">
												<div class="fadeInUp" data-wow-delay="0.1s">
													<form action="code_use" method="post">
														<div class="row g-3">
															<div class="col-12">
																<div class="form-floating">
																	<input type="number" class="form-control mb-1" name="gifticonNo" id="gifticonNoInput" placeholder="쿠폰 번호">
																	<label for="gifticonNoInput">쿠폰번호</label>
																	<input type="hidden" name="storeId" value="${storeUser.storeId}">
																</div>
																<div class="form-floating text-end">
																	<input type="checkbox" id="nonMemberCode"> 비회원
																</div>
																<div class="form-floating text-center">
																	<input type="text" class="form-control" name="customerId" id="idCodeForm" placeholder="ID를 입력하세요">
																	<label for="idCodeForm">사용자 아이디</label> 
																	<div id="msgCode" class="mt-1"></div>
																	<div class="text-end">
																		<button class="mt-1 btn-sm btn-primary" id="btnCheckCode" type="button">ID검사</button>
																	</div>
																</div>
															</div>
															<div class="col-12">
																<button id="useBtnCode" disabled
																	class="btn btn-primary w-100 py-3" type="submit">쿠폰
																	사용하기</button>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
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

	<c:import url="../footer.jsp" />

	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-secondary btn-lg-square back-to-top">
		<i class="bi bi-arrow-up"></i></a>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
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