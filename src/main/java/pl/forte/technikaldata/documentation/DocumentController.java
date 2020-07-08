package pl.forte.technikaldata.documentation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pl.forte.technikaldata.machine.Machine;
import pl.forte.technikaldata.machine.MachinesDao;
import pl.forte.technikaldata.uploadFiles.FileService;

@Controller
@RequestMapping("/documents")
public class DocumentController {

    private final DocumentDao documentDao;
    private final MachinesDao machinesDao;
    private final FileService fileService;

    public DocumentController(DocumentDao documentDao, MachinesDao machinesDao, FileService fileService) {
        this.documentDao = documentDao;
        this.machinesDao = machinesDao;
        this.fileService = fileService;
    }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/documentations", method = RequestMethod.GET)
    public String allDocumantations(Model model) {
        model.addAttribute("documents", documentDao.findAllDocuments());
        return "documents/documentations";
    }
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/idMachine/{id}", method = RequestMethod.GET)
    public String allIdMachines(@PathVariable Long id, Model model) {
        Machine machine = machinesDao.find(id);
        model.addAttribute("documents", documentDao.findAllDocumentsMachine(id));
        model.addAttribute("idMachine", machine);
        return "documents/documentations";
    }
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    @RequestMapping(value = "/addDocumentations/{machineId}", method = RequestMethod.GET)
    public String addDocumentation(@PathVariable Long machineId, Model model) {
        Document document = new Document();
        document.setMachine(machinesDao.find(machineId));
        model.addAttribute("document", document);
        return "documents/addDocumentations";
    }

    @RequestMapping(value = "/addDocumentations/{machineId}", method = RequestMethod.POST)
    public String addDocumentation(@ModelAttribute @Validated Document document, @PathVariable Long machineId, @RequestParam MultipartFile file, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "documents/addDocumentations";
        }
        document.setNameDocument(file.getOriginalFilename());
        documentDao.save(document);
        fileService.uploadFile(file);
        return "redirect:/documents/idMachine/" + machineId;//lub to  + document.getMachine().getId();
    }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    @GetMapping("/delete/{id}/{machineId}")
    public String delete(@PathVariable Long id, @PathVariable Long machineId) {
        documentDao.delete(id);
        return "redirect:/documents/idMachine/{machineId}";
    }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/update/{id}/{machineId}", method = RequestMethod.GET)
    public String update(@PathVariable Long id, @PathVariable Long machineId, Model model) {
        Document document = documentDao.find(id);
        model.addAttribute("document", document);
        return "documents/addDocumentations";
    }

    @RequestMapping(value = "/update/{id}/{machineId}", method = RequestMethod.POST)
    public String update(@PathVariable Long id, @PathVariable Long machineId, @ModelAttribute @Validated Document document, @RequestParam MultipartFile file, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "documents/addDocumentations";
        }
        document.setNameDocument(file.getOriginalFilename());
        documentDao.update(document);
        fileService.uploadFile(file);
        //return "redirect:../idMachine/" + machineId; //+ document.getMachine().getId(); to nie działa dokleja update
        return "redirect:/documents/idMachine/" + machineId; //+ document.getMachine().getId();
//        return "redirect:/documents/idMachine/" + document.getMachine().getId();
    }
}
