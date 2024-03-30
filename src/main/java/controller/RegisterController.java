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
import java.util.ArrayList;

/**
 *
 * @author MSI
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {

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
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("/pages/register.jsp").forward(request, response);

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
           HttpSession session = request.getSession(); 
        String username = request.getParameter("rgusername");
        String password = request.getParameter("rgpassword");
        String repassword = request.getParameter("repassword");
        DAO db = new DAO();
        if (password.equals("") || username.equals("") || repassword.equals("")) {
            String ss = "Mật khẩu hoặc username không được để trống !";
            request.setAttribute("rgmessage", ss);
            request.getRequestDispatcher("/pages/register.jsp").forward(request, response);

        } else {
            if (!(password.equals(repassword))) {
                String ss = "Mật khẩu nhập lại không trùng khớp !";
                request.setAttribute("rgmessage", ss);
                request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
            } else if (password.equals(repassword)) {
                ArrayList<Account> accounts = db.findAccount();
                int aid = accounts.get(accounts.size() - 1).getAccountid();
                Account a = new Account(aid + 1, username, password, false);
                db.AddAccount(a);
                String ss = "Đăng ký thành công !";
                request.setAttribute("rgmessage", ss);

                //request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
                response.sendRedirect("/AWebtruyentranh/login");
            }
        }
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
        ArrayList<Account> accounts = db.findAccount();
        int aid = accounts.get(accounts.size() - 1).getAccountid();
        Account a = new Account(aid + 1, "aaa", "HHHH", false);
        System.out.println(a.getAccountid()+ " " +a.getUsername()+ " " +a.getPassword()+ " " +a.isRole());
        
    }

}
