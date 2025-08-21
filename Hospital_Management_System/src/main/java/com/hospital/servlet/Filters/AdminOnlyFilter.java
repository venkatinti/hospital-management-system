// Filters/AdminOnlyFilter.java
package com.hospital.servlet.Filters;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebFilter(urlPatterns = {"/admin/*"})
public class AdminOnlyFilter implements Filter {
    public void doFilter(ServletRequest r, ServletResponse s, FilterChain c)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) r;
        HttpServletResponse resp = (HttpServletResponse) s;
        HttpSession session = req.getSession(false);
        if (!"ADMIN".equals(session.getAttribute("role"))) {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        c.doFilter(r, s);
    }
}
