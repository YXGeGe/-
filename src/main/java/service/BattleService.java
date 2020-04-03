package service;

import entity.Battle;
import entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BattleService {
    public List<Battle> findAllPageInStatus(@Param("before") int before, @Param("after") int after,@Param(("userId")) int userId);

    public int count();
    int insertOneBattle(@Param("matchId")int matchId);
    public int updateOneBattle(@Param("battleId") int battleId,@Param("status") int status);
    List<Battle> selectAllBattle(int matchId);
    int insertPlayerInBattle(@Param("battleId") int battleId,@Param("playerId") int playerId);
    public List<Battle> findAllPageUs(@Param("before") int before, @Param("after") int after);
    int insertNullInVote(@Param("battleId") int battleId,@Param("matchId") int matchId);
    List<Integer> selectAllPlayer(@Param("matchId") int matchId);
}
