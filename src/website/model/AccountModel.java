package website.model;

import java.util.Map;

public interface AccountModel {

    public Map<String, Object> checkAccount(String name, String password) throws Exception;

    public int createAccount(String account, String password, String name, String birthday, String phone) throws Exception;
}
