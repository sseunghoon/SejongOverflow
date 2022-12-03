package page;

import util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PageDAO {
    public PageDTO getPage() {
        String SQL = "";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            SQL = "SELECT * FROM page";
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                PageDTO pageDTO = new PageDTO();
                pageDTO.setPageLogo(rs.getString(1));
                pageDTO.setPageImage(rs.getString(2));
                return pageDTO;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (pstmt != null) pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (rs != null) rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public String searchPageLogo() {
        String SQL = "SELECT pageLogo FROM page";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (pstmt != null) pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (rs != null) rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public String getPageLogo() {
        String SQL = "SELECT pageLogo FROM page";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                if (rs.getString("pageLogo").equals("")) {
                    return "http://localhost:8080/imgs/logo.png";
                }
                return "http://localhost:8080/upload/" + rs.getString("pageLogo");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (pstmt != null) pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (rs != null) rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "http://localhost:8080/imgs/logo.png";
    }

    public int logoUpdate(String pageLogo) {
        String SQL = "UPDATE page SET pageLogo = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, pageLogo);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (pstmt != null) pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (rs != null) rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return -1;
    }

    public String searchPageImage() {
        String SQL = "SELECT pageImage FROM page";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (pstmt != null) pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (rs != null) rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public String getPageImage() {
        String SQL = "SELECT pageImage FROM page";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                if (rs.getString("pageImage").equals("")) {
                    return "imgs/favicon.ico";
                }
                return "upload/" + rs.getString("pageImage");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (pstmt != null) pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (rs != null) rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "imgs/favicon.ico";
    }

    public int ImageUpdate(String pageImage) {
        String SQL = "UPDATE page SET pageImage = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, pageImage);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (pstmt != null) pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (rs != null) rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return -1;
    }
}
