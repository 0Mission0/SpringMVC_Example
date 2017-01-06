package website.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import website.common.ParseXml;
import website.dao.AccountDao;

@Service("accountDao")
public class AccountDaoImpl implements AccountDao {
    private JdbcTemplate jdbcTemplate;

    @Resource(name = "dataSource")
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    // 取得user資料，可以自行編寫修改，請使用JdbcTemplate做操作
    @Override
    public List<Map<String, Object>> getAccountByName(String name, String password) throws Exception {
        String sql = ParseXml.getSqlByName("Account.checkAccount");
        List<Object> condition = new ArrayList<Object>();
        condition.add(name);
        condition.add(password);
        return jdbcTemplate.queryForList(sql, condition.toArray());
    }

    @Override
    public int createAccount(String account, String password, String name, String birthday, String phone) throws Exception {
        String sql = ParseXml.getSqlByName("Account.createAccount");
        System.out.println(sql);
        List<Object> condition = new ArrayList<Object>();
        condition.add(account);
        condition.add(password);
        condition.add(name);
        condition.add(birthday);
        condition.add(phone);
        condition.add(2);
        return jdbcTemplate.update(sql, condition.toArray());
    }

}
