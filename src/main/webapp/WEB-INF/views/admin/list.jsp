<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="container-inner">

	<div class="title">
		<h2>에이앤디솔루션스 견적 신청 현황</h2>
		
		<div class="btn_area">
			<input type="button" value="로그아웃" class="logoutBtn btn" />
			<input type="button" value="메인으로" class="homeBtn btn" />
		</div>
	</div>
	
	<div class="sub_title">
	
		<c:if test="${listDTO.type eq 'all' }">
			<h3>전체 ${countDTO.totalCount }</h3>
		</c:if>
		
		<c:if test="${listDTO.type eq 'unanswered' }">
			<h3>미답변 ${countDTO.unansweredCount }</h3>
		</c:if>
		
		<c:if test="${listDTO.type eq 'answered' }">
			<h3>답변완료 ${countDTO.answeredCount }</h3>
		</c:if>
		
			<form action="${pageContext.request.contextPath }/admin/list" class="search_form">
	
				<select name="type" class="listSelect">
					<option value="all" <c:if test="${listDTO.type eq 'all' }">selected</c:if>>전체견적 보기</option>
					<option value="unanswered" <c:if test="${listDTO.type eq 'unanswered' }">selected</c:if>>미답변 보기</option>
					<option value="answered" <c:if test="${listDTO.type eq 'answered' }">selected</c:if>>답변완료 보기</option>
				</select>
				
				<div class="search_area">
					<select class="searchSelect" name="option">
						<option value="name" <c:if test="${listDTO.option eq 'name' }">selected</c:if>>성함</option>
						<option value="queContent" <c:if test="${listDTO.option eq 'content' }">selected</c:if>>내용</option>
						<option value="phone" <c:if test="${listDTO.option eq 'phone' }">selected</c:if>>연락처</option>
						<option value="email" <c:if test="${listDTO.option eq 'email' }">selected</c:if>>이메일</option>
						<option value="all" <c:if test="${listDTO.option eq 'all' }">selected</c:if>>전체</option>
					</select>
					<input type="text" class="searchInput" name="keyword" value="${listDTO.keyword }"/>
					
					<input type="submit" class="searchBtn" value=""/>
				</div>
			</form>
	</div>
	
	<div class="list_area">
	
		<ul class="list_header">
			<li>내용</li>
			<li>성함</li>
			<li>연락처</li>
			<li>이메일</li>
			<li>신청일</li>
			<li>답변일</li>
			<li>상태</li>
		</ul>
		
		<c:if test="${listDTO.inquiryCount < 1}">
			
			<c:if test="${listDTO.type eq 'all' || empty listDTO.type}">
				<c:if test="${not empty listDTO.keyword }">
					<div class="infoText">검색 결과가 없습니다.</div>
				</c:if>
				
				<c:if test="${empty listDTO.keyword }">
					<div class="infoText">등록된 견적 신청이 없습니다.</div>
				</c:if>
			</c:if>
			
			<c:if test="${listDTO.type eq 'unanswered' }">
				<c:if test="${not empty listDTO.keyword }">
					<div class="infoText">검색결과가 없습니다.</div>
				</c:if>
				
				<c:if test="${empty listDTO.keyword }">
					<div class="infoText">미답변 견적이 없습니다.</div>
				</c:if>
				
			</c:if>
			
			<c:if test="${listDTO.type eq 'answered' }">
				<c:if test="${not empty listDTO.keyword }">
					<div class="infoText">검색 결과가 없습니다.</div>
				</c:if>
				
				<c:if test="${empty listDTO.keyword }">
					<div class="infoText">답변 완료된 견적이 없습니다.</div>
				</c:if>
			</c:if>
		
		</c:if> 
		
		<c:if test="${listDTO.inquiryCount > 0}">
		
		<ul class="list_title_area">
		
			<fmt:parseDate var="tday" value="${today }" pattern="yyyy-MM-dd"/>
			<c:forEach var="list" items="${listDTO.inquiryList }">
			
			<li class="list_elem" data-code="${list.code }">
				<div class="list_title">
					
					<c:if test="${empty list.ansContent }">
						<span class="new_icon">N</span>
					</c:if>
				
					<ul>
						<li>${list.queContent }</li>
						<li>${list.name }</li>
						<li>${list.phone }</li>
						<li>${list.email }</li>
						<li>
							<fmt:parseDate var="qDate" value="${list.queDate }" pattern="yyyy-MM-dd" />
							<c:if test="${qDate == tday }">
								${fn:substring(list.queDate,10,16) }
							</c:if>
							
							<c:if test="${qDate != tday }">
								${list.queDate }
							</c:if>
						
						</li>
						<li>
							<fmt:parseDate var="aDate" value="${list.ansDate }" pattern="yyyy-MM-dd" />
							<c:if test="${aDate == tday }">
								${fn:substring(list.ansDate,10,16) }
							</c:if>
							
							<c:if test="${aDate != tday }">
								${list.ansDate }
							</c:if>
						</li>
						<li>
							<c:if test="${not empty list.ansContent }">
								<span class="answered">답변완료</span>
							</c:if>

							<c:if test="${empty list.ansContent }">
								<span class="unanswered">미답변</span>
							</c:if>
						</li>
					</ul>
				</div>
				<div class="list_content">
				
					<c:if test="${not empty list.queFilePath }">
						<span class="file_area"><span class="file_title">${list.queFilePath }</span>
						<span class="download_btn">저장</span></span>
					</c:if>
					
					<c:if test="${empty list.ansContent }">
						<div class="content_area">${list.queContent }</div>
					</c:if>
					
					<c:if test="${not empty list.ansContent }">
						<div class="answer_area"><p>[ 관리자 답변 ]</p><br />${list.ansContent }</div>
					</c:if>
			
			
					<c:if test="${empty list.ansContent }">
						<input type="button" value="답변작성" class="answerBtn" />
					</c:if>		
						<input type="button" value="삭제" class="deleteBtn" data-pageNum="${page.curPage }" data-code="${list.code }" data-type="${listDTO.type }" data-option="${listDTO.option }" data-keyword="${listDTO.keyword }" />
				</div>
				
				
				<div class="list_answer_area">
					<form action="${pageContext.request.contextPath }/admin/answer?code=${list.code}&pageNum=${page.curPage}&type=${listDTO.type}&option=${listDTO.option}&keyword=${listDTO.keyword}&name=${list.name}&email=${list.email}" method="post">
						<textarea class="answer_editor" name="ansContent">
						<br /><br /><br /><br /><br /><br /><br />[ 문의 내용 ]<br /><br />${list.queContent }
						</textarea>
			
						<div class="answer_btn_area">
							<input type="submit" value="답변 메일전송" class="confirmBtn answer_area_btn" />
							<input type="button" value="이전으로" class="cancelBtn answer_area_btn" />
						</div>
					</form>
					
				</div>
				
			</li>
			</c:forEach>
		</ul>
		
		</c:if>
		
	</div>
	
	<div class="paging_area">
		<ul>
			<li>
			
			<!-- 첫 페이지 -->
			
			<c:if test="${page.totPage > 0 }">
				<c:if test="${page.curPage eq 1 }">
					<input type="button" value="◀" class="pageNum prevPage false" />
				</c:if>
				
				<c:if test="${page.curPage ne 1 }">
					<input type="button" value="◀" onclick="location.href='${pageContext.request.contextPath}/admin/list?pageNum=${page.prevPage}&type=${listDTO.type}&option=${listDTO.option}&keyword=${listDTO.keyword}'" class="pageNum prevPage" />
				</c:if>
			</c:if>
			
			<c:forEach var="pageNum" begin="${page.blockStart}" end="${page.blockEnd}">
				<c:choose>
			    	<c:when test="${pageNum == page.curPage }">
			    		<input type="button" value="${pageNum }" class="selPageNum pageNum" />
				    </c:when>
			    
			    	<c:otherwise>
			    		<input type="button" value="${pageNum }" class="pageNum" onclick="location.href='${pageContext.request.contextPath}/admin/list?pageNum=${pageNum}&type=${listDTO.type}&option=${listDTO.option}&keyword=${listDTO.keyword}'" />
			    	</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:if test="${page.totPage > 0 }">
				<c:if test="${page.curPage eq page.totPage }">
					<input type="button" value="▶" class="pageNum nextPage false" />
				</c:if>
				
				<c:if test="${page.curPage ne page.totPage }">
					<input type="button" value="▶" class="pageNum nextPage" onclick="location.href='${pageContext.request.contextPath}/admin/list?pageNum=${page.nextPage}&type=${listDTO.type}&option=${listDTO.option}&keyword=${listDTO.keyword}'"/>
				</c:if>
			</c:if>
			
			</li>
		</ul>
	
	</div>

</div>




