package controller;

import entity.Battle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.BattleService;
import service.MatchService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/battle")
public class battleController {

    @Autowired
    private BattleService battleService;



    @RequestMapping("/getAllBattle")
    @ResponseBody
    public ModelAndView getAllBattle(int userId, Model model){
//        List<User> users = userService.selectAllUser();
        ModelAndView view =new ModelAndView("battle");


        model.addAttribute("userId",userId);
//        view.addObject("macthId",matchId);
        return view;
    }
    //xx
    @RequestMapping("/getAllBattles")
    @ResponseBody
    public Map getAllUsers(int page,int limit,int userId){
        int before = limit * (page - 1) ;
        int after = page * limit;
        List<Battle> battles = battleService.findAllPageInStatus(before,after,userId);
        int count = battleService.count();
        Map<String,Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", count);
        map.put("data", battles);
        return map;

    }
    @RequestMapping("/AddBattleByTwo")
    @ResponseBody
    public Map AddPlayersInMatch(int matchId){
        int len=0;
        List<Integer> integers = battleService.selectAllPlayer(matchId);
//        List<Battle> battles = battleService.selectAllBattle(matchId);
        Map<String,Object> map = new HashMap<>();
        if(integers.size()%2==0){
            len=integers.size()/2;
        }
        else{
            len=(integers.size()-1)/2;
        }
        if (integers!=null&&integers.size()!=0){
            for(int i=0;i<len;i++){
                battleService.insertOneBattle(matchId);
            }
        }






        return map;
    }

    @RequestMapping("/changeOneBattle")
    @ResponseBody
    public Map changeOneMatch(int battleId,int status){
        int result = battleService.updateOneBattle(battleId,status);
        Map<String,Object> map = new HashMap<>();
        if(result>=0){
            map.put("flag","success");
        }

//        ModelAndView modelAndView = new ModelAndView("redirect:/user/getAllUser");//redirect
        return  map;
    }

    @RequestMapping("/selectAllBattle")
    @ResponseBody
    public Map changeOneMatch(int matchId){
        List<Battle> battles = battleService.selectAllBattle(matchId);
        Map<String,Object> map = new HashMap<>();

            map.put("battles",battles);


//        ModelAndView modelAndView = new ModelAndView("redirect:/user/getAllUser");//redirect
        return  map;
    }

//    @RequestMapping("/getAllBattlea")
//
//    @ResponseBody
//    public Map getAllUsers(int page,int limit){
//        int before = limit * (page - 1) ;
//        int after = page * limit;
//        List<Battle> battles = battleService.findAllPage(before,after);
//        int count = battleService.count();
//        Map<String,Object> map = new HashMap<>();
//        map.put("code", 0);
//        map.put("msg", "");
//        map.put("count", count);
//        map.put("data", battles);
//        return map;
//
//    }
    @RequestMapping("/AddPlayerInBattle")
    @ResponseBody
    public Map AddPlayersInBattle(int battleId,int playerId){
        int result = battleService.insertPlayerInBattle(battleId,playerId);
        Map<String,Object> map = new HashMap<>();
        if(result>=0){
            map.put("flag","success");
        }
        return map;
    }

    @RequestMapping("/getAllBattlea")
    @ResponseBody
    public ModelAndView getAllBattlea(int userId, Model model){
//        List<User> users = userService.selectAllUser();
        ModelAndView view =new ModelAndView("allBattle");


        model.addAttribute("userId",userId);
        return view;
    }
    @RequestMapping("/getAllBattleas")
    @ResponseBody
    public Map getAllBattleas(int page,int limit,int userId){
        int before = limit * (page - 1) ;
        int after = page * limit;
        List<Battle> battles = battleService.findAllPageUs(before,after);
        int count = battleService.count();
        Map<String,Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", count);
        map.put("data", battles);

        return map;

    }
    @RequestMapping("/AddNullInVote")
    @ResponseBody
    public Map AddNullInVote(int battleId,int matchId){
        int result = battleService.insertNullInVote(battleId,matchId);
        Map<String,Object> map = new HashMap<>();
        if(result>=0){
            map.put("flag","success");
        }
        return map;
    }


    @RequestMapping("/AddBattle_Player")
    @ResponseBody

    public Map AddBattle_Player(int matchId){
        int k=0;

        List<Battle> battles = battleService.selectAllBattle(matchId);
        List<Integer> integers = battleService.selectAllPlayer(matchId);
        for (int i=0;i<battles.size();i++){
            for (int j=k;j<k+2;j++){

                battleService.insertPlayerInBattle(battles.get(i).getBattleId(),integers.get(j));
            }
            k=k+2;
            battleService.insertNullInVote(battles.get(i).getBattleId(),matchId);
        }

        Map<String,Object> map = new HashMap<>();

        map.put("flag","success");


//        ModelAndView modelAndView = new ModelAndView("redirect:/user/getAllUser");//redirect
        return  map;
    }
}
