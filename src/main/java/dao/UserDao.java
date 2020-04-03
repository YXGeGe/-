package dao;



import entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

//@Repository
public interface UserDao {
//    插入一个新用户
    int insertOneUser(@Param("account") String account, @Param("password")String password); //@Param用户多个参数映射
//   检查用户名是否存在
    List<User> selectCheckUsername(String account);
//    验证用户并且返回用户类型
    List<User> selectCheckUser(@Param("account")String account,@Param("password")String password);
//    获得所有用户
    List<User> selectAllUser();
//更改一个用户
    int updateOneUser(@Param("userType") int userType,@Param("userId") int userId);
//    删除一个用户
    int deleteOneUser(int userId);
//    查询一个用户
    List<User> selectOneUser(int userId);


    public List<User> findAllPage(@Param("before") int before,@Param("after") int after);
    public int count();
}
