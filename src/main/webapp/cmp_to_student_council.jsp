<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
=======
<%@ page import="java.util.ArrayList" %>
<%@ page import="complaints.ComplaintsDAO" %>
<%@ page import="complaints.ComplaintsDTO" %>
<%@ page import="java.net.URLEncoder" %>
>>>>>>> 42301f5fb714e241a53d3a04e66005ad76d58f5a
<!DOCTYPE html>
<html lang="ko" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Pragma" content="no-cache">
    <title>세종대학교 소프트웨어융합대학 :: 민원 :: 학생회 건의사항</title>
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather&display=swap" rel="stylesheet">
<<<<<<< HEAD
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/PSB.css">
  </head>
  <body>
    <header>
      <nav id='first_area'>
        <a href='index.jsp'><img src="imgs/software_convergence_logo.PNG" id='logo' alt="소융대 로고"></a><!-- 소융대 로고 -->
        <div id="menubar">
          <ul> <!-- 사이트 타이틀 하단 메뉴바 -->
            <li><a href='student_council.jsp'>학생회</a> <!-- 메뉴바 첫번째 - 학생회 카테고리 -->
=======
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/PSB.css">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<style type="text/css">
		a, a:hover{
			color:#000000;
			text-decoration:none;
		}
	</style>

  </head>
  <body>

	<%
		request.setCharacterEncoding("UTF-8");
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		String searchType="최신순";
		String search=null;
		if(request.getParameter("searchType")!=null){
			searchType=request.getParameter("searchType");
		}
		if(request.getParameter("search")!=null){
			search=request.getParameter("search");
		}
		int isStudent=1;
	%>

	<header>
      <nav id='first_area'>
        <a href='index.jsp'><img src="imgs/software_convergence_logo.PNG" id='logo' alt="소융대 로고"></a> <!-- 소융대 로고 -->
        <div id="menubar">
          <ul> <!-- 사이트 타이틀 하단 메뉴바 -->
            <li>학생회 <!-- 메뉴바 첫번째 - 학생회 카테고리 -->
>>>>>>> 42301f5fb714e241a53d3a04e66005ad76d58f5a
              <ul id='submenu'>
                <li><a href='student_council_introduce.jsp'>학생회 소개</a></li>
                <li><a href='student_council_photo.jsp'>갤러리</a></li>
                <li><a href='student_council_events.jsp'>행사</a></li>
                <li><a href='student_council_public_money.jsp'>학생회비 내역</a></li>
<<<<<<< HEAD
              </ul>
            </li>

            <li><a href='complaints.jsp'>민원</a> <!-- 메뉴바 두번째 - 민원 카테고리 -->
              <ul id='submenu'>
                <li><a href='cmp_to_student_council.jsp'>학생회 건의사항</a></li>
                <li><a href='cmp_to_school.jsp'>학교 건의사항</a></li>
                <li><a href='cmp_to_etc.jsp'>기타 민원</a></li>
=======
                <li><a href='departments.jsp'>과별 게시판</a></li>
              </ul>
            </li>

            <li>민원 <!-- 메뉴바 두번째 - 민원 카테고리 -->
              <ul id='submenu'>
                <li><a href='cmp_to_student_council.jsp'>학생회 건의사항</a></li>
                <li><a href='cmp_to_school.jsp'>학교 건의사항</a></li>
>>>>>>> 42301f5fb714e241a53d3a04e66005ad76d58f5a
                <li><a href='introduce_cmp.jsp'>민원창구 소개</a></li>
              </ul>
            </li>

<<<<<<< HEAD
            <li><a href='pre_sju_student.jsp'>예비 소융인</a> <!-- 메뉴바 세번째 - 예비 소융인 카테고리 -->
=======
            <li>예비 소융인 <!-- 메뉴바 세번째 - 예비 소융인 카테고리 -->
>>>>>>> 42301f5fb714e241a53d3a04e66005ad76d58f5a
              <ul id='submenu'>
                <li><a href='admission_reviews.jsp'>선배들의 입시 후기</a></li>
                <li><a href='admission_qnas.jsp'>QnA</a></li>
              </ul>
            </li>

<<<<<<< HEAD
            <li><a href='employ_n_grauation.jsp'>취업 & 졸업</a> <!-- 메뉴바 네번째 - 취업&졸업 카테고리 -->
=======
            <li>취업&amp;졸업 <!-- 메뉴바 네번째 - 취업&졸업 카테고리 -->
>>>>>>> 42301f5fb714e241a53d3a04e66005ad76d58f5a
              <ul id='submenu'>
                <li><a href='employ_reviews.jsp'>취창업 후기</a><br></li>
                <li><a href='graduate_interviews.jsp'>졸업생 인터뷰</a><br></li>
                <li><a href='graduate_qnas.jsp'>졸업생 QnA</a><br></li>
              </ul>
            </li>

<<<<<<< HEAD
            <li><a href='contest_promotions.jsp'>홍보</a> <!-- 메뉴바 다섯번째 - 홍보 카테고리 -->
=======
            <li>홍보 <!-- 메뉴바 다섯번째 - 홍보 카테고리 -->
>>>>>>> 42301f5fb714e241a53d3a04e66005ad76d58f5a
              <ul id='submenu'>
                <li><a href='school_contests.jsp'>교내 공모전</a><br></li>
                <li><a href='not_school_contests.jsp'>교외 공모전</a><br></li>
              </ul>
            </li>

<<<<<<< HEAD
            <li><a href='questions.jsp'>QnA</a> <!-- 메뉴바 여섯번째 - QnA 카테고리 -->
=======
            <li>QnA <!-- 메뉴바 여섯번째 - QnA 카테고리 -->
>>>>>>> 42301f5fb714e241a53d3a04e66005ad76d58f5a
              <ul id='submenu'>
                <li><a href='chatbot.jsp'>Chatbot</a><br></li>
                <li><a href='qna.jsp'>QnA</a><br></li>
              </ul>
            </li>
          </ul>
        </div>
        
        <h1 id='language'>한국어 / EN </h1> <!--영어, 한글 버전 바꾸는 버튼-->
<<<<<<< HEAD
        <h1 id='login'><a href="login.jsp">LOGIN</a></h1> <!-- 로그인 버튼-->
=======
        <%
				if (userID == null) {
			%>
			<h2 id='login'>
				<a data-toggle="modal" href="#modal-login" style="text-decoration: none; color: #000000">LOGIN</a>
			</h2>
			<%
				} else {
			%>
			<h2 id='login'>
				<a href="userLogoutAction.jsp"
					style="text-decoration: none; color: #000000">LOGOUT</a>
			</h2>
			<%
				}
			%>
>>>>>>> 42301f5fb714e241a53d3a04e66005ad76d58f5a
      </nav>
    </header>
    
    <%
		String messageContent = null;
		if(session.getAttribute("messageContent")!=null){
			messageContent=(String)session.getAttribute("messageContent");
		}
		String messageType = null;
		if(session.getAttribute("messageType")!=null){
			messageType=(String)session.getAttribute("messageType");
		}
		if(messageContent != null){
	%>
		<div id="messageModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="vertical-alignment-helper">
				<div class="modal-dialog vertical-align-center">
					<div class="modal-content" <%if(messageType.equals("오류 메시지")) out.println("panel-warning");else out.println("panel-success"); %>>
						<div class="modal-header panel-heading">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span>
								<span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title">
								<%=messageType %>
							</h4>
						</div>
						<div class="modal-body">
							<%=messageContent %>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
			$('#messageModal').modal("show");
		</script>
	<%
		session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
		}
	%>

	<div id="modal-login" class="modal fade">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title">로그인</h4>
					</div>
					<script>
						$(document).ready(function(){
							$('btnLogin').click(function(){
								var action = $('#frmLogin').attr("action");
								var form_data={
										user_id:$('#userID').val(),
										user_pw:$('#userPassword').val()
								};
								$.ajax({
									type:"POST",
									url:action,
									data:form_data,
									success:function(response){
										if(response.trim()=="success"){
										sessionStorage.setItem("user_id",form_data.user_id);
										$('#msg').html("<p style='color:green;font-weight:bold'>로그인 성공!</p>");
									}else{
										$('#msg').html("<p style='color:red'>아이디 또는 비밀번호가 잘못되었습니다.</p>");
									}
								},
								error:function(){
									$('#msg'),html("<h2>Error</h2>");
								}
								});
							});
						});
					</script>
					<div class="modal-body">
						<form action="userLoginAction.jsp" id="frmLogin" method="post">
							<div class="form-group">
								<input type="text" name="userID" id="uid" value=""
									placeholder="아이디" class="form-control" required="">
							</div>
							<div class="form-group">
								<input type="password" name="userPassword" id="upw" value=""
									placeholder="비밀번호" class="form-control" required="">
							</div>
							<div class="checkbox">
								<label for="keep_signed"
									onclick="jQuery('#modal-login input[name=\'keep_signed\']').click();"><input
									type="checkbox" name="keep_signed" value="Y"
									onclick="if(this.checked) return confirm('브라우저를 닫더라도 로그인이 계속 유지될 수 있습니다.\n\n로그인 유지 기능을 사용할 경우 다음 접속부터는 로그인할 필요가 없습니다.\n\n단, 게임방, 학교 등 공공장소에서 이용 시 개인정보가 유출될 수 있으니 꼭 로그아웃을 해주세요.');">
									로그인 유지</label>
							</div>
							<button type="submit" id="btnLogin" class="btn btn-block">
								<i class="fa fa-sign-in" aria-hidden="true"></i> 로그인
							</button>
							<br>
						</form>
					</div>
					<div class="modal-footer">
						<div class="btn-group btn-group-justified">
							<a
								href="userJoin.jsp"
								class="btn btn-default btn-sm"><i class="fa fa-user-plus"
								aria-hidden="true"></i> 회원가입</a> <a
								href="findAccount.jsp"
								class="btn btn-default btn-sm"><i
								class="fa fa-question-circle" aria-hidden="true"></i> ID/PW 찾기</a>

						</div>
					</div>
				</div>
			</div>
		</div>
		
	<div id="container">
    <nav>
      <nav>
        <h2>
          <span></span>
            민원
        </h2>
        <ul class="lnb_deps2">
             <li>
<<<<<<< HEAD
               <a href="cmp_to_student_council.jsp" class="jwxe_22350 active">학생회 건의사항</a>
             </li>
             <li>
               <a href="cmp_to_school.jsp" class="jwxe_22351 ">학교 건의사항</a>
            </li>
            <li>
              <a href="cmp_to_etc.jsp" class="jwxe_22351 ">기타 민원</a>
            </li>
            <li>
              <a href="introduce_cmp.jsp" class="jwxe_22351 ">민원창구 소개</a>
=======
               	<a href='cmp_to_student_council.jsp' class="jwxe_22350 active">학생회 건의사항</a>
             </li>
             <li>
               	<a href='cmp_to_school.jsp' class="jwxe_22351 ">학교 건의사항</a>
            </li>
            <li>
              	<a href='introduce_cmp.jsp' class="jwxe_22351 ">민원창구 소개</a>
>>>>>>> 42301f5fb714e241a53d3a04e66005ad76d58f5a
            </li>
        </ul>
      </nav>
    </nav>
<<<<<<< HEAD
    <section class="content">
      <header>
        <h1>학생회 건의사항</h1>
      </header>
      <table class="table table-hover">
        <thead>
          <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>날짜</th>
            <th>조회수</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>2</td>
            <td>단대 야식행사 기획 누가했나요?</td>
            <td>송승훈</td>
            <td>2019.7.30</td>
            <td>2</td>
          </tr>
          <tr>
            <td>1</td>
            <td>웹소설 왜 이렇게 상금이 작은가요?</td>
            <td>이승준</td>
            <td>2019.7.30</td>
            <td>130</td>
          </tr>
        </tbody>
      </table>
      <hr>
      <a class= "btn btn-default pull-right" href="cmp_to_student_council_Write.jsp">글쓰기</a>
      <div class="text-center">
        <ul class="pagination">
          <li><a href="#">1</a></li>
          <li><a href="#">2</a></li>
          <li><a href="#">3</a></li>
          <li><a href="#">4</a></li>
          <li><a href="#">5</a></li>
        </ul>
      </div>
    </section>
    </div>
    <script src="js/bootstrap.js"></script>
=======
	<section class="content">
		<header>
			<h1>학생회 건의사항</h1>
		</header>
		<hr>
		<div class="find_content">
			<form method="get" action="cmp_to_student_council.jsp" class="form-inline mt-3" id=find_content>
				<select name="searchType" class="form-control mx-1 mt-2">
					<option value="최신순" <% if(searchType.equals("최신순")) out.println("selected"); %>>최신순</option>
					<option value="추천순" <% if(searchType.equals("추천순")) out.println("selected"); %>>추천순</option>
				</select>
				<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="작성자/제목/내용">
				<button type="submit" class="btn mx-1 mt-2">검색</button>
			</form>
		</div>
		<div class="content_table">
			<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>동의 수</th>
					<th>조회 수</th>
				</tr>
			</thead>
			<tbody>
				<%
	           ComplaintsDAO cmpDAO = new ComplaintsDAO();
				ArrayList<ComplaintsDTO> list = null;
				if(search==null){
					list = cmpDAO.getList(pageNumber,isStudent);	
				}else{
					list=cmpDAO.getSearch(searchType,search,pageNumber,isStudent);
				}
	            for(int i=0; i<list.size();i++){
         		%>
				<tr>
					<td><%=list.get(i).getCmpID() %></td>
					<td><a href="cmp_View.jsp?isStudent=<%=isStudent %>&cmpID=<%=list.get(i).getCmpID()%>"
						style="text-decoration: none"><%=list.get(i).getCmpTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>") %></a></td>
					<td><%=list.get(i).getUserID() %></td>
					<td><%=list.get(i).getCmpDate().substring(0,11)+list.get(i).getCmpDate().substring(11,13)+"시"+list.get(i).getCmpDate().substring(14,16)+"분" %></td>
					<td><%=list.get(i).getAgreeCount() %></td>
					<td><%=list.get(i).getCmpHit() %></td>
				</tr>
				<%
          	  }
         		%>
			</tbody>
			</table>
		</div>
		<div class="write_button">
				<a class="btn btn-default pull-right"
				href="cmp_Write.jsp?isStudent=<%=isStudent%>">글쓰기</a>
		</div>	
		<br><br>
		<div class="List_button">
			<%
				if(search==null){
			%>
			<div class="text-center">
				<ul class="pagination" style="margin: 0 auto;">
					<%
          	int startPage=(pageNumber/10)*10+1;
          	if(pageNumber%10==0) startPage-=10;
          	int targetPage =cmpDAO.targetPage(pageNumber,isStudent);
          	if(startPage!=1){
          %>
					<li><a
						href="cmp_to_student_council.jsp?pageNumber=<%=startPage-1%>"
						class="btn btn-success">이전</a></li>
					<%
          	}else{
          %>
					<li><a href="#" class="btn" style="color: gray;">이전</a></li>
					<%
          	}for(int i = startPage;i<pageNumber;i++){
        	%>
					<li><a href="cmp_to_student_council.jsp?pageNumber=<%=i %>"><%=i %></a></li>
					<%      			
          		}
          	%>
					<li><a class="active"
						href="cmp_to_student_council.jsp?pageNumber=<%=pageNumber %>"><%=pageNumber %></a></li>
					<%
				for(int i = pageNumber+1;i<=targetPage+pageNumber;i++){
					if(i<startPage+10){
			%>
					<li><a href="cmp_to_student_council.jsp?pageNumber=<%=i %>"><%=i %></a></li>
					<%
					}
				}
				if(targetPage+pageNumber>startPage+9){
			%>
					<li><a
						href="cmp_to_student_council.jsp?pageNumber=<%=startPage+10 %>">다음</a></li>
					<%
				}else{
			%>
					<li><a href="#" class="btn" style="color: gray;">다음</a></li>
					<%
				}
				}
			%>
				</ul>
			</div>
		</div>
		<br>
		<br>
	</section>
</div>
   <footer>
   		<p id='footer_content'> 010-0000-0000 | sejongsc3@gmail.com | 학생회관 409호 <br>
   		COPYRIGHT &copy 2019 세종대학교 소프트웨어융합대학 데단한 사람들 All rights reserved.</p>
    </footer>
>>>>>>> 42301f5fb714e241a53d3a04e66005ad76d58f5a
  </body>
</html>
