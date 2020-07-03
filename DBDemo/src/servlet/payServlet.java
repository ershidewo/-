package servlet;

import org.springframework.jdbc.core.JdbcTemplate;
import utils.JDBCUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.transform.Templates;
import java.io.IOException;
import java.io.Writer;

public class payServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
        HttpSession session = request.getSession();
        Writer out = response.getWriter();
        String[] count = request.getParameterValues("count");
        String[] shopName = request.getParameterValues("shopName");
        String if_check = request.getParameter("if_Check");
        String[] check = if_check.split(",");

        for(int i = 0 ; i < shopName.length ; i++){
            if("true".equals(check[i+1])){
                template.update("update shopcar set count = " + count[i] + " where name = '" + shopName[i] + "'");
            }

        }
        template.update("update shopcar set result = count * price");

        /*for(int i = 0 ; i < shopName.length ; i++){
            if("true".equals(check[i])){
                template.update("delete from shopcar where name = '" + shopName[i] + "'");
            }
        }*/
        out.write("<html>");
        out.write("<head>");
        out.write("</head>");
        out.write("<body>");
        out.write("<script>");
        out.write("alert(\"确定结算吗？。。。\")");
        out.write("</script>");
        out.write("</body>");
        out.write("</html>");
        session.setAttribute("shopName",shopName);
        session.setAttribute("check",check);
        request.getRequestDispatcher("payPage.jsp").forward(request,response);
        //response.sendRedirect("payPage.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
