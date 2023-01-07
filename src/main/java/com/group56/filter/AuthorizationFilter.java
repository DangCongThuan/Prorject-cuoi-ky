package com.group56.filter;

import com.group56.constant.SystemConstant;
import com.group56.model.UserModel;
import com.group56.utils.SessionUtil;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "AuthorizationFilter", urlPatterns = "/*")
public class AuthorizationFilter implements Filter {
    private ServletContext servletContext;

    public void init(FilterConfig config) throws ServletException {
        this.servletContext = config.getServletContext();
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        String url = httpServletRequest.getRequestURI();
        if (url.startsWith("/admin")) {
            UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(httpServletRequest, "USERMODEL");
            if (userModel != null) {
                if (userModel.getRoleModel().getName().equals(SystemConstant.ADMIN)) {
                    chain.doFilter(request, response);
                } else {
                    httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/dang-nhap?action=login&message=not_allow&alert=danger");
                }
            } else {
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/dang-nhap?action=login&message=not_login&alert=danger");
            }
        } else {
            chain.doFilter(request, response);
        }
    }
}
