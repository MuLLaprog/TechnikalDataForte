package pl.forte.technikaldata.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.forte.technikaldata.user.User;

@Controller
public class HomeController {

    @GetMapping("/login")
    public String login() {
        return "login/login";
    }

    @GetMapping("")
    public String home() {
        return "redirect:/machines/machines";
    }

    @GetMapping("/register")
    public String register(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "login/register";
    }

    @GetMapping("/machines")
    public String logout() {
        return "redirect:/machines/machines";
    }

    @GetMapping("/allMachines")
    public String allMachines() {
        return "redirect:/machines/allMachines";
    }

    @GetMapping("/addMachine")
    public String addMachine() {
        return "redirect:/machines/addMachine";
    }

    @GetMapping("/about")
    @ResponseBody
    public String about() {
        return "Here you can find some details for logged users";
    }
}
