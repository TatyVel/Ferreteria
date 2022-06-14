package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n");
      out.write("        <title>Iniciar sesión</title>\n");
      out.write("        <!-- plugins:css -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/assets/vendors/mdi/css/materialdesignicons.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/assets/vendors/css/vendor.bundle.base.css\">\n");
      out.write("        <!-- endinject -->\n");
      out.write("        <!-- Plugin css for this page -->\n");
      out.write("        <!-- End plugin css for this page -->\n");
      out.write("        <!-- Layout styles -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/assets/css/demo/style.css\">\n");
      out.write("        <!-- End layout styles -->\n");
      out.write("        <link rel=\"shortcut icon\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/assets/images/favicon.png\" />\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/assets/js/preloader.js\"></script>\n");
      out.write("        <div class=\"body-wrapper\">\n");
      out.write("            <div class=\"main-wrapper\">\n");
      out.write("                <div class=\"page-wrapper full-page-wrapper d-flex align-items-center justify-content-center\">\n");
      out.write("                    <main class=\"auth-page\">\n");
      out.write("                        <div class=\"mdc-layout-grid\">\n");
      out.write("                            <div class=\"mdc-layout-grid__inner\">\n");
      out.write("                                <div class=\"stretch-card mdc-layout-grid__cell--span-4-desktop mdc-layout-grid__cell--span-1-tablet\"></div>\n");
      out.write("                                <div class=\"mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-4-desktop mdc-layout-grid__cell--span-6-tablet\">\n");
      out.write("                                    <div class=\"mdc-card\">\n");
      out.write("                                        <h6 class=\"card-title\" style=\"text-align: center;\">Iniciar sesión</h6>\n");
      out.write("                                        <form action=\"login?action=iniciar\" method=\"post\">\n");
      out.write("                                            <div class=\"mdc-layout-grid\">\n");
      out.write("                                                <div class=\"mdc-layout-grid__inner\">\n");
      out.write("                                                    <div class=\"mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12\">\n");
      out.write("                                                        <div class=\"mdc-text-field w-100\">\n");
      out.write("                                                            <input name=\"usuario\" class=\"mdc-text-field__input\" id=\"text-field-hero-input\">\n");
      out.write("                                                            <div class=\"mdc-line-ripple\"></div>\n");
      out.write("                                                            <label for=\"text-field-hero-input\" class=\"mdc-floating-label\">Username</label>\n");
      out.write("                                                        </div>\n");
      out.write("                                                    </div>\n");
      out.write("                                                    <div class=\"mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12\">\n");
      out.write("                                                        <div class=\"mdc-text-field w-100\">\n");
      out.write("                                                            <input name=\"clave\" class=\"mdc-text-field__input\" type=\"password\" id=\"text-field-hero-input\">\n");
      out.write("                                                            <div class=\"mdc-line-ripple\"></div>\n");
      out.write("                                                            <label for=\"text-field-hero-input\" class=\"mdc-floating-label\">Contraseña</label>\n");
      out.write("                                                        </div>\n");
      out.write("                                                    </div>\n");
      out.write("                                                    <div class=\"mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop\">\n");
      out.write("                                                        <div class=\"mdc-form-field\">\n");
      out.write("                                                            <div class=\"mdc-checkbox\">\n");
      out.write("                                                                <input type=\"checkbox\"\n");
      out.write("                                                                       class=\"mdc-checkbox__native-control\"\n");
      out.write("                                                                       id=\"checkbox-1\"/>\n");
      out.write("                                                                <div class=\"mdc-checkbox__background\">\n");
      out.write("                                                                    <svg class=\"mdc-checkbox__checkmark\"\n");
      out.write("                                                                         viewBox=\"0 0 24 24\">\n");
      out.write("                                                                    <path class=\"mdc-checkbox__checkmark-path\"\n");
      out.write("                                                                          fill=\"none\"\n");
      out.write("                                                                          d=\"M1.73,12.91 8.1,19.28 22.79,4.59\"/>\n");
      out.write("                                                                    </svg>\n");
      out.write("                                                                    <div class=\"mdc-checkbox__mixedmark\"></div>\n");
      out.write("                                                                </div>\n");
      out.write("                                                            </div>\n");
      out.write("                                                            <label for=\"checkbox-1\">Recuérdame</label>\n");
      out.write("                                                        </div>\n");
      out.write("                                                    </div>\n");
      out.write("                                                    <div class=\"mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop d-flex align-items-center justify-content-end\">\n");
      out.write("                                                        <a href=\"#\">Has olvidado tu contraseña</a>\n");
      out.write("                                                    </div>\n");
      out.write("                                                    \n");
      out.write("                                                    <div class=\"mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12\">\n");
      out.write("                                                        <center><span style=\"color: red; text-align: center\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${msg}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</span></center>\n");
      out.write("                                                    </div>\n");
      out.write("                                                    <div class=\"mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12\">\n");
      out.write("                                                        <button type=\"submit\" class=\"mdc-button mdc-button--raised w-100\">Entrar</button>\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                        </form>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"stretch-card mdc-layout-grid__cell--span-4-desktop mdc-layout-grid__cell--span-1-tablet\"></div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </main>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!-- plugins:js -->\n");
      out.write("        <script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/assets/vendors/js/vendor.bundle.base.js\"></script>\n");
      out.write("        <!-- endinject -->\n");
      out.write("        <!-- Plugin js for this page-->\n");
      out.write("        <!-- End plugin js for this page-->\n");
      out.write("        <!-- inject:js -->\n");
      out.write("        <script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/assets/js/material.js\"></script>\n");
      out.write("        <script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/assets/js/misc.js\"></script>\n");
      out.write("        <!-- endinject -->\n");
      out.write("        <!-- Custom js for this page-->\n");
      out.write("        <!-- End custom js for this page-->\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
