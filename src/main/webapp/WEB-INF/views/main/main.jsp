<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="gnb" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<ul>
		<li class="solution" id="gnb_solution">솔루션소개</li>
		<li class="business" id="gnb_business">사업소개</li>
		<li class="product" id="gnb_product">제품소개</li>
		<li class="prcenter" id="gnb_prcenter">구축현황</li>
		<li class="inquiry" id="gnb_inquiry">CS CENTER</li>
	</ul>
</div>
 
<div id="mainVisual" class="main" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<div class="load_slider">
		<div class="bx_slider">
			<div class="bx_slide">
				<img src="${pageContext.request.contextPath }/resources/img/main/main1.jpg"/>
				<div class="slide_text">
					<p>솔루션과 서비스는 고객의</p>
					<p>IT Issue를 빠르게 해결해 드립니다.</p>
				
				</div>
			</div>
			
			<div class="bx_slide">
				<img src="${pageContext.request.contextPath }/resources/img/main/main2.jpg"/>
				<div class="slide_text">
					<p>솔루션과 서비스는 고객의</p>
					<p>IT Issue를 빠르게 해결해 드립니다.</p>
				</div>
			</div>
			
			<div class="bx_slide">
				<img src="${pageContext.request.contextPath }/resources/img/main/main3.jpg"/>
				<div class="slide_text">
					<p>솔루션과 서비스는 고객의</p>
					<p>IT Issue를 빠르게 해결해 드립니다.</p>
				</div>
			</div>
		</div>
	</div>
		
	<div class="scroll_indicator">
		<a href="#">
			<span class="mouse"></span>
			<span class="arrow"></span><span class="arrow"></span>
		</a>
	</div>
	
	
</div>

<div class="section solution" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<div class="section-inner solution-inner gnb_solution">
	
		<div class="main_heading" data-aos="fade-up">SOLUTION</div>
			
		<div>고객 집중<br/>운영 레시피</div>
		
		<div>
			<span>4차 산업혁명 선도기업</span> 에이앤디솔루션스는 소규모 음식점/카페 등의 소상공인들에게<br />
			최적화된 우수한 소프트웨어를 합리적으로 제공하기 위한 <span>IT SOLUTION 브랜드</span> 입니다
		</div>
		
		<div>
			<ul>
				<li data-aos="fade-up" data-aos-delay="100">
					<h2>1</h2>
					<h4>고객 만족도 향상</h4>
					<p>몇 번의 터치로</p>
					<p>주문/결제를 한번에</p>
				</li>
				
				<li data-aos="fade-up" data-aos-delay="300">
					<h2>2</h2>
					<h4>효율적인 운영</h4>
					<p>고객 서비스 집중으로</p>
					<p>높은 경제적 가치</p>
				</li>
				
				<li data-aos="fade-up" data-aos-delay="500">
					<h2>3</h2>
					<h4>최고의 가성비</h4>
					<p>멀티미디어 기능을</p>
					<p>이용한 광고효과</p>
				</li>
				
				<li data-aos="fade-up" data-aos-delay="700">
					<h2>4</h2>
					<h4>글로벌 경제력</h4>
					<p>다국어 지원으로</p>
					<p>외국인 고객 확보</p>
				</li>
			</ul>
		</div>
		
	</div>
</div>

<div class="section business" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<div class="section-inner business-inner gnb_business">
		<div class="main_heading" data-aos="fade-up">BUSINESS</div>
		<div class="sub_heading" data-aos="fade-up">채용에서 관리까지, 옆에 있어 든든한 나만의 인사팀</div>
		
		<div class="business_img kiosk">
			<img src="${pageContext.request.contextPath }/resources/img/main/kiosk.jpg" />
			<div class="img_bg"></div>
			
			<div class="img_text">
				<h3>KIOSK</h3>
				<p>키오스크 키오스크 키오스크</p>
			</div>
		</div>
		
		<div class="business_img app">
			<img src="${pageContext.request.contextPath }/resources/img/main/app.jpg" />
			<div class="img_bg"></div>
			<div class="img_text">
				<h3>APPLICATION</h3>
				<p>애플리케이션 애플리케이션 애플리케이션</p>
			</div>
		</div>
		
	</div>
</div>

<div class="section product" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<div class="section-inner product-inner gnb_product">
		<div class="main_heading" data-aos="fade-up">KIOSK</div>
		<div class="sub_heading" data-aos="fade-up">채용에서 관리까지, 옆에 있어 든든한 나만의 인사팀</div>
		
		<div class="card_area">
  
			<div class="card">
				<div class="card-inner">
				
					<div class="card_front card_face">
						<div class="img_area">
							<img src="${pageContext.request.contextPath }/resources/img/main/product_img1.png"/>
						</div>
						<div class="text_area">
							<div>비티원터치 미니</div>
							<div>젊고/어린 손님이 많은 공간 활용도가 있는 매장용</div>
							<div>월<span> 88,000</span>원</div>
						</div>
					</div>
					
					<div class="card_back card_face">
						<div>
							<h3 class="title">비티원터치 미니</h3>
							<div class="exp">감각적인 슬림디자인 1인매장부터 대형매장! NICE그룹의 기술과 노하우가 집약된 신제품!</div>
							<p>실시간 매출을 웹과 모바일로 제공</p>
							<p>결제기능 : 카드전용</p>
							<div class="btn">추천매장</div>
							<div class="btn_exp">1인매장부터 프랜차이즈 / 공연장 / 약국 / 병원 어디든!</div>
							<div class="btn">고객사</div>
							<div class="btn_exp">공차코리아, 유비케어약국</div>
						</div>
					</div>
				
				</div>
				
			</div>
			
			<div class="card">
				<div class="card-inner">
				
					<div class="card_front card_face">
						<div class="img_area">
							<img src="${pageContext.request.contextPath }/resources/img/main/product_img1.png"/>
						</div>
						<div class="text_area">
							<div>비티원터치 미니</div>
							<div>젊고/어린 손님이 많은 공간 활용도가 있는 매장용</div>
							<div>월<span> 88,000</span>원</div>
						</div>
					</div>
					
					<div class="card_back card_face">
						<div>
							<h3 class="title">비티원터치 미니</h3>
							<div class="exp">감각적인 슬림디자인 1인매장부터 대형매장! NICE그룹의 기술과 노하우가 집약된 신제품!</div>
							<p>실시간 매출을 웹과 모바일로 제공</p>
							<p>결제기능 : 카드전용</p>
							<div class="btn">추천매장</div>
							<div class="btn_exp">1인매장부터 프랜차이즈 / 공연장 / 약국 / 병원 어디든!</div>
							<div class="btn">고객사</div>
							<div class="btn_exp">공차코리아, 유비케어약국</div>
						</div>
					</div>
				
				</div>
				
			</div>
			
			<div class="card">
				<div class="card-inner">
				
					<div class="card_front card_face">
						<div class="img_area">
							<img src="${pageContext.request.contextPath }/resources/img/main/product_img1.png"/>
						</div>
						<div class="text_area">
							<div>비티원터치 미니</div>
							<div>젊고/어린 손님이 많은 공간 활용도가 있는 매장용</div>
							<div>월<span> 88,000</span>원</div>
						</div>
					</div>
					
					<div class="card_back card_face">
						<div>
							<h3 class="title">비티원터치 미니</h3>
							<div class="exp">감각적인 슬림디자인 1인매장부터 대형매장! NICE그룹의 기술과 노하우가 집약된 신제품!</div>
							<p>실시간 매출을 웹과 모바일로 제공</p>
							<p>결제기능 : 카드전용</p>
							<div class="btn">추천매장</div>
							<div class="btn_exp">1인매장부터 프랜차이즈 / 공연장 / 약국 / 병원 어디든!</div>
							<div class="btn">고객사</div>
							<div class="btn_exp">공차코리아, 유비케어약국</div>
						</div>
					</div>
				
				</div>
				
			</div>
			
			<div class="card">
				<div class="card-inner">
				
					<div class="card_front card_face">
						<div class="img_area">
							<img src="${pageContext.request.contextPath }/resources/img/main/product_img1.png"/>
						</div>
						<div class="text_area">
							<div>비티원터치 미니</div>
							<div>젊고/어린 손님이 많은 공간 활용도가 있는 매장용</div>
							<div>월<span> 88,000</span>원</div>
						</div>
					</div>
					
					<div class="card_back card_face">
						<div>
							<h3 class="title">비티원터치 미니</h3>
							<div class="exp">감각적인 슬림디자인 1인매장부터 대형매장! NICE그룹의 기술과 노하우가 집약된 신제품!</div>
							<p>실시간 매출을 웹과 모바일로 제공</p>
							<p>결제기능 : 카드전용</p>
							<div class="btn">추천매장</div>
							<div class="btn_exp">1인매장부터 프랜차이즈 / 공연장 / 약국 / 병원 어디든!</div>
							<div class="btn">고객사</div>
							<div class="btn_exp">공차코리아, 유비케어약국</div>
						</div>
					</div>
				
				</div>
				
			</div>
			
		</div>
	</div>
</div>

<div class="section prcenter" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<div class="section-inner prcenter-inner gnb_prcenter">
		<div class="main_heading" data-aos="fade-up">PR CENTER</div>
		<div class="sub_heading" data-aos="fade-up">채용에서 관리까지, 옆에 있어 든든한 나만의 인사팀</div>
		
		<div class="img_area">
			<ul>
				<li data-aos="fade-right" data-aos-delay="100" data-img-idx="0"><img src="${pageContext.request.contextPath }/resources/img/main/pr1.jpg"></li>		
				<li data-aos="fade-right" data-aos-delay="300" data-img-idx="1"><img src="${pageContext.request.contextPath }/resources/img/main/pr2.jpg"></li>		
				<li data-aos="fade-right" data-aos-delay="500" data-img-idx="2"><img src="${pageContext.request.contextPath }/resources/img/main/pr3.jpg"></li>		
				<li data-aos="fade-right" data-aos-delay="700" data-img-idx="3"><img src="${pageContext.request.contextPath }/resources/img/main/pr4.jpg"></li>		
				<li data-aos="fade-right" data-aos-delay="900" data-img-idx="4"><img src="${pageContext.request.contextPath }/resources/img/main/pr5.jpg"></li>		
				<li data-aos="fade-right" data-aos-delay="1100" data-img-idx="5"><img src="${pageContext.request.contextPath }/resources/img/main/pr6.jpg"></li>		
				<li data-aos="fade-right" data-aos-delay="1300" data-img-idx="6"><img src="${pageContext.request.contextPath }/resources/img/main/pr7.jpg"></li>		
				<li data-aos="fade-right" data-aos-delay="1500" data-img-idx="7"><img src="${pageContext.request.contextPath }/resources/img/main/pr8.jpg"></li>		
				<li data-aos="fade-right" data-aos-delay="1700" data-img-idx="8"><img src="${pageContext.request.contextPath }/resources/img/main/pr9.jpg"></li>		
				<li data-aos="fade-right" data-aos-delay="1900" data-img-idx="9"><img src="${pageContext.request.contextPath }/resources/img/main/pr10.jpg"></li>		
			</ul>
		</div>
		
	</div>
	
	<div class="intro_area">
		<div class="intro-inner">
			<div>
				<p>COMPANY</p>
				<p>INTRODUCTION</p>
			</div>
		
		
			<div>
				에이앤디솔루션스는 앞으로도 서비스 품질의 지속적인 혁신을 통해 경쟁력을 유지하며, 신규 시장 개척과 사업 발굴을 통해 새로운 성장 동력을 확보하고, 기업의 고객, 파트너 그리고 지역사회 모두가 함께 할 수 있는 상호 협력과 발전의 모델을 만들어 나갈 것입니다. 
			</div>
		</div>
	</div>
	
</div>

<div class="section inquiry">
	<div class="section-inner inquiry-inner gnb_inquiry">
	
		<div class="main_heading" data-aos="fade-up" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">INQUIRY REQUEST</div>
		<div class="sub_heading" data-aos="fade-up" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">상세히 기재해주시면 더욱 정확한 상담이 가능합니다.</div>
		
		<div class="inquiry_form">
		  
			<div class="inquiry_form-inner">
			
				<form action="${pageContext.request.contextPath}/main/inquiry" method="post" enctype="multipart/form-data">
			
				<div class="input left input-outer">
					<label class="label">성함 *</label>
					<input type="text" class="inputText inputName" name="name">
				</div>
				
				<div class="input left input-outer">
					<label class="label">연락처 *</label>
					<input type="tel" class="inputText inputPhone" name="phone">
				</div>
				
				
				<div class="input left input-outer">
					<label class="label">이메일 *</label>
					<input type="email" class="inputText inputMail" name="email">
				</div>
				
				<div class="input left input-file-outer">
					<label class="label">첨부파일</label>
					<!-- <span class="fileName">abc.jpg</span> -->
					<input class="fileName" disabled="disabled"/>
				</div>
				
				<div class="left">
					<label for="upload_file" class="fileLabel">파일첨부</label>
					<input type="file" id="upload_file" class="file" name="queFile">
				</div>
				
				
				<div oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
					<p>1. 수집하는 개인정보 항목</p>
					<p>&emsp;본 사이트는 온라인 상담을 위해 아래와 같은 개인정보를 수집하고 있습니다.</p>
					<p>&emsp;수집항목 : 담당자성함, 연락처, 이메일</p>
					<p>&emsp;개인정보 수집방법 : 홈페이지 상담 신청</p>
					<p>2. 개인정보의 수집 및 이용목적</p>
					<p>&emsp;회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.</p>
					<p>&emsp;키오스크 구매 상담 및 견적</p>
					<p>3. 개인정보의 보유 및 이용기간</p>
					<p>&emsp;원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.</p>
				</div>
				
				<div class="input-outer">
					<textarea placeholder="문의내용" class="inputContent" name="queContent" wrap="hard"></textarea>
				</div>
				<input type="submit" value="견적신청 작성" class="btn"  oncontextmenu="return false" ondragstart="return false" onselectstart="return false"/>
				</form>
			
			</div>
			
		</div>
			
		<div class="map-container">
			<div id="kakao-map" style="width: 100%; height: 100%"></div>
		</div>
		
		<div class="map_bg" data-aos="fade-left" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
			<div>
				<p class="title">A&amp;D Solutions Office</p>
				<p>서울 금천구 벚꽃로 278 609</p>
				<p>T. 02.6269.6003</p>
				<p>F. 02.6269.6002</p>
				<p class="title">LOCATION</p>
				<p>7호선 1호선 가산디지털단지역 4번출구 도보 3분</p>
			</div>		
		</div>
		
	</div>
</div>

<!-- The Modal -->
<div id="pr-modal" class="modal" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
  
	<div id="pr-modal-inner">
 
		<!-- Modal content -->
		<span class="close">&times;</span>                                                               
			
		<span class="modal-slide-btn prev">
			<i class="fas fa-arrow-left"></i>
		</span>
		
		<span class="modal-slide-btn next">
			<i class="fas fa-arrow-right"></i>
		</span>
		
		<div class="modal-slider-outer">
			<ul class="modal-slider">
				<li><img src="${pageContext.request.contextPath }/resources/img/main/pr1.jpg"></li>				
				<li><img src="${pageContext.request.contextPath }/resources/img/main/pr2.jpg"></li>				
				<li><img src="${pageContext.request.contextPath }/resources/img/main/pr3.jpg"></li>	
				<li><img src="${pageContext.request.contextPath }/resources/img/main/pr4.jpg"></li>				
				<li><img src="${pageContext.request.contextPath }/resources/img/main/pr5.jpg"></li>				
				<li><img src="${pageContext.request.contextPath }/resources/img/main/pr6.jpg"></li>	
				<li><img src="${pageContext.request.contextPath }/resources/img/main/pr7.jpg"></li>				
				<li><img src="${pageContext.request.contextPath }/resources/img/main/pr8.jpg"></li>				
				<li><img src="${pageContext.request.contextPath }/resources/img/main/pr9.jpg"></li>				
				<li><img src="${pageContext.request.contextPath }/resources/img/main/pr10.jpg"></li>				
			</ul>
		</div>
		
		<div class="modal-slider-pager">
				<a data-slide-index="0"><img src="${pageContext.request.contextPath }/resources/img/main/pr1.jpg" /></a>
				<a data-slide-index="1"><img src="${pageContext.request.contextPath }/resources/img/main/pr2.jpg" /></a>
				<a data-slide-index="2"><img src="${pageContext.request.contextPath }/resources/img/main/pr3.jpg" /></a>
				<a data-slide-index="3"><img src="${pageContext.request.contextPath }/resources/img/main/pr4.jpg" /></a>
				<a data-slide-index="4"><img src="${pageContext.request.contextPath }/resources/img/main/pr5.jpg" /></a>
				<a data-slide-index="5"><img src="${pageContext.request.contextPath }/resources/img/main/pr6.jpg" /></a>
				<a data-slide-index="6"><img src="${pageContext.request.contextPath }/resources/img/main/pr7.jpg" /></a>
				<a data-slide-index="7"><img src="${pageContext.request.contextPath }/resources/img/main/pr8.jpg" /></a>
				<a data-slide-index="8"><img src="${pageContext.request.contextPath }/resources/img/main/pr9.jpg" /></a>
				<a data-slide-index="9"><img src="${pageContext.request.contextPath }/resources/img/main/pr10.jpg" /></a>
		</div>
	
	</div>

</div>







