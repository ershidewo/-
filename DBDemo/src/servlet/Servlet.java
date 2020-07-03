package servlet;

import Mybeans.UserStudent;
import dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getSession().setAttribute("page","jujia");
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String sno = request.getParameter("sno");
        String password = request.getParameter("password");

        UserStudent loginuser = new UserStudent();
        loginuser.setSno(sno);
        loginuser.setPassword(password);

        UserDao dao = new UserDao();

        UserStudent user = dao.login(loginuser);

        if(user==null){
            System.out.println("Wrong");
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        }
        else{
            response.sendRedirect("/DBDemo/shopping.jsp");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request, response);
    }
}
