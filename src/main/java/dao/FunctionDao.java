package dao;

import entity.Functions;

import java.util.List;

public interface FunctionDao {
    List<Functions> selectFun(int roleId);
}
