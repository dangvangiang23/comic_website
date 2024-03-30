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

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author MSI
 */
@WebServlet(name = "displaycomic", urlPatterns = {"/displaycomic"})
public class displaycomic extends HttpServlet {

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
        DAO d = new DAO();
        ArrayList<Category> cates = new ArrayList<>();
        cates = d.findCategory();
        request.setAttribute("categories", cates);
        String cid = request.getParameter("cid");
        DAO db = new DAO();
        int cid_new = Integer.parseInt(cid);
        ArrayList<Chapter> chapters = db.findChapterComicByCid(cid_new);
        Comic comic = db.findComicByCid(cid_new);
        //find list categories
        
        Chapter chapbegin = d.beginChapter(cid_new);
        request.setAttribute("chapbegin", chapbegin);
        Chapter chapend = d.endChapter(cid_new);
        request.setAttribute("chapend", chapend);

        ArrayList<Category> catess = db.findlistCategoriesByCid(cid_new);
        int view = db.findViewbyCid(cid_new);
        Date lastestdate = db.findLatestDateByCId(cid_new);
        request.setAttribute("cates", catess);
        HttpSession session = request.getSession();
        request.setAttribute("chapters", chapters);
        request.setAttribute("date", lastestdate);
        request.setAttribute("comic", comic);
        request.setAttribute("view", view);
        request.getRequestDispatcher("pages/readComic.jsp").forward(request, response);
    }

    public static void main(String[] args) {
        DAO db = new DAO();

        ArrayList<Chapter> chapters = db.findChapterComicByCid(1);
        for (Chapter c : chapters) {
            System.out.println(c);
        }
        int view = db.findViewbyCid(1);
        System.out.println(view);
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
