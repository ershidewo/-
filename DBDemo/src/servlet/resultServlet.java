package servlet;

import org.springframework.jdbc.core.JdbcTemplate;
import utils.JDBCUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/resultServlet")
public class resultServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
        String[] check = (String[])request.getSession().getAttribute("check");
        String[] shopName = (String[])request.getSession().getAttribute("shopName");
        for(int i = 0 ; i < shopName.length ; i++){
            if("true".equals(check[i+1])){
                template.update("delete from shopcar where name = '" + shopName[i] + "'");
            }
        }
        template.update("update shopcar set result = count * price");
        response.sendRedirect("buyPage.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
