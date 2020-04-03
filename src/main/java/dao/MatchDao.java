package dao;

import entity.Match;
import entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MatchDao {
    public List<Match> findAllPage(@Param("before") int before, @Param("after") int after);
    public int count();
    public int updateOneMatch(@Param("matchId") int matchId,@Param("status") int status);

    public List<Match> findAllPageOne(@Param("before") int before, @Param("after") int after,@Param("userId") int userId);

    int insertOneMatch(@Param("matchName") String matchName,@Param("matchDate") String matchDate,@Param("userId") int userId);

}
