package service.impl;

import dao.MatchDao;
import entity.Match;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.MatchService;

import java.util.List;
@Service
public class MatcImplService implements MatchService {
    @Autowired
    private MatchDao matchDao;
    @Override
    public List<Match> findAllPage(int before, int after) {
        return matchDao.findAllPage(before,after);
    }

    @Override
    public int count() {
        return matchDao.count();
    }

    @Override
    public int updateOneMatch(int matchId, int status) {
        return matchDao.updateOneMatch(matchId,status);
    }

    @Override
    public List<Match> findAllPageOne(int before, int after, int userId) {
        return matchDao.findAllPageOne(before,after,userId);
    }

    @Override
    public int insertOneMatch(String matchName, String matchDate, int userId) {
        return matchDao.insertOneMatch(matchName,matchDate,userId);
    }
}
