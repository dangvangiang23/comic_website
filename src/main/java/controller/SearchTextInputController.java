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
import model.Category;
import model.Chapter;
import model.Comic;
import model.Comment;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author MSI
 */
@WebServlet(name = "SearchTextInputController", urlPatterns = {"/textsearch"})
public class SearchTextInputController extends HttpServlet {

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
        HttpSession session = request.getSession();
        DAO d = new DAO();
        ArrayList<Category> cates = new ArrayList<>();
        cates = d.findCategory();
        request.setAttribute("categories", cates);
        String search = request.getParameter("search-input");
        request.setAttribute("text-input", search);
        DAO db = new DAO();
        ArrayList<Comment> comments = db.getAllComments();
        ArrayList<Comment> newcmtlist = new ArrayList<>();
        if (comments.size() != 0 || comments.size() > 3) {
            for (int i = 0; i < 3; ++i) {
                newcmtlist.add(comments.get(i));
            }

            request.setAttribute("newcmt", newcmtlist);
        } else {
            for(int i = 0; i < comments.size(); ++i) {
                newcmtlist.add(comments.get(i));
            }

            request.setAttribute("newcmt", newcmtlist);
        }
        
        //nhiem vu search theo keyword
        List<Comic> comics = db.findAllComic();
        List newlist = new ArrayList();
        for (Comic c : comics) {
            if (c.getCname().toLowerCase().contains(search.toLowerCase())) {
                newlist.add(c);
            }
        }

        if (newlist.isEmpty()) {
            search = "Tất cả truyện tranh ";
        } else {
            search = "Kết quả truyện tranh theo từ khóa " + search;
            ArrayList<Chapter> chaptersLastest = new ArrayList<>();
            for (Comic c : comics) {
                Chapter cu = db.find1lastestChapterByCid(c.getCid());
                if (cu != null) {
                    chaptersLastest.add(cu);
                }
            }
            request.setAttribute("chapterlastest", chaptersLastest);
        }

        request.setAttribute("search", search);
        request.setAttribute("newlist", newlist);
        request.getRequestDispatcher("pages/homepage.jsp").forward(request, response);

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
