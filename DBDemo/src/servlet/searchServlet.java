package servlet;

import org.springframework.jdbc.core.JdbcTemplate;
import utils.JDBCUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/searchServlet")
public class searchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String search_goods = request.getParameter("search_goods");
        JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
        HttpSession session = request.getSession();
        String page = (String)session.getAttribute("page");
        List<Map<String,Object>> list = template.queryForList("select name,price from " + page + " where name like '%"+search_goods+"%'");
        session.setAttribute("List",list);
        request.getRequestDispatcher("search.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
