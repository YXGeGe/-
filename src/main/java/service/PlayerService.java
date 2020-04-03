package service;

import entity.User;
import entity.player;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PlayerService {
    int insertOnePlayer(@Param("playerName") String playerName);

    public List<player> findAllPage(@Param("before") int before, @Param("after") int after);
    public int count();
    int insertOnePM(@Param("playerId")int playerId,@Param("matchId")int matchId);
    List<Integer> selectAllPlayer(@Param("matchId") int matchId);
//    List<Integer> selectOnePM(@Param("matchId") int matchId);

}
