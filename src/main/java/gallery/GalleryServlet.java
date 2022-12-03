package gallery;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class GalleryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		MultipartRequest multi = null;
		int fileMaxSize = 10 * 1024 * 1024;
		String savePath = request.getRealPath("/upload").replaceAll("\\\\","/");
		try {
			multi = new MultipartRequest(request, savePath, fileMaxSize, "UTF-8", new DefaultFileRenamePolicy());
		}catch(Exception e) {
			request.getSession().setAttribute("messageType","���� �޽���");
			request.getSession().setAttribute("mewssageContent", "���� ũ��� 10MB�� ���� �� �����ϴ�.");
			response.sendRedirect("student_council_photo_Write.jsp");
			return;
		}
		HttpSession session = request.getSession();
		String userID = multi.getParameter("userID");
		String galTitle = multi.getParameter("galTitle");
		String galContent = multi.getParameter("galContent");
		
		if(galTitle==null || galContent==null||galTitle.equals("")||galContent.equals("")) {
			session.setAttribute("messageType", "���� �޽���");
			session.setAttribute("messageContent", "������ ��� ä���ּ���.");
			response.sendRedirect("student_council_photo_Write.jsp");
			return;
		}
		File file = multi.getFile("galFile");
		GalleryDAO galleryDAO = new GalleryDAO();
		
		
		if(file !=null) {
			String ext = file.getName().substring(file.getName().lastIndexOf(".")+1);
			if(ext.equals("jpg") ||ext.equals("png") ||ext.equals("gif")) {
				String galFile = multi.getOriginalFileName("galFile");
				String galRealFile = file.getName();
				galleryDAO.write(userID,galTitle, galContent,galFile,galRealFile);
				session.setAttribute("messageType", "���� �޽���");
				session.setAttribute("messageContent", "�������� ������ ���ε��Ͽ����ϴ�.");
				response.sendRedirect("index.jsp");
				return;
			}else {
				if(file.exists()) {
					file.delete();
				}
				session.setAttribute("messageType", "���� �޽���");
				session.setAttribute("messageContent", "�̹��� ���ϸ� ���ε� �����մϴ�.");
				response.sendRedirect("student_council_photo_Write.jsp");
				return;
			}
		}else {
			session.setAttribute("messageType", "���� �޽���");
			session.setAttribute("messageContent", "������ ÷�����ּ���.");
			response.sendRedirect("student_council_photo_Write.jsp");
			return;
		}		
	}
}
