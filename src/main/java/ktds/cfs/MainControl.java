package ktds.cfs;

import ktds.cfs.dao.GallaryDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainControl {
  @Autowired
  GallaryDao gallaryDao;
  
  
  @RequestMapping("/main")
  public String main(Model model){
    model.addAttribute("gallery", gallaryDao.selectList());
    return "/main.jsp";
  }
}
