package website.model.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import website.dao.AccountDao;
import website.model.AccountModel;

@Service("accountModel")
public class AccountModelImpl implements AccountModel {

    private AccountDao accountDao;

    @Resource(name = "accountDao")
    public void setAccountDao(AccountDao accountDao) {
        this.accountDao = accountDao;
    }

    // 檢查使用者登入帳號密碼
    @Override
    public Map<String, Object> checkAccount(String name, String password) throws Exception {
        if (name == null || password == null || "".equals(name) || "".equals(password)) {
            return null;
        }

        List<Map<String, Object>> users = accountDao.getAccountByName(name, password);
        if (users != null && users.size() > 0) {
            return users.get(0);
        }
        else {
            return null;
        }
    }

    @Override
    public int createAccount(String account, String password, String name, String birthday, String phone) throws Exception {
        return accountDao.createAccount(account, password, name, birthday, phone);
    }
}
