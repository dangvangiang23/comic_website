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

/**
 *
 * @author MSI
 */
@WebServlet(name = "displayimage", urlPatterns = {"/displayimage"})
public class displayimage extends HttpServlet {

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

        DAO db = new DAO();
        String chapid_raw = request.getParameter("chapid");

        //get category for checkbox search from dbase
        ArrayList<Category> cates = new ArrayList<>();
        cates = db.findCategory();
        request.setAttribute("categories", cates);

        String cidd = request.getParameter("cid");
        int cid = Integer.parseInt(cidd);
        int chapid = Integer.parseInt(chapid_raw);
        DAO d = new DAO();

        //lay chapter'name tu database       
        Chapter chapter = db.findChapterbychapid(chapid);
        request.setAttribute("chapter", chapter);

        //laychap truoc chapsau
        //update view cua chapter trong dtb     
        d.updateViewChapter(chapid, chapter.getView() + 1);

        HttpSession session = request.getSession();

//       select top 1 * from chapter where cid = 1  order by chapid desc 
        //get comment
        ArrayList<Comment> commentss = new ArrayList<>();
        commentss = d.getCommentsByChapid(chapid);
        request.setAttribute("commentss", commentss);

        //get images per chapter
        ArrayList<String> urlimg = db.findImagesPerChapterid(chapid);
        request.setAttribute("urlimgs", urlimg);
        Comic finalcomic = db.findComicByCid(cid);

        //get chapters per comic to make navbar chapter
        ArrayList<Chapter> chapters = new ArrayList<>();
        chapters = db.findChapterComicByCid(cid);
        request.setAttribute("chapters", chapters);

        //chaptruoc 
        for (int i = 0; i < chapters.size() - 1; i++) {
            if (chapters.get(i).getChapid() == chapid && i != chapters.size() - 1) {
                i = i + 1;
                request.setAttribute("chapidnext", chapters.get(i).getChapid());
                break;
            }
        }
        //chapsau
        for (int i = 0; i < chapters.size() ; i++) {
            if (chapters.get(i).getChapid() == chapid && i > 0) {
                i = i - 1;
                request.setAttribute("chapidprevious", chapters.get(i).getChapid());
                break;
            }
        }

        request.setAttribute("comic2", finalcomic);
        request.getRequestDispatcher("pages/trangtruyen.jsp").forward(request, response);
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

    public static void main(String[] args) {
        DAO db = new DAO();
        ArrayList<Chapter> chapters = new ArrayList<>();
        chapters = db.findChapterComicByCid(1);
//        for(Chapter c : chapters)
//        {
//            System.out.println(c.getChapid());
//        }
        for (int i = 0; i < chapters.size() ; i++) {
            if (chapters.get(i).getChapid() == 19 && i > 0) {
                i = i - 1;
                System.out.println(chapters.get(i).getChapid());
                break;
            }
        }
        
    }
}
