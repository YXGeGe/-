package controller;

import entity.Functions;
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
import service.UserService;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class userController {

@Autowired
private UserService userService;
@Autowired
private FunctionsService functionsService;
//    检查注册用户
    @RequestMapping("/checkRegisterUser")
    @ResponseBody
    public Map checkRegisterUser(String account){
            Map<String,String> map = new HashMap<>();

        List<User> user = userService.selectCheckUsername(account);

        String flag = "0";
        String Msg="可注册";
            System.out.println(user.size());
        if(user.size()!=0){
            flag="1";
            Msg="用户名已存在";
        }

        map.put("flag",flag);
        map.put("Msg",Msg);
        return map;
    }
//    注册一个用户
    @RequestMapping("/insertOneUser")
    public ModelAndView insertOneUser(String account,String password,Model model){

       ModelAndView modelAndView = new ModelAndView("login");
        model.addAttribute("account",account);
        int result = userService.insertOneUser(account,password);

        return modelAndView;
    }

//    检测登陆用户
    @RequestMapping("/checkLoginUser")
    public ModelAndView checkLoginUser(String account,String password,Model model){
        String viewName="login";
        int functions=3;
        Map<String, String> map = new HashMap<>();
        map.put("Msg","loginOK");
        List<User> users = userService.selectCheckUser(account,password);
        if (account.trim().isEmpty() || password.trim().isEmpty()) {
            viewName = "login";//登陆错误页面
            map.put("Msg","loginError");
        }
        else {
            if(users.size()==0){
                viewName = "login";//登陆错误页面
                map.put("Msg","loginError");
            }else {
                 viewName = "main";//主界面
            }
        }
        if(users.get(0).getUserType()==0){
            functions=1;
        }
        else if (users.get(0).getUserType()==1){
            functions=2;
        }
        else if (users.get(0).getUserType()==2){
            functions=3;
        }
        else  {//map.put("userType","");
        functions = 2;}

        List<Functions> list = functionsService.getOneFuntions(functions);


        model.addAttribute("Functions",list);
            model.addAttribute("userId",users.get(0).getUserId());
        ModelAndView view =new ModelAndView(viewName);
        view.addAllObjects(map);

        return view;
    }

    //更改一个用户
    @RequestMapping("/changeOneUser")
    @ResponseBody
    public Map changeOneUser(int userType,int userId){
        int result = userService.updateOneUser(userType,userId);
        Map<String,Object> map = new HashMap<>();
        if(result>=0){
            map.put("flag","success");
        }

//        ModelAndView modelAndView = new ModelAndView("redirect:/user/getAllUser");//redirect
        return  map;
    }
//    删除一个用户
    @RequestMapping("/deleteOneUser")

    public @ResponseBody List deleteOneUser(int userId){
        int result = userService.deleteOneUser(userId);

        List<User> users = userService.selectAllUser();

        return  users;
    }


//    所有用户
    @RequestMapping("/getAllUser")
    @ResponseBody
    public ModelAndView getAllUser(){
//        List<User> users = userService.selectAllUser();
        ModelAndView view =new ModelAndView("user");



//        view.addObject("users",users);
        return view;
    }
//xx
    @RequestMapping("/getAllUsers")
    @ResponseBody
    public Map getAllUsers(int page,int limit){
        int before = limit * (page - 1) ;
        int after = page * limit;
        List<User> users = userService.findAllPage(before,after);
        int count = userService.count();
        Map<String,Object> map = new HashMap<>();

//        JSONArray json = JSONArray.fromObject(users);
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", count);
        map.put("data", users);
//        System.out.println(json);
//        String js = json.toString();
//        //*****转为layui需要的json格式，必须要这一步，博主也是没写这一步，在页面上数据就是数据接口异常
////        String jso = "{\"code\":0,\"msg\":\"\",\"count\":"+count+",\"data\":"+js+"}";
//        String jso = "{\"code\":0,\"msg\":\"\",\"count\":"+count+",\"data\":"+js+"}";
//        System.out.println(jso);
        return map;


    }

//    获得一个用户
    @RequestMapping("/getOneUser")
    @ResponseBody
    public ModelAndView getOneUser(int userId){

        List<User> users = userService.selectOneUser(userId);
        ModelAndView view =new ModelAndView("users");
        view.addObject("users",users);
        return view;
    }
//    返回注册页面
    @RequestMapping("/registerPage")
    public ModelAndView registerPage(){
        ModelAndView modelAndView = new ModelAndView("register");
        return modelAndView;
    }
//    返回登陆页面
@RequestMapping("/loginPage")
public ModelAndView loginPage(){
    ModelAndView modelAndView = new ModelAndView("login");
    return modelAndView;
}
}
