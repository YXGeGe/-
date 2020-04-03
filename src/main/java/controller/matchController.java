package controller;

import entity.Functions;
import entity.Match;
import entity.PageUtil;
import entity.User;

import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.FunctionsService;
import service.MatchService;
import service.UserService;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/match")
public class matchController {

    @Autowired
    private MatchService matchService;

//管理员
    @RequestMapping("/getAllMatch")
    @ResponseBody
    public ModelAndView getAllMatch(){
//        List<User> users = userService.selectAllUser();
        ModelAndView view =new ModelAndView("match");

//        view.addObject("users",users);
        return view;
    }
    @RequestMapping("/getAllMatchs")
    @ResponseBody
    public Map getAllUsers(int page,int limit){
        int before = limit * (page - 1) ;
        int after = page * limit;
        List<Match> users = matchService.findAllPage(before,after);
        int count = matchService.count();
        Map<String,Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", count);
        map.put("data", users);
        return map;

    }
    //发布者
    @RequestMapping("/getAllMatcha")
    @ResponseBody
    public ModelAndView getAllUser(int userId,Model model){
//        List<User> users = userService.selectAllUser();
        ModelAndView view =new ModelAndView("matchOne");
        model.addAttribute("userId",userId);
//        view.addObject("users",users);
        return view;
    }



    @RequestMapping("/getMyMatchs")
    @ResponseBody
    public Map getAllUsers(int page,int limit,int userId){
        int before = limit * (page - 1) ;
        int after = page * limit;
        List<Match> users = matchService.findAllPageOne(before,after,userId);
        int count = matchService.count();
        Map<String,Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", count);
        map.put("data", users);
        return map;

    }
    @RequestMapping("/changeOneMatch")
    @ResponseBody
    public Map changeOneMatch(int matchId,int status){
        int result = matchService.updateOneMatch(matchId,status);
        Map<String,Object> map = new HashMap<>();
        if(result>=0){
            map.put("flag","success");
        }

//        ModelAndView modelAndView = new ModelAndView("redirect:/user/getAllUser");//redirect
        return  map;
    }




    @RequestMapping("/getAddMatchPage")
    @ResponseBody
    public ModelAndView getAddMatchPage(int userId,Model model){
        ModelAndView modelAndView =new ModelAndView("addMatch");
        model.addAttribute("userid",userId);
        return modelAndView;
    }

    @RequestMapping(value = "/AddOneMatch")
    @ResponseBody
    public Map AddOneMatch(int userId,String matchName,String matchDate){
      int result = matchService.insertOneMatch(matchName,matchDate,userId);
        Map<String,Object> map = new HashMap<>();
        if(result>=0){
            map.put("flag","success");
        }
        return map;
    }
}
