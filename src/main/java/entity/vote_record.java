package entity;

public class vote_record {
    private int voteId;
    private int matchId;
    private int battleId;
    private int userId;
    private int voteLimit;

    public int getVoteId() {
        return voteId;
    }

    public void setVoteId(int voteId) {
        this.voteId = voteId;
    }

    public int getMatchId() {
        return matchId;
    }

    public void setMatchId(int matchId) {
        this.matchId = matchId;
    }

    public int getBattleId() {
        return battleId;
    }

    public void setBattleId(int battleId) {
        this.battleId = battleId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getVoteLimit() {
        return voteLimit;
    }

    public void setVoteLimit(int voteLimit) {
        this.voteLimit = voteLimit;
    }
}
