/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.17
 * Generated at: 2022-05-31 05:36:57 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class acceso_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/lib/standard.jar", Long.valueOf(1653951253000L));
    _jspx_dependants.put("jar:file:/C:/Users/Nelcriollo/Desktop/ProyectoFinal_LPII/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/ProyectoFinal_LPII/WEB-INF/lib/standard.jar!/META-INF/c-1_0-rt.tld", Long.valueOf(1098729090000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\n');
      out.write('\n');

if (request.getSession().getAttribute("LISTAMenu") == null)
	response.sendRedirect("login.jsp");

      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"ISO-8859-1\">\n");
      out.write("<title>Acceso</title>\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- Los estilos de Bootstrap-->\n");
      out.write("<link\n");
      out.write("\thref=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\"\n");
      out.write("\trel=\"stylesheet\"\n");
      out.write("\tintegrity=\"sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3\"\n");
      out.write("\tcrossorigin=\"anonymous\">\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- Para usar las tablas de Bootstrap-->\n");
      out.write("<link\n");
      out.write("\thref=\"https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css\"\n");
      out.write("\trel=\"stylesheet\">\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("\t<div class=\"container\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\t\t<div class=\"row \">\n");
      out.write("\t\t\t<h2 class=\"text-center mt-5 fw-bolder fs-1\">Mantenimiento de Usuario</h2>\n");
      out.write("\t\t\t<div class=\"row  mb-5 ms-0 justify-content-end align-items-center\">\n");
      out.write("\t\t\t\t<div class=\"col  align-middle\">\n");
      out.write("\t\t\t\t\t<a class=\"btn btn-secondary float-end \" class=\"btn btn-success\"\n");
      out.write("\t\t\t\t\t\thref=\"ServletAcceso?tipo=LISTAR\" role=\"button\">Listar Accesos</a>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"row ms-0 d-flex p-2\">\n");
      out.write("\t\t\t\t<div class=\"col mt-5\">\n");
      out.write("\t\t\t\t\t<form class=\"row rounded p-2 border border-dark\">\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t<div class=\"col-md-6\">\n");
      out.write("\t\t\t\t\t\t\t<label for=\"inputPassword4\" class=\"form-label\">Usuario</label> <input\n");
      out.write("\t\t\t\t\t\t\t\ttype=\"text\" class=\"form-control\" id=\"inputPassword4\">\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<div class=\"col-md-6\">\n");
      out.write("\t\t\t\t\t\t\t<label for=\"inputState\" class=\"form-label\">Menu</label> <select\n");
      out.write("\t\t\t\t\t\t\t\tid=\"inputState\" class=\"form-select\">\n");
      out.write("\t\t\t\t\t\t\t\t<option selected>Choose...</option>\n");
      out.write("\t\t\t\t\t\t\t\t<option>...</option>\n");
      out.write("\t\t\t\t\t\t\t</select>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t<div class=\"col-md-12\">\n");
      out.write("\t\t\t\t\t\t\t<label for=\"inputState\" class=\"form-label\">Opcion de Menu</label>\n");
      out.write("\t\t\t\t\t\t\t<select id=\"inputState\" class=\"form-select\">\n");
      out.write("\t\t\t\t\t\t\t\t<option selected>Choose...</option>\n");
      out.write("\t\t\t\t\t\t\t\t<option>...</option>\n");
      out.write("\t\t\t\t\t\t\t</select>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t<div class=\"col-12\">\n");
      out.write("\t\t\t\t\t\t\t<div class=\"form-check\">\n");
      out.write("\t\t\t\t\t\t\t\t<input class=\"form-check-input\" type=\"checkbox\" id=\"gridCheck\">\n");
      out.write("\t\t\t\t\t\t\t\t<label class=\"form-check-label\" for=\"gridCheck\"> Check\n");
      out.write("\t\t\t\t\t\t\t\t\tme out </label>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<div class=\"row d-flex justify-content-center\">\n");
      out.write("\t\t\t\t\t\t\t<div class=\"col-3 p-2\">\n");
      out.write("\t\t\t\t\t\t\t\t<button type=\"submit\" class=\"btn btn-primary\">Registar</button>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t<div class=\"col-3 p-2\">\n");
      out.write("\t\t\t\t\t\t\t\t<button type=\"btn\" class=\"btn btn-secondary\">Cancelar</button>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t</form>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t<div class=\"col mt-5\">\n");
      out.write("\t\t\t\t\t<div class=\" row p-2 table-responsive\">\n");
      out.write("\t\t\t\t\t\t<table id=\"example\"\n");
      out.write("\t\t\t\t\t\t\tclass=\"table  table-striped fw-light mb-0 align-top\"\n");
      out.write("\t\t\t\t\t\t\tstyle=\"width: 100%\">\n");
      out.write("\t\t\t\t\t\t\t<thead class=\"table-dark fw-light\">\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t\t\t<th>NOMBRE DE MENU</th>\n");
      out.write("\t\t\t\t\t\t\t\t\t<th>USUARIO</th>\n");
      out.write("\t\t\t\t\t\t\t\t\t<th>OPCION DEL MENU</th>\n");
      out.write("\t\t\t\t\t\t\t\t\t<th></th>\n");
      out.write("\t\t\t\t\t\t\t\t\t<th></th>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\t\t</thead>\n");
      out.write("\t\t\t\t\t\t\t<tbody>\n");
      out.write("\t\t\t\t\t\t\t\t");
      if (_jspx_meth_c_005fforEach_005f0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t</tbody>\n");
      out.write("\t\t\t\t\t\t</table>\n");
      out.write("\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\n");
      out.write("\t</div>\n");
      out.write("\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\t<script src=\"https://code.jquery.com/jquery-3.6.0.min.js\"\n");
      out.write("\t\tintegrity=\"sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=\"\n");
      out.write("\t\tcrossorigin=\"anonymous\"></script>\n");
      out.write("\n");
      out.write("\t<script\n");
      out.write("\t\tsrc=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js\"\n");
      out.write("\t\tintegrity=\"sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p\"\n");
      out.write("\t\tcrossorigin=\"anonymous\"></script>\n");
      out.write("\n");
      out.write("\t<!-- JS para validación-->\n");
      out.write("\t<script\n");
      out.write("\t\tsrc=\"https://cdn.bootcdn.net/ajax/libs/bootstrap-validator/0.4.0/js/bootstrapValidator.js\"></script>\n");
      out.write("\n");
      out.write("\t<script>\n");
      out.write("\t\tvar popoverTriggerList = [].slice.call(document\n");
      out.write("\t\t\t\t.querySelectorAll('[data-bs-toggle=\"popover\"]'))\n");
      out.write("\t\tvar popoverList = popoverTriggerList.map(function(popoverTriggerEl) {\n");
      out.write("\t\t\treturn new bootstrap.Popover(popoverTriggerEl)\n");
      out.write("\t\t})\n");
      out.write("\t</script>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fforEach_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_005fforEach_005f0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    boolean _jspx_th_c_005fforEach_005f0_reused = false;
    try {
      _jspx_th_c_005fforEach_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fforEach_005f0.setParent(null);
      // /acceso.jsp(106,8) name = items type = java.lang.Object reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fforEach_005f0.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${requestScope.listaAccesos}", java.lang.Object.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      // /acceso.jsp(106,8) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fforEach_005f0.setVar("row");
      int[] _jspx_push_body_count_c_005fforEach_005f0 = new int[] { 0 };
      try {
        int _jspx_eval_c_005fforEach_005f0 = _jspx_th_c_005fforEach_005f0.doStartTag();
        if (_jspx_eval_c_005fforEach_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
          do {
            out.write("\n");
            out.write("\t\t\t\t\t\t\t\t\t<tr>\n");
            out.write("\t\t\t\t\t\t\t\t\t\t<td>");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${row.des_menu}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("</td>\n");
            out.write("\t\t\t\t\t\t\t\t\t\t<td>");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${row.login_usuario}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("</td>\n");
            out.write("\t\t\t\t\t\t\t\t\t\t<td>");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${row.des_rol}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("</td>\n");
            out.write("\n");
            out.write("\n");
            out.write("\t\t\t\t\t\t\t\t\t\t<td class=\"p-1\"><button type=\"button\"\n");
            out.write("\t\t\t\t\t\t\t\t\t\t\t\tclass=\"btn btn-outline-success btn-sm align-top\"\n");
            out.write("\t\t\t\t\t\t\t\t\t\t\t\tdata-bs-toggle=\"modal\" data-bs-target=\"#staticBackdrop\"\n");
            out.write("\t\t\t\t\t\t\t\t\t\t\t\tid=\"cerrarmsj\" onclick=\"fcerrar()\">Editar</button></td>\n");
            out.write("\t\t\t\t\t\t\t\t\t\t<td class=\"p-1\"><button type=\"button\"\n");
            out.write("\t\t\t\t\t\t\t\t\t\t\t\tclass=\"btn btn-outline-danger btn-sm align-top p-1\"\n");
            out.write("\t\t\t\t\t\t\t\t\t\t\t\tdata-bs-toggle=\"modal\" data-bs-target=\"#modalElimimar\">Eliminar</button></td>\n");
            out.write("\n");
            out.write("\t\t\t\t\t\t\t\t\t</tr>\n");
            out.write("\t\t\t\t\t\t\t\t");
            int evalDoAfterBody = _jspx_th_c_005fforEach_005f0.doAfterBody();
            if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
              break;
          } while (true);
        }
        if (_jspx_th_c_005fforEach_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return true;
        }
      } catch (java.lang.Throwable _jspx_exception) {
        while (_jspx_push_body_count_c_005fforEach_005f0[0]-- > 0)
          out = _jspx_page_context.popBody();
        _jspx_th_c_005fforEach_005f0.doCatch(_jspx_exception);
      } finally {
        _jspx_th_c_005fforEach_005f0.doFinally();
      }
      _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.reuse(_jspx_th_c_005fforEach_005f0);
      _jspx_th_c_005fforEach_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fforEach_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fforEach_005f0_reused);
    }
    return false;
  }
}
