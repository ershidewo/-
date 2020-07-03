package dao;

import Mybeans.MenuList;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import utils.JDBCUtils;

public class MenuDao {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    /*登录*/
    public MenuList show() {
        try {

            String sql = "select * from menu";
            //System.out.println(loginUser.getSno()+loginUser.getPassword());
            //2.调用query方法
            MenuList ml = template.queryForObject(sql,
                    new BeanPropertyRowMapper<MenuList>(MenuList.class));
            return ml;
        } catch (DataAccessException e) {
            e.printStackTrace();//记录日志
            return null;
        }
    }
}