package service.impl;

import dao.FunctionDao;
import entity.Functions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.FunctionsService;

import java.util.List;
import java.util.function.Function;
@Service
public class FunctionsImplService implements FunctionsService {
    @Autowired
    private FunctionDao functionDao;
    @Override
    public List<Functions> getOneFuntions(int roleId) {
        return functionDao.selectFun(roleId);
    }
}
