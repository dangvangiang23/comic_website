/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Comment;

import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author MSI
 */
@WebServlet(name = "AddComment", urlPatterns = {"/addcomment"})
public class AddComment extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String textarea = request.getParameter("textarea");
        String chapid = request.getParameter("laydata");
        String cid = request.getParameter("laydata2");
        String username = request.getParameter("user");

        String linkChap = "/displayimage?chapid=" + chapid + "&&cid=" + cid;
        DAO dao = new DAO();

        int chapidd = Integer.parseInt(chapid);

        ArrayList<Comment> commentss = new ArrayList<>();
        commentss = dao.getCommentsByChapid(chapidd);
        request.setAttribute("commentss", commentss);

        int cidd = Integer.parseInt(cid);
        //thuc hien add comment
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("userLogged");

        if (a == null) {
            request.getRequestDispatcher("/login").forward(request, response);
        } else {

            if (textarea.equals("")) {
                request.setAttribute("message", "Comment đang bị để trống.");

                request.getRequestDispatcher(linkChap).forward(request, response);

            } else {

                ArrayList<Comment> comments = dao.getAllComments();
//              int commentid, String content, int chapid, int account
                int commentid = comments.get(0).getCommentid() + 1;
                //addcomment
                dao.AddComment(commentid, textarea, chapidd, a.getAccountid(), username);
                request.setAttribute("message", "Bình luận thành công, cảm ơn bạn đã đóng góp ý kiến, chúc bạn đọc truyện vui vẻ <3");
                request.getRequestDispatcher("/displayimage?chapid=" + chapidd + "&&cid=" + cidd).forward(request, response);

            }

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        ArrayList<Comment> comments = dao.getAllComments();

//              int commentid, String content, int chapid, int account
        int commentid = comments.get(0).getCommentid() + 1;
        //System.out.println(commentid);
        ArrayList<Comment> commentss = new ArrayList<>();

        commentss = dao.getCommentsByChapid(1);
        System.out.println(commentss.get(0).getComment());

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
