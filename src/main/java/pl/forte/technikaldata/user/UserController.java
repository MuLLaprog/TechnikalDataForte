package pl.forte.technikaldata.user;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import pl.forte.technikaldata.validation.AddValidators;

import javax.validation.groups.Default;

@Controller
@RequestMapping("/users")
public class UserController {

    private final UserService userService;
    private final UserDao userDao;

    public UserController(UserService userService, UserDao userDao) {
        this.userService = userService;
        this.userDao = userDao;
    }

    //akcja wykona sie tylko raz
    @GetMapping("/create-user")
    @ResponseBody
    public String createUser() {
        User user = new User();
        user.setUsername("admin");
        user.setPassword("admin");
        userService.saveAdmin(user);
        return "admin";
    }

//    @GetMapping("/admin")
//    @ResponseBody
//    public String userInfo(@AuthenticationPrincipal UserDetails customUser) {
//        log.info("customUser class {} " , customUser.getClass());
//        return "You are logged as " + customUser;
//    }

    @GetMapping("/admin")
    @ResponseBody
    public String admin(@AuthenticationPrincipal CurrentUser customUser) {
        User entityUser = customUser.getUser();
        return "Hello " + entityUser.getUsername();
    }
///////////////////////////////////////////////////////////////////////////////////////////////////////////
    @GetMapping("/register")
    public String goRegister(Model model) {
        model.addAttribute("user", userDao.findAllUsers());
        return "login/register";
    }
////////////////////////////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String allUsers(Model model) {
        model.addAttribute("user", userDao.findAllUsers());
        return "user/allUsers";
    }
////////////////////////////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/addUser", method = RequestMethod.GET)
    public String addUser(Model model) {
        model.addAttribute("user", new User());
        return "login/register";
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public String addUser(@Validated({AddValidators.class, Default.class}) User user, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "login/register";
        }
        userService.saveUser(user);
        return "redirect:/login";
    }
////////////////////////////////////////////////////////////////////////////////////////////////////////////

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        userDao.delete(id);
        return "redirect:../users";
    }
}
