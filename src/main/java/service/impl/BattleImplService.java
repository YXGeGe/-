package service.impl;

import dao.BattleDao;
import entity.Battle;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.BattleService;

import java.util.List;
@Service
public class BattleImplService implements BattleService {
    @Autowired
    private BattleDao battleDao;


    @Override
    public List<Battle> findAllPageInStatus(int before, int after, int userId) {
        return battleDao.findAllPageInStatus(before,after,userId);
    }

    @Override
    public int count() {
        return battleDao.count();
    }

    @Override
    public int insertOneBattle(int matchId) {
        return battleDao.insertOneBattle(matchId);
    }

    @Override
    public int updateOneBattle(int battleId, int status) {
        return battleDao.updateOneBattle(battleId,status);
    }

    @Override
    public List<Battle> selectAllBattle(int matchId) {
        return battleDao.selectAllBattle(matchId);
    }

    @Override
    public int insertPlayerInBattle(int battleId, int playerId) {
        return battleDao.insertPlayerInBattle(battleId,playerId);
    }

    @Override
    public List<Battle> findAllPageUs(int before, int after) {
        return battleDao.findAllPageUs(before,after);
    }

    @Override
    public int insertNullInVote(int battleId, int matchId) {
        return battleDao.insertNullInVote(battleId,matchId);
    }

    @Override
    public List<Integer> selectAllPlayer(int matchId) {
        return battleDao.selectAllPlayer(matchId);
    }
}
