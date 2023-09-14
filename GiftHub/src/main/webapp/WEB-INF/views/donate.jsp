<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500&family=Jost:wght@500;600;700&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    
<style>
    /* 플레이스홀더 텍스트 대신 아래에 검정색 선을 표시합니다. */
    .form-floating input[type="text"].border-0,
    .form-floating input[type="password"].border-0 {
        border-bottom: 1px solid #000 !important;
        border-radius: 0 !important;
        box-shadow: none !important;
    }

    /* 포커스 시 선의 색상을 변경합니다. */
    .form-floating input[type="text"].border-0:focus,
    .form-floating input[type="password"].border-0:focus {
        border-bottom: 1px solid #000 !important;
        box-shadow: none !important;
    }
</style>
    
    
</head>
   
<body>       
	<c:import url="top_customer.jsp" />
	    <div class="container-xxl py-5 bg-primary hero-header">
            <div class="container my-5 py-5 px-lg-5">
                <div class="row g-5 py-5">
                    <div class="col-12 text-center">
                        <h1 class="text-white animated slideInDown">우리 기부해요</h1>
                        <hr class="bg-white mx-auto mt-0" style="width: 90px;">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-center">
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Navbar & Hero End -->

  <!-- Contact Start -->
        <div class="container-xxl py-5">
            <div class="container py-5 px-lg-5">
                <div class="wow fadeInUp" data-wow-delay="0.1s">
                    <p class="section-title text-secondary justify-content-center"><span></span>감사합니다<span></span></p>
                    <h1 class="text-center mb-5">기부하기</h1>
                </div>
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="wow fadeInUp" data-wow-delay="0.3s">
                            <p class="text-center mb-4">당신의 작은 정성이 꿈과 희망이 됩니다. <br> 후원금은 홈페이지를 통하여 공개됩니다.</a></p>
                            <form>
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="name" placeholder="Your Name">
                                            <label for="name">성명</label><br>
                                        </div>
                                    </div>
                                 <div class="col-md-6">
                                 <select id="promotionType" name="promotionType">
							        <option value="1">정기</option>
							        <option value="2">일시</option>
							    </select>
							    
    <!-- 포인트 정보 표시 -->
   <p>보유 포인트: <span id="pointBalance">로딩 중...</span> 포인트</p>

<script>
    // 서버에서 포인트 정보 가져오기
    fetch('get_points.php') // get_points.php 파일은 위에서 작성한 PHP 파일이어야 합니다.
        .then(response => response.json())
        .then(data => {
            const pointBalance = document.getElementById('pointBalance');
            pointBalance.textContent = data.points;
        })
        .catch(error => {
            console.error('포인트 정보를 가져오는 중 오류 발생:', error);
        });
</script>


    <!-- 포인트 사용 입력 필드 -->
    <div class="form-floating">
        <input type="number" class="form-control" id="pointToUse" placeholder="사용할 포인트">
        <label for="pointToUse">사용할 포인트</label>
    </div>

<script>
// 현재 보유 포인트
// 현재 보유 포인트 (이 값은 서버에서 가져와야 합니다)
let currentPoints = 500;

// 포인트 사용 버튼 클릭 시
document.getElementById("donationButton").addEventListener("click", function () {
    // 입력한 포인트와 금액 가져오기
    const pointToUse = parseInt(document.getElementById("pointToUse").value);
    const amount = parseInt(document.getElementById("amount").value);

    // 보유 포인트와 입력한 포인트 비교
    if (pointToUse <= currentPoints) {
        // 포인트 차감
        currentPoints -= pointToUse;

        // 실제 결제 금액 표시 (포인트를 사용한 경우 금액에서 차감)
        const paymentAmount = amount - pointToUse;
        
        // 포인트 정보 업데이트
        document.getElementById("pointBalance").textContent = currentPoints;
        
        // 결제 금액 업데이트
        document.getElementById("amount").value = paymentAmount;

        // 여기에 실제 포인트 차감 및 결제 로직 추가
    } else {
        alert("보유한 포인트보다 많은 포인트를 사용할 수 없습니다.");
    }
});

</script>


                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <textarea class="form-control" placeholder="Leave a message here" id="message" style="height: 150px"></textarea>
                                            <label for="message">내용</label>
                                        </div>
                    <div class="form-group">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="privacyCheck">
                                    <label class="form-check-label" for="privacyCheck">기부 증서 발급</label><br>
                                </div>
                                    </div>
                                    <div class="col-12">
    <button class="btn btn-primary w-100 py-3" type="button" id="donationButton">기부하기</button>

<div id="donationBoard">
    <!-- 여기에 기부 내역이 추가될 것입니다. -->
</div>

<script>
document.getElementById("donationButton").addEventListener("click", function() {
    // 사용자가 입력한 정보 가져오기
    const name = document.getElementById("name").value;
    const message = document.getElementById("message").value;
    const pointToUse = parseInt(document.getElementById("pointToUse").value);

    // 게시판에 새로운 게시글 생성
    const newPost = document.createElement("div");
    newPost.classList.add("post");

    // 게시글 내용 작성
    newPost.innerHTML = `
        <h3>${name}</h3>
        <p>${message}</p>
        <p>포인트 사용: ${pointToUse}</p>
    `;

    // 게시판에 추가
    const donationBoard = document.getElementById("donationBoard");
    donationBoard.appendChild(newPost);

    // 페이지 이동을 처리할 JavaScript 코드 (여기에서는 주석 처리)
    // window.location.href = "http://localhost:8080/donation";
});
</script>

<script>
    // 버튼 클릭 이벤트 핸들러 등록
    document.getElementById("donationButton").addEventListener("click", function() {
        // 페이지 이동을 처리할 JavaScript 코드
        window.location.href = "http://localhost:8080/donation";
    });
</script>
                            </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact End -->

  <!-- Newsletter Start -->
        <div class="container-xxl bg-primary newsletter py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container py-5 px-lg-5">
                <div class="row justify-content-center">
                    <div class="col-lg-7 text-center">
                        <p class="section-title text-white justify-content-center"><span></span>THANK YOU<span></span></p>
                        <h1 class="text-center text-white mb-4">Donation Certificate</h1>
                        <p class="text-white mb-4">기부 후 1주일 내로 이메일함으로 기부 증서가 발급됩니다.</p>
                        <div class="position-relative w-100 mt-3">
                            <input class="form-control border-0 rounded-pill w-100 ps-4 pe-5" type="text" placeholder="Enter Your Email" style="height: 48px;">
                            <button type="button" class="btn shadow-none position-absolute top-0 end-0 mt-1 me-2"><i class="fa fa-paper-plane text-primary fs-4"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Newsletter End -->









<!-- gifthub-contact Start -->
<div class="container-fluid bg-primary text-light footer wow fadeIn" data-wow-delay="0.1s">
    <div class="container">
        <div class="row g-5">
            <div class="col-md-12 col-lg-3">
                <div class="col text-center" style="text-align: center;"> <!-- inline style 추가 -->
                    <p class="section-title text-white h5 mb-4">GiftHub Contact<span></span></p>
                    <p><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>
                    <p><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                    <p><i class="fa fa-envelope me-3"></i>info@example.com</p>
                </div>
            </div>
            <div class="col-md-12 col-lg-3">
                <!-- 내용 -->
            </div>
        </div>
    </div>
</div>
<!-- gifthub-contact End -->

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
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