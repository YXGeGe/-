package controller;

import entity.Vote;
import entity.player;
import entity.vote_record;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.VoteService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/vote")
public class voteController {
    @Autowired
    private VoteService voteService;

    @RequestMapping("/getOneVote")
    @ResponseBody
    public Map getOneVote(int matchId,int battleId){
        Map<String,Object> map = new HashMap<>();
        List<Vote> list = voteService.selectOneVote(matchId,battleId);
        map.put("list",list);
        return map;
    }

    @RequestMapping("/getVotePage")
    public ModelAndView getVote(int battleId, int matchId,int userId, Model model){
        model.addAttribute("battleId",battleId);
        model.addAttribute("matchId",matchId);
       List<player> players =voteService.selectOneVotePlayerName(battleId);
        model.addAttribute("playerOne",players.get(0).getPlayerName());
        model.addAttribute("playerTwo",players.get(1).getPlayerName());
        model.addAttribute("userId",userId);
        ModelAndView modelAndView = new ModelAndView("vote");
        return modelAndView;
    }


    @RequestMapping("/AddOneVote")
    @ResponseBody
    public Map changeOneMatch(int matchId,int battleId,int who,int userId){
        Map<String,Object> map = new HashMap<>();
        List<Vote> list = voteService.selectOneVote(matchId,battleId);
        List<vote_record> vote_records = voteService.selectUserVoteLimit(matchId, battleId, userId);

        if (vote_records.size()==0) {
            voteService.insertUserVoteLimit(matchId, battleId, userId);
        }


            if (vote_records.get(0).getVoteLimit()==0){
                map.put("limit","error");
            }
            else {
                if (who == 1) {
                    voteService.updateOneVote(matchId, battleId, list.get(0).getVote1() + 1, list.get(0).getVote2());

                }else if(who == 2)
                {
                    voteService.updateOneVote(matchId, battleId, list.get(0).getVote1(), list.get(0).getVote2() + 1);
                }
                else{}
               voteService.updateUserVoteLimit(vote_records.get(0).getVoteLimit()-1,matchId,battleId,userId);
                map.put("flag","success");
            }





        return  map;
    }

    @RequestMapping("/getAllVotePage")
    public ModelAndView getVote(){

        ModelAndView modelAndView = new ModelAndView("allVote");
        return modelAndView;
    }

    @RequestMapping("/getAllVote")
    @ResponseBody
    public Map getAllUsers(int page,int limit){
        int before = limit * (page - 1) ;
        int after = page * limit;
        List<Vote> users = voteService.findAllPage(before,after);
        int count = voteService.count();
        Map<String,Object> map = new HashMap<>();

//        JSONArray json = JSONArray.fromObject(users);
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", count);
        map.put("data", users);
//
        return map;


    }
}
