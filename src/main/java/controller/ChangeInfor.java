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

import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author MSI
 */
@WebServlet(name="ChangeInfor", urlPatterns={"/change"})
public class ChangeInfor extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangeInfor</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeInfor at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("/pages/thaydoithongtin.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        String newusername= request.getParameter("new-name");
        String newpass = request.getParameter("new-pass");
        String re = request.getParameter("repass");
        DAO dao = new DAO();
        HttpSession session = request.getSession();
        Account a = (Account)session.getAttribute("userLogged");
       
        if(a!=null){
        if(newusername.equals("")||newpass.equals("")||re.equals(""))
        {
            request.setAttribute("message","Không để trống!");
             request.getRequestDispatcher("/pages/thaydoithongtin.jsp").forward(request, response);
        }else {
            if(newpass.equals(re))
            {
                //update
                dao.UpdateAccount(newusername, newpass, a.getAccountid() );
                 request.setAttribute("message","Update thành công!");
                 request.getRequestDispatcher("pages/thaydoithongtin.jsp").forward(request, response);
                
            }else {
                request.setAttribute("message","Mật khẩu nhập lại không trùng khớp!");
                 request.getRequestDispatcher("/pages/thaydoithongtin.jsp").forward(request, response);
            }
        }
        }else {
            request.getRequestDispatcher("/login").forward(request, response);
            
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
