/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author Thang
 */
@WebServlet(name = "ChangeServlet", urlPatterns = {"/change"})
public class ChangeServlet extends HttpServlet {

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
            out.println("<title>Servlet ChangeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeServlet at " + request.getContextPath() + "</h1>");
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
        String u = request.getParameter("user");
        String op = request.getParameter("opass");        //old
        String p = request.getParameter("pass");        //new
        String rp = request.getParameter("repass");
        DAO dao = new DAO();
        Account a = dao.login(u, op);
        if (a == null) {
            //ko ton tai
            String ms = "Old password is incorrect!";
            request.setAttribute("ms", ms);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (!p.equals(rp)) {
            String ms = "Confirm password is incorrect!";
            request.setAttribute("ms", ms);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            //dung old password
            Account ac = new Account(a.getId(), u, p, a.getRole(), a.getName());
            dao.change(ac);
            HttpSession session = request.getSession();
            session.setAttribute("acc", ac);
            response.sendRedirect("home");
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
        DAO dao = new DAO();
        Account a = dao.login("admin", "123456");
        String p = "thang";
        String rp = "thang";
        if (a == null) {
            System.out.println("rong");
        } else if (p != rp) {
            System.out.println("sai");
        } else {
            System.out.println("xong");
        }
    }
}
