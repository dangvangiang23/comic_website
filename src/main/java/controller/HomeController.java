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
import model.Category;
import model.Chapter;
import model.Comic;
import model.Comment;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author MSI
 */
@WebServlet(name = "HomeController", urlPatterns = {"/home"})
public class HomeController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HomeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        DAO db = new DAO();
        //get categories
        ArrayList<Category> cates = new ArrayList<>();
        cates = db.findCategory();
        request.setAttribute("categories", cates);

        ArrayList<Comic> comics = db.findAllComic();
        request.setAttribute("list", comics);

        //get chap lastest
        ArrayList<Chapter> chaptersLastest = new ArrayList<>();
        for (Comic c : comics) {
            Chapter cu = db.find1lastestChapterByCid(c.getCid());
            if (cu != null) {
                chaptersLastest.add(cu);
            }
        }
          request.setAttribute("chapterlastest", chaptersLastest);
        //get 3 comment lastest 
        ArrayList<Comment> newcmtlist = new ArrayList<>();
        ArrayList<Comment> comments = db.getAllComments();
        
       if (comments.size() != 0 ||comments.size()>3) {
            for (int i = 0; i < 3; ++i) {
                newcmtlist.add(comments.get(i));
            }

            request.setAttribute("newcmt", newcmtlist);
        }
       else
       {
          for (int i = 0; i < comments.size(); ++i) {
                newcmtlist.add(comments.get(i));
            }

            request.setAttribute("newcmt", newcmtlist);
       }
      
        request.getRequestDispatcher("pages/homepage.jsp").forward(request, response);
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

    public static void main(String[] args) {
        DAO d = new DAO();
        List<Comic> list = d.findAllComic();
        System.out.println(list.toArray());
    }

}
