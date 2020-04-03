package entity;

public class Vote {
    private int matchId;
    private int vote1;
    private  int vote2;
    private int battleId;

    public int getMatchId() {
        return matchId;
    }

    public void setMatchId(int matchId) {
        this.matchId = matchId;
    }

    public int getVote1() {
        return vote1;
    }

    public void setVote1(int vote1) {
        this.vote1 = vote1;
    }

    public int getVote2() {
        return vote2;
    }

    public void setVote2(int vote2) {
        this.vote2 = vote2;
    }

    public int getBattleId() {
        return battleId;
    }

    public void setBattleId(int battleId) {
        this.battleId = battleId;
    }
}
