<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="post.PostDAO" %>
<%@ page import="post.PostDTO" %>
<%@ page import="board.BoardDTO" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="page.PageDAO" %>
<% PageDAO pageDAO = new PageDAO(); %>

<%
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
    int postID = 0;
    if (request.getParameter("postID") != null) {
        postID = Integer.parseInt(request.getParameter("postID"));
    }
    if (postID == 0) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않은 글입니다.')");
        script.println("history.back()");
        script.println("</script>");
        script.close();
    }
    int boardID = 0;
    if (request.getParameter("boardID") != null) {
        boardID = Integer.parseInt(request.getParameter("boardID"));
    }

    PostDAO postDAO = new PostDAO();
    PostDTO post = postDAO.getPost(postID, boardID);
    postDAO.hit(postID, boardID);
    String fromProfile = new UserDAO().getProfile(userID);
    BoardDAO boardDAO = new BoardDAO();
    int boardAvailable = boardDAO.getBoard(boardID).getBoardAvailable();
    if (boardAvailable == 0) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('비활성화된 게시판입니다.');");
        script.println("history.back()");
        script.println("</script>");
        script.close();
        return;
    }
    UserDAO userDAO = new UserDAO();
%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>세종대학교 소프트웨어융합대학 :: <%=boardDAO.getBoard(boardID).getBoardName()%></title>
    <link rel="shortcut icon" type="image/x-icon" href="<%=pageDAO.getPageImage()%>">
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
          rel="stylesheet">
    <link
            href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap"
            rel="stylesheet">
    <link
            href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap"
            rel="stylesheet">
    <link
            href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
            rel="stylesheet">
    <link
            href="https://fonts.googleapis.com/css?family=Merriweather&display=swap"
            rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/PSB.css">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

</head>
<body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>



<header>
    <nav class="navbar navbar-default"
         style="background:none;border:none;font-size:22px;margin:0 1%; padding:2%; color:#000000;">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand logobox" href='index.jsp'>
                    <img style="width:80px;" src="<%=pageDAO.getPageLogo() %>" alt="소융대 로고">
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="post.jsp?boardID=1">공지사항</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">코딩 Q&A <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdownLi" href='post.jsp?boardID=2'>코딩 F&A</a></li>
                            <li><a class="dropdownLi" href='post.jsp?boardID=3'>코딩 Q&A</a></li>
                        </ul>
                    </li>
                    <li><a href="post.jsp?boardID=1">랭킹</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">취업 &amp; 졸업 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdownLi" href='post.jsp?boardID=4'>채용 정보</a></li>
                            <li><a class="dropdownLi" href='post.jsp?boardID=5'>졸업생에게 묻는다</a></li>
                            <li><a class="dropdownLi" href='post.jsp?boardID=6'>취창업 후기</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">공모전 & 대회 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdownLi" href='post.jsp?boardID=7'>팀원 모집</a></li>
                            <li><a class="dropdownLi" href='post.jsp?boardID=8'>교내 공모전 & 대회</a></li>
                            <li><a class="dropdownLi" href='post.jsp?boardID=9'>교외 공모전 & 대회</a></li>
                        </ul>
                    </li>
                    <li><a href='post.jsp?boardID=10'>자유 게시판</a><br></li>
                    <li><a href='chatbot.jsp'>Chatbot</a><br></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">KR/EN</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">접속관리 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <%
                                if (userID == null) {
                            %>
                            <li><a class="dropdownLi" data-toggle="modal" href="#modal-login">로그인</a></li>
                            <%
                            } else {
                            %>
                            <li><a class="dropdownLi" href="myPage.jsp">내 프로필</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a class="dropdownLi" href="userLogoutAction.jsp">로그아웃</a></li>
                            <%
                                }
                            %>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<%
    String messageContent = null;
    if (session.getAttribute("messageContent") != null) {
        messageContent = (String) session.getAttribute("messageContent");
    }
    String messageType = null;
    if (session.getAttribute("messageType") != null) {
        messageType = (String) session.getAttribute("messageType");
    }
    if (messageContent != null) {
%>
<div id="messageModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="vertical-alignment-helper">
        <div class="modal-dialog vertical-align-center">
            <div class="modal-content" <%
                if (messageType.equals("오류 메시지")) out.println("panel-warning");
                else out.println("panel-success");
            %>>
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

<div id="container">

    <div id="modal-login" class="modal fade">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">×
                    </button>
                    <h4 class="modal-title">로그인</h4>
                </div>
                <script>
                    $(document).ready(function () {
                        $('btnLogin').click(function () {
                            var action = $('#frmLogin').attr("action");
                            var form_data = {
                                user_id: $('#userID').val(),
                                user_pw: $('#userPassword').val()
                            };
                            $.ajax({
                                type: "POST",
                                url: action,
                                data: form_data,
                                success: function (response) {
                                    if (response.trim() == "success") {
                                        sessionStorage.setItem("user_id", form_data.user_id);
                                        $('#msg').html("<p style='color:green;font-weight:bold'>로그인 성공!</p>");
                                    } else {
                                        $('#msg').html("<p style='color:red'>아이디 또는 비밀번호가 잘못되었습니다.</p>");
                                    }
                                },
                                error: function () {
                                    $('#msg'), html("<h2>Error</h2>");
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

    <div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modal">신고 하기</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="reportAction.jsp" method="post">
                        <input type="hidden" name="postID" value="<%=postID%>">
                        <input type="hidden" name="boardID" value="<%=boardID%>">
                        <div class="form-group">
                            <label>신고제목</label>
                            <input type="text" name="reportTitle" class="form-control" maxlength="50">
                        </div>
                        <div class="form-group">
                            <label>신고 내용</label>
                            <textarea name="reportContent" class="form-control" maxlength="2048"></textarea>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                            <button type="submit" class="btn btn-danger">신고하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <div class="container">
        <div class="row">
            <table class="table table-striped"
                   style="text-align: center; border: 1px solid #dddddd">
                <thead>
                <tr>
                    <th colspan="3"
                        style="background-color: #eeeeee; text-align: center;">게시판
                        글보기
                    </th>
                </tr>
                <thead>
                <tbody>
                <tr>
                    <td style="width: 20%;">제목</td>
                    <td colspan="2"><%=post.getPostTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
                            .replaceAll(">", "&gt")
                            .replaceAll("\n", "<br>")%>
                    </td>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td colspan="2"><%=post.getUserID()%>
                    </td>
                </tr>
                <tr>
                    <td>작성자 이미지</td>
                    <td colspan="2"><img class="media-object img-circle" style="width:30px;height:30px;"
                                         src="<%=fromProfile%>"></td>
                </tr>
                <tr>
                    <td>작성일자</td>
                    <td colspan="2"><%=post.getPostDate().substring(0, 11) + post.getPostDate().substring(11, 13) + "시"
                            + post.getPostDate().substring(14, 16) + "분"%>
                    </td>
                </tr>
                <tr>
                    <td>동의 수</td>
                    <td colspan="2"><%=post.getAgreeCount()%>
                    </td>
                </tr>
                <tr>
                    <td>조회 수</td>
                    <td colspan="2"><%=post.getPostHit()%>
                    </td>
                </tr>
                <% if (boardID == 2 || boardID == 3) { %>
                <tr>
                    <td style="line-height: 300px;">코드</td>
                    <td colspan="2" style="height: 300px; text-align: left;">
                        <code>
                            <%=post.getPostCode().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt")
                                    .replaceAll("\n", "<br>")%>
                        </code>
                    </td>
                </tr>
                <% } %>

                <tr>
                    <td style="line-height: 300px;">내용</td>
                    <td colspan="2" style="height: 300px; text-align: left;">
                        <%=post.getPostContent()
                                .replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt")
                                .replaceAll("\n", "<br>")%>
                    </td>
                </tr>
                <tr>
                    <td style="line-height: 300px;">첨부파일</td>
                    <td colspan="2" style="height: 300px; text-align: left;">
                        <h5>
                            <a href="post_Download.jsp?boardID=<%=boardID%>&postID=<%=post.getPostID() %>"><%=post.getPostFile() %>
                            </a></h5>
                    </td>
                </tr>

                </tbody>
            </table>
            <a href="post.jsp?boardID=<%=boardID %>" class="btn btn-primary">목록</a>
            <a onclick="return confirm('해당 게시글에 동의하시겠습니까?')"
               href="post_agreeAction.jsp?boardID=<%=boardID%>&postID=<%=post.getPostID()%>"
               class="btn btn-primary pull-right"
               style="background-color: #c70027;">추천 </a> <a
                href="post_Reply.jsp?boardID=<%=boardID%>&postID=<%=post.getPostID()%>"
                class="btn btn-primary pull-right">답변 </a>
            <a class="btn btn-info btn-danger mx-1 mt-2" data-toggle="modal" href="#reportModal">신고</a>
            <%
                if (userID != null && userID.equals(post.getUserID())) {
            %>
            <a href="post_Update.jsp?postID=<%=post.getPostID()%>&boardID=<%=boardID%>"s
               class="btn btn-primary">수정</a>
            <%
                }
            %>
            <%
                int userLevel = userDAO.getUserEmailChecked(userID);
                if (userID != null && userID.equals(post.getUserID()) || userLevel == 2) {
            %>
            <a onclick="return confirm('정말로 삭제하시겠습니까?')"
               href="deleteAction.jsp?postID=<%=post.getPostID()%>&boardID=<%=post.getBoardID() %>"
               class="btn btn-primary">삭제</a>
            <%
                }
            %>
            <br> <br>
            <%
                ArrayList<PostDTO> list = postDAO.getReply(post.getPostGroup(), boardID);
                for (int i = 0; i < list.size(); i++) {
            %>
            <table class="table table-striped"
                   style="text-align: center; border: 1px solid #dddddd">
                <thead>
                <tr>
                    <th colspan="3"
                        style="background-color: #eeeeee; text-align: center;">
                        답변
                    </th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td style="width: 20%;">답변 제목</td>
                    <td colspan="2">
                        <%
                            for (int j = 0; j < list.get(i).getPostLevel(); j++) {
                        %> <span>Re: </span> <%
                        }
                    %>
                        <%=post.getPostTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt")
                                .replaceAll("\n", "<br>")%> &nbsp;/&nbsp;<%=list.get(i).getPostTitle()
                            .replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
                            .replaceAll(">", "&gt").replaceAll("\n", "<br>")%>
                    </td>
                </tr>
                <tr>
                    <td>답변자</td>
                    <td colspan="2"><%=list.get(i).getUserID()%>
                    </td>
                </tr>
                <tr>
                    <td>답변일자</td>
                    <td colspan="2"><%=list.get(i).getPostDate().substring(0, 11) + list.get(i).getPostDate()
                            .substring(11, 13) + "시"
                            + list.get(i).getPostDate().substring(14, 16) + "분"%>
                    </td>
                </tr>
                <tr>
                    <td style="line-height: 300px;">코드</td>
                    <td colspan="2" style="height: 300px; text-align: left;"><%=list.get(i).getPostCode()
                            .replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
                            .replaceAll(">", "&gt").replaceAll("\n", "<br>")%>
                    </td>
                </tr>
                <tr>
                    <td style="line-height: 300px;">내용</td>
                    <td colspan="2" style="height: 300px; text-align: left;"><%=list.get(i).getPostContent()
                            .replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
                            .replaceAll(">", "&gt").replaceAll("\n", "<br>")%>
                    </td>
                </tr>
                </tbody>
            </table>
            <%
                if (userID != null && userID.equals(post.getUserID())) {
            %>
            <a href="post_Update.jsp?boardID=<%=boardID %>&postID=<%=list.get(i).getPostID()%>"
               class="btn btn-primary">수정</a>
            <%
                }
            %>
            <%
                if (userID != null && userID.equals(post.getUserID()) || userLevel == 2) {
            %>
            <a onclick="return confirm('정말로 삭제하시겠습니까?')"
               href="deleteAction.jsp?boardID=<%=boardID %>&postID=<%=list.get(i).getPostID()%>"
               class="btn btn-primary">삭제</a>
            <%
                }
            %>
            <a href="post_Reply.jsp?boardID=<%=boardID %>&postID=<%=list.get(i).getPostID() %>"
               class="btn btn-primary pull-right">답변</a>
            <br><br>
            <%
                }
            %>

        </div>
    </div>

</div>

</body>

</html>
