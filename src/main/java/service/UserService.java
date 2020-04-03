package service;

import entity.User;
import org.apache.ibatis.annotations.Param;


import java.util.List;

public interface UserService {
    int insertOneUser(String account,String password);
    List<User> selectCheckUsername(String account);
    List<User> selectCheckUser(String account,String password);
    int updateOneUser(int userType,int userId);
    List<User> selectAllUser();
    int deleteOneUser(int userId);
    List<User> selectOneUser(int userId);


    public List<User> findAllPage(int before,int after);

    public int count();
}
