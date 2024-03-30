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
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author MSI
 */
@WebServlet(name = "mutisearch", urlPatterns = {"/mutisearch"})
public class mutisearch extends HttpServlet {

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
            HttpSession session = request.getSession();
            DAO dao = new DAO();
            //get chap lastest
            ArrayList<Comment> comments = dao.getAllComments();
            ArrayList<Comment> newcmtlist = new ArrayList<>();
            if (comments.size() != 0 || comments.size() > 3) {
                for (int i = 0; i < 3; ++i) {
                    newcmtlist.add(comments.get(i));
                }

                request.setAttribute("newcmt", newcmtlist);
            } else {
                for (int i = 0; i < comments.size(); ++i) {
                    newcmtlist.add(comments.get(i));
                }

                request.setAttribute("newcmt", newcmtlist);
            }

            ArrayList<Category> cates = new ArrayList<>();
            cates = dao.findCategory();
            request.setAttribute("categories", cates);

            String[] categori = request.getParameterValues("category");
            if (categori[0].equals("0")) {
                ArrayList<Comic> comics = dao.findAllComic();
                request.setAttribute("afterList", comics);
                request.getRequestDispatcher("pages/homepage_2.jsp").forward(request, response);

            } else {
                List<String> categories = new ArrayList<String>(Arrays.asList(categori));
                List<Integer> catid_int_input = new ArrayList<>();
                String catename = "Kết quả tìm kiếm cho thể loại ";

                for (String s : categories) {
                    catid_int_input.add(Integer.parseInt(s));
                }
                for (Integer i : catid_int_input) {
                    catename = catename + dao.findcategorybycatid(i).getCatname() + " ";

                }

                List<Comic> comiclist = dao.findAllComic();
                List<Comic> newlist2 = new ArrayList<>();
                List<Integer> catid = new ArrayList<>();
                for (Comic c : comiclist) {
                    for (Category cat : c.getCategories()) {
                        catid.add(cat.getId());
                    }
                    if (catid.containsAll(catid_int_input)) {
                        newlist2.add(c);

                    }
                    catid = new ArrayList<>();
                }
                if (newlist2.isEmpty()) {
                    request.setAttribute("cate_name", "Không có truyện nào thuộc thể loại này.");

                    request.getRequestDispatcher("pages/homepage_2.jsp").forward(request, response);

                } else {
                    request.setAttribute("cate_name", catename);
                    request.setAttribute("afterList", newlist2);
                    ArrayList<Chapter> chaptersLastest = new ArrayList<>();
                    for (Comic c : newlist2) {
                        Chapter cu = dao.find1lastestChapterByCid(c.getCid());
                        if (cu != null) {
                            chaptersLastest.add(cu);
                        }
                    }
                    request.setAttribute("chapterlastest", chaptersLastest);
                    request.getRequestDispatcher("pages/homepage_2.jsp").forward(request, response);
                }
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
        DAO dao = new DAO();
//         List<Comic> comiclist = dao.findAllComic();
//           List<Comic> newlist2 = new ArrayList<>();
//           List<Integer> catid = new ArrayList<>();
//          for (Comic c : comiclist) {
//                for (Category cat : c.getCategories()) {
//                    catid.add(cat.getId());
//                }
//                if(catid.contains(8))
//                {
//                    newlist2.add(c);
//                }
//                 catid = new ArrayList<>();
//            }
//          for(int c : catid)
//          {
//              
//              
//          }
        System.out.println(dao.findcategorybycatid(2).getCatname());
    }
}
