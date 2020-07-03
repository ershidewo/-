package dao;

import Mybeans.UserStudent;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import utils.JDBCUtils;

public class UserDao {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    /*登录*/
    public UserStudent login(UserStudent loginUser) {
        try {
            String sql = "select * from user where sno = ? and password = ?";

            UserStudent user = template.queryForObject(sql,
                    new BeanPropertyRowMapper<UserStudent>(UserStudent.class),
                    loginUser.getSno(), loginUser.getPassword());
            return user;
        } catch (DataAccessException e) {
            e.printStackTrace();
            return null;
        }
    }
}
