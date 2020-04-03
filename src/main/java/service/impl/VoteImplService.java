package service.impl;

import dao.VoteDao;

import entity.Vote;
import entity.player;
import entity.vote_record;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.VoteService;

import java.util.List;
@Service
public class VoteImplService implements VoteService {
    @Autowired
    private VoteDao voteDao;


    @Override
    public List<Vote> selectOneVote(int matchId, int battleId) {
        return voteDao.selectOneVote(matchId,battleId);
    }

    @Override
    public List<player> selectOneVotePlayerName(int battleId) {
        return voteDao.selectOneVotePlayerName(battleId);
    }

    @Override
    public int updateOneVote(int matchId, int battleId, int vote1, int vote2) {
        return voteDao.updateOneVote(matchId, battleId, vote1, vote2);
    }

    @Override
    public List<vote_record> selectUserVoteLimit(int matchId, int battleId, int userId) {
        return voteDao.selectUserVoteLimit(matchId, battleId, userId);
    }

    @Override
    public List<vote_record> insertUserVoteLimit(int matchId, int battleId, int userId) {
        return voteDao.insertUserVoteLimit(matchId, battleId, userId);
    }

    @Override
    public int updateUserVoteLimit(int voteLimit, int matchId, int battleId, int userId) {
        return voteDao.updateUserVoteLimit(voteLimit, matchId, battleId, userId);
    }

    @Override
    public List<Vote> findAllPage(int before, int after) {
        return voteDao.findAllPage(before, after);
    }

    @Override
    public int count() {
        return voteDao.count();
    }


}
