package pl.forte.technikaldata.machine;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import pl.forte.technikaldata.documentation.Document;
import pl.forte.technikaldata.documentation.DocumentDao;

@Controller
@RequestMapping("/machines")
public class MachinesController {

    private final MachinesDao machinesDao;
    private final DocumentDao documentDao;

    public MachinesController(MachinesDao machinesDao, DocumentDao documentDao) {
        this.machinesDao = machinesDao;
        this.documentDao = documentDao;
    }

    @GetMapping("/admin")
    public String login() {
        return "login/admin";
    }

    @RequestMapping(value = "/machines", method = RequestMethod.GET)
    public String allMachines(Model model) {
        model.addAttribute("machine", machinesDao.findAllMachines());
        return "machines/machines";
    }
////////////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/addMachine", method = RequestMethod.GET)
    public String addMachine(Model model) {
        model.addAttribute("machine", new Machine());
        return "machines/addMachine";
    }

    @RequestMapping(value = "/addMachine", method = RequestMethod.POST)
    public String addMachine(@ModelAttribute @Validated Machine machine, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "machines/addMachine";
        }
        machinesDao.save(machine);
        return "redirect:/machines/machines";
    }
////////////////////////////////////////////////////////////////////////////////////////////////////////////
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        documentDao.allDocumentationsDelete(id);
        machinesDao.delete(id);
        return "redirect:../machines";
    }
////////////////////////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String update(@PathVariable Long id, Model model) {
        Machine machine = machinesDao.find(id);
        model.addAttribute("machine", machine);
        return "machines/addMachine";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    public String update(@PathVariable Long id, @ModelAttribute @Validated Machine machine, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "machines/addMachine";
        }
        machinesDao.update(machine);
        return "redirect:../machines";
    }
}
