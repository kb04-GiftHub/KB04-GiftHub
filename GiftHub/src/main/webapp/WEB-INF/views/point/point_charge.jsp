<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>포인트충전</title>
<style>
	.page-link {
		color: #0058C6 !important;
	}
	
	.page-item.active .page-link {
		background-color: #0058C6 !important;
		border-color: #0058C6 !important;
		color: white !important;
	}
}

</style>
</head>
<body>
	<c:import url="../top_customer.jsp" />
        <div class="container-xxl py-5 bg-primary hero-header">
            <div class="container my-5 py-5 px-lg-5">
                <div class="row g-5 py-5">
                    <div class="col-12 text-center">
                        <h1 class="text-white animated slideInDown">충전하기</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<!-- 충전 Start -->
	<div class="container-xxl py-5">
		<div class="container py-5 px-lg-5">
			<div class="wow fadeInUp" data-wow-delay="0.1s">
				<h1 class="text-center mb-5">CHARGE POINT</h1>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-7">
					<div class="wow fadeInUp" data-wow-delay="0.3s">
					<p class="text-center mb-4"></p>
						<div class="row g-3">
							<div class="col-12">
								<div class="form-floating">
									<h3 style="text-align: center;">MY POINT : <fmt:formatNumber value="${dto.point}" type="currency" currencySymbol=""/>P</h3>
								</div>
							</div>
							<div class="col-12">
								<div class="form-floating">
									<input type="number" class="form-control" id="amount" name="amount" placeholder="충전금액">
									<label for="amount">충전금액</label>
								</div>
							</div>
							<div class="col-12">
								<button id="payBtn" class="btn btn-primary w-100 py-3">결제하기</button>
							</div>
							<div class="col-12">
								<hr style="margin-top: 3rem;">
								<!-- 포인트 내역 테이블 -->
								<c:choose>
									<c:when test="${chargeList.size() > 0}">
										<div class="container mt-5" id="tableSection" style="padding: 0;">
										    <table class="table table-striped" style="text-align: center; margin-bottom: 3rem;">
										        <thead>
										            <tr>
										                <th scope="col">순번</th>
										                <th scope="col">결제번호</th>
										                <th scope="col">충전금액</th>
										                <th scope="col">충전일시</th>
										            </tr>
										        </thead>
										        <tbody>
										            <c:forEach var="charge" items="${chargeList}" varStatus="iterStat">
													    <tr>
													        <th scope="row">${iterStat.index + 1 + (pageSize * (pageNo - 1))}</th>
													        <td>${charge.merchantUid}</td>
													        <td>
													            <fmt:formatNumber value="${charge.chargeAmount}" type="currency" currencySymbol=""/>원
													        </td>
													        <td>
													            <fmt:formatDate value="${charge.chargeDate}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초"/>
													        </td>
													    </tr>
													</c:forEach>
										        </tbody>
										    </table>
										</div>
										<!-- 페이징 -->
										<div class="container mt-4">
										    <nav aria-label="Page navigation example">
										        <ul class="pagination justify-content-center">
										            <c:if test="${not chargePage.first}">
										                <li class="page-item">
										                    <a class="page-link" href="?page=1" aria-label="Previous">
										                        <span aria-hidden="true">&laquo;</span>
										                    </a>
										                </li>
										            </c:if>
										            <c:forEach var="i" begin="1" end="${chargePage.totalPages}">
										                <li class="page-item <c:if test="${i == chargePage.number + 1}">active</c:if>">
										                    <a class="page-link" href="?page=${i}">${i}</a>
										                </li>
										            </c:forEach>
										            <c:if test="${not chargePage.last}">
										                <li class="page-item">
										                    <a class="page-link" href="?page=${chargePage.totalPages}" aria-label="Next">
										                        <span aria-hidden="true">&raquo;</span>
										                    </a>
										                </li>
										            </c:if>
										        </ul>
										    </nav>
										</div>
									</c:when>
									<c:otherwise>
										<div class="container mt-5" id="tableSection" style="padding: 0;">
										    <table class="table table-striped" style="text-align: center; margin-bottom: 3rem;">
										        <thead>
										            <tr>
										                <th scope="col">순번</th>
										                <th scope="col">결제번호</th>
										                <th scope="col">충전금액</th>
										                <th scope="col">충전일시</th>
										            </tr>
										        </thead>
										        <tbody>
										            <tr>
										                <th colspan="4">내역이 존재하지 않습니다.</th>
										            </tr>
										        </tbody>
										    </table>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 충전 End -->

	<c:import url="../footer.jsp" />
	
	<div id="result" class="modal fade" tabindex="-1">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 id="title" class="modal-title"></h5>
	        <button type="button" class="btn-close" onclick="history.go(0);"></button>
	      </div>
	      <div class="modal-body">
	        <p id="content1" style="margin: 0"></p>
	        <p id="content2" style="margin: 0"></p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" onclick="history.go(0);">확인</button>
	      </div>
	    </div>
	  </div>
	</div>

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

	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	
	<script>
		$(document).ready(function(){
			$('#payBtn').click(function(){
				requestPay();
			})
		});
		
		var IMP = window.IMP;  
	  	IMP.init("imp07481554");
	  	
		function requestPay() {
			 if($('#amount').val() < 100){
				 alert('100원부터 결제 가능합니다')
				 return;
			 }
			 
		    IMP.request_pay({
		      pg: "html5_inicis.INIpayTest",
		      pay_method: "card",
		      merchant_uid: new Date().getTime(), // 결제번호
		      name: "GiftHub", //회사이름
		      amount: $('#amount').val(),   // 숫자 타입
		      buyer_name: "${dto.customerName}",
		      buyer_email: "${dto.customerEmail}",
		      buyer_tel: "${dto.customerTel}",
		      buyer_postcode : "${dto.customerAdd1}",
		      buyer_addr: "${dto.customerAdd2}"
		    }, function(rsp) {
		    	console.log(rsp);
			    if ( rsp.success ) {
			    	$.ajax({
			        	type: "POST",
		                url: "/member/point_charge_action",
		                data: { impUid: rsp.imp_uid, merchantUid: rsp.merchant_uid, chargeAmount : rsp.paid_amount },
			        }).done(function(data){
			        	var msg1 = '충전이 완료되었습니다.';
				    	var paidAmount = Number(rsp.paid_amount);
				    	var formattedAmount = paidAmount.toLocaleString('ko-KR', {
				    	});
				    	var msg2 = formattedAmount + ' 포인트가 충전되었습니다.';
				    	
				    	$('#title').text('포인트 충전 완료');
				        $('#content1').text(msg1);
				        $('#content2').text(msg2);
						$('#result').modal('show');
			        });
			    } else {
			    	 var msg1 = '결제에 실패하였습니다.';
			         var msg2 = rsp.error_msg + '.';
			         $('#title').text('포인트 충전 실패');
			         $('#content1').text(msg1);
			         $('#content2').text(msg2);
			         $('#result').modal('show');
			    }
		    });
		}
	</script>

	<!-- Template Javascript -->
	<script src="/js/main.js"></script>
</body>
</html>
