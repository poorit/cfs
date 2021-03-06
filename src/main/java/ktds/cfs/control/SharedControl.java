package ktds.cfs.control;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import ktds.cfs.dao.SharedDao;
import ktds.cfs.domain.Member;
import ktds.cfs.domain.Shared;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/shared")
public class SharedControl {
  @Autowired
  SharedDao sharedDao;
  
  @Autowired
  ServletContext context;
  
  @RequestMapping("/paint")
  public String paint(Model model, int no, HttpSession session)
  {
    Member member = (Member)session.getAttribute("loginInfo");
    model.addAttribute("paint", sharedDao.getImage(no));
    model.addAttribute("writer",member.getNickName());
    
    return "redirect:../mycanvas.jsp";
  }
  @RequestMapping("/paint2")
  public String paint2(Model model, int no, HttpSession session)
  {
    Member member = (Member)session.getAttribute("loginInfo");
    model.addAttribute("paint", sharedDao.getImage2(no));
    model.addAttribute("writer",member.getNickName());
    
    return "redirect:../mycanvas.jsp";
  }
  
  @RequestMapping("/add")
  public String add(Shared shared,MultipartFile file,HttpSession session)
  {
    String realPath = context.getRealPath("/files");
    String filename = "photo_" + System.currentTimeMillis();
    Member member = (Member)session.getAttribute("loginInfo");
    try {
      file.transferTo(new File(realPath + "/" + filename));
      shared.setU(filename);
      shared.setWriter(member.getNickName());
    } catch (IllegalStateException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } catch (IOException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    if(member.getUserLevel()==0)
    {
      sharedDao.insertUser(shared);
    }
    else
    {
      sharedDao.insertAdmin(shared);
    }
    return "redirect:../member/colouringbook.do";
  }
  
  
}
