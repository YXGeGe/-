package service.impl;

import dao.PlayerDao;
import entity.player;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.PlayerService;

import java.util.List;

@Service
public class PlayerImplService implements PlayerService {
    @Autowired
    private PlayerDao playerDao;
    @Override
    public int insertOnePlayer(String playerName) {
        return playerDao.insertOnePlayer(playerName);
    }




    @Override
    public List<player> findAllPage(int before, int after) {
        return playerDao.findAllPage(before,after);
    }

    @Override
    public int count() {
        return playerDao.count();
    }

    @Override
    public int insertOnePM(int playerId, int matchId) {
        return playerDao.insertOnePM(playerId,matchId);
    }

    @Override
    public List<Integer> selectAllPlayer(int matchId) {
        return playerDao.selectAllPlayer(matchId);
    }

//    @Override
//    public List<Integer> selectOnePM(int matchId) {
//        return playerDao.selectOnePM(matchId);
//    }
}
