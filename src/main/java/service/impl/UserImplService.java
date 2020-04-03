package service.impl;


import dao.UserDao;
import entity.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.UserService;

import java.util.List;
@Service
public class UserImplService implements UserService {

    @Autowired
    private UserDao userdao;
    @Override
    public int insertOneUser(String account,String password) {
        return userdao.insertOneUser(account,password);
    }


    @Override
    public List<User> selectAllUser() {
        return userdao.selectAllUser();
    }

    @Override
    public int deleteOneUser(int userId) {
        return userdao.deleteOneUser(userId);
    }

    @Override
    public List<User> selectOneUser(int userId) {
        return userdao.selectOneUser(userId);
    }

    @Override
    public List<User> findAllPage(int before, int after) {
        return userdao.findAllPage(before,after);
    }

    @Override
    public int count() {
        return userdao.count();
    }

    @Override
    public List<User> selectCheckUsername(String username) {
        return userdao.selectCheckUsername(username);
    }

    @Override
    public List<User> selectCheckUser(String username, String password) {
        return userdao.selectCheckUser(username,password);
    }

    @Override
    public int updateOneUser(int userType, int userId) {
        return userdao.updateOneUser(userType,userId);
    }
}

