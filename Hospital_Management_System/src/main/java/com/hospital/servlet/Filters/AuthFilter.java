// Filters/AuthFilter.java
package com.hospital.servlet.Filters;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebFilter(urlPatterns = {"/admin/*","/doctor/*","/patient/*",
        "/add_doctor.jsp","/add_patient.jsp","/book_appointment.jsp",
        "/edit_appointment.jsp","/view_appointments.jsp"})
public class AuthFilter implements Filter {
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("role") == null) {
            resp.sendRedirect(req.getContextPath()+"/login.jsp");
            return;
        }
        chain.doFilter(request, response);
    }
}
