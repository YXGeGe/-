package service;


import entity.Vote;
import entity.player;
import entity.vote_record;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VoteService {
    public List<Vote> selectOneVote(@Param("matchId") int matchId,@Param("battleId") int battleId);
    List<player> selectOneVotePlayerName( @Param("battleId") int battleId);


    int updateOneVote(@Param("matchId") int matchId,@Param("battleId") int battleId,@Param("vote1") int vote1,@Param("vote2") int vote2);

    List<vote_record> selectUserVoteLimit(@Param("matchId") int matchId, @Param("battleId") int battleId, @Param("userId") int userId);
    List<vote_record> insertUserVoteLimit(@Param("matchId") int matchId,@Param("battleId") int battleId,@Param("userId") int userId);
    int updateUserVoteLimit(@Param("voteLimit") int voteLimit,@Param("matchId") int matchId,@Param("battleId") int battleId,@Param("userId") int userId);

    public List<Vote> findAllPage(@Param("before") int before, @Param("after") int after);
    public int count();

}
