// Filters/PatientOnlyFilter.java
package com.hospital.servlet.Filters;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebFilter(urlPatterns = {"/patient/*"})
public class PatientOnlyFilter implements Filter {
    public void doFilter(ServletRequest r, ServletResponse s, FilterChain c)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) r;
        HttpServletResponse resp = (HttpServletResponse) s;
        HttpSession session = req.getSession(false);
        if (!"PATIENT".equals(session.getAttribute("role"))) {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        c.doFilter(r, s);
    }
}
