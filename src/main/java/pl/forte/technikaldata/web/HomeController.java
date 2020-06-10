package pl.forte.technikaldata.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
//    @RequestMapping("/")
//    @ResponseBody
//    public String home() {
//        return "Hello World!!!";
//    }

    @GetMapping("/")
    public String home() {
        return "redirect:/machins";
    }

    @GetMapping("/about")
    @ResponseBody
    public String about() {
        return "Here you can find some details for logged users";
    }


}
