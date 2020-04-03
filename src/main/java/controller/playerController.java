package controller;

import entity.Battle;
import entity.Match;
import entity.player;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.PlayerService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/player")
public class playerController {
    @Autowired
    private PlayerService playerService;


@RequestMapping("/AddOnePlayerPage")
@ResponseBody
public ModelAndView AddOnePlayerPage(){

    ModelAndView modelAndView = new ModelAndView("addPlayer");
    return modelAndView;
}

    @RequestMapping("/AddOnePlayer")
    public ModelAndView AddOnePlayer(String playerName){
        playerService.insertOnePlayer(playerName);
        ModelAndView modelAndView = new ModelAndView("redirect:/player/AddOnePlayerPage");
        return modelAndView;
    }
    @RequestMapping("/getAllPlayerPage")
    @ResponseBody
    public ModelAndView getAllPlayerPage(int matchId, Model model){
        ModelAndView modelAndView =new ModelAndView("allPlayer");
        model.addAttribute("matchId",matchId);
        return modelAndView;
    }

    @RequestMapping("/getAllPlayers")
    @ResponseBody
    public Map getAllPlayers(int page, int limit){
        int before = limit * (page - 1) ;
        int after = page * limit;
        List<player> users = playerService.findAllPage(before,after);
        int count = playerService.count();
        Map<String,Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", count);
        map.put("data", users);
        return map;
    }
    @RequestMapping("/AddPlayersInMatch")
    @ResponseBody
    public Map AddPlayersInMatch(int playerId,int matchId){
        int result=0;


        Map<String,Object> map = new HashMap<>();
            List<Integer> integers = playerService.selectAllPlayer(matchId);
            if(integers==null||integers.size()==0||!integers.contains(playerId)){
                playerService.insertOnePM(playerId,matchId);
                map.put("flag","success");
                return map;
            }
            else {
                map.put("flag","error");
                return map;
            }







    }

    @RequestMapping("/selectAllPlayer")
    @ResponseBody
    public Map changeOneMatch(int matchId){
        List<Integer> battles = playerService.selectAllPlayer(matchId);
        Map<String,Object> map = new HashMap<>();
        map.put("players",battles);


//        ModelAndView modelAndView = new ModelAndView("redirect:/user/getAllUser");//redirect
        return  map;
    }




}
