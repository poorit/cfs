package ktds.cfs.control;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import ktds.cfs.dao.FavoriteDao;
import ktds.cfs.dao.GallaryDao;
import ktds.cfs.dao.MemberDao;
import ktds.cfs.dao.SharedDao;
import ktds.cfs.domain.Gallary;
import ktds.cfs.domain.Member;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member")
public class MemberControl {

  // 스프링에게 필요한 객체를 요구한다.
  @Autowired
  MemberDao memberDao;

  @Autowired
  SharedDao sharedDao;
  
  @Autowired
  GallaryDao gallaryDao;

  @Autowired
  ServletContext context;

  @Autowired
  FavoriteDao favoriteDao;

  // http://localhost:8080/CFS/member/signUp.do
  @RequestMapping("/signUp")
  public String signUp(HttpServletRequest request,Member member, MultipartFile file) {
    String realPath = context.getRealPath("/files");
    String filename = "photo_" + System.currentTimeMillis();
    try {
      file.transferTo(new File(realPath + "/" + filename));
      member.setPhoto(filename);
    } catch (IllegalStateException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } catch (IOException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    memberDao.insert(member);
    String referer = request.getHeader("Referer");
    return "redirect:"+ referer;
  }

  @RequestMapping("/modify")
  public String modify(HttpServletRequest request,Member member, MultipartFile file, HttpSession session) {
    Member m = (Member) session.getAttribute("loginInfo");
    member.setNo(m.getNo());
    String realPath = context.getRealPath("/files");
    String filename;
    
    try {
 
      if(member.getNickName().equals(""))
        member.setNickName(m.getNickName());
      if(member.getPassword().equals(""))
        member.setPassword(m.getPassword());
      
      if(!file.getOriginalFilename().equals(""))
      {
        filename = "photo_" + System.currentTimeMillis();
        
        File f = new File(realPath + "/" + filename);

        file.transferTo(f);
      } else {
        filename = m.getPhoto();
      }
      member.setPhoto(filename);

    } catch (IllegalStateException e) {

      // TODO Auto-generated catch block
      e.printStackTrace();
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    memberDao.modify(member);
    session.setAttribute("loginInfo", member);
    String referer = request.getHeader("Referer");
    return "redirect:"+ referer;
  }

  @RequestMapping(value = "/login", method = RequestMethod.POST)
  public String login(HttpServletRequest request,String id, String password, HttpSession session) {
    Member member = memberDao.getLoginInfo(id, password);
    String referer = request.getHeader("Referer");
    if (member != null) {

      session.setAttribute("loginInfo", member);
     
      return "redirect:"+ referer;
    } else {
      System.out.println("실패");
      return "redirect:"+ referer;
    }
  }


  @RequestMapping("/logout")
  public String logout(HttpServletRequest request,HttpSession session) {
    session.invalidate();
    
    String referer = request.getHeader("Referer");
    System.out.println(""+referer);
    return "redirect:"+ referer;
  }
  @RequestMapping("/logout_design")
  public String logout_design(HttpServletRequest request,HttpSession session) {
    session.invalidate();
    return "redirect:../main.jsp";
  }

  @RequestMapping("/check")
  public ModelAndView check(String id) {
    ModelAndView mv = new ModelAndView();
    if (memberDao.exist(id)) {
      mv.addObject("checkId", id);
    }
    mv.setViewName("/member/check.jsp");
    return mv;
  }

  @RequestMapping("/colouringbook")
  public String colouringbook(Model model, HttpSession session) {
    System.out.println("로딩성공");
    Member m = (Member) session.getAttribute("loginInfo");
    List l = favoriteDao.selectList(m.getNo());
    List l2 = sharedDao.selectList();
    List l3 = sharedDao.selectAdminList();
    List l4 = sharedDao.selectHot();
    model.addAttribute("bookmark", l);
    model.addAttribute("list", l2);
    model.addAttribute("admin", l3);
    model.addAttribute("hot", l4);

    // session.setAttribute("colouringbook",model);
    return "/colouringbook.jsp";

  }

  @RequestMapping("/bookmark")
  public String bookmark(int no, HttpSession session) {
    Member m = (Member) session.getAttribute("loginInfo");
    memberDao.bookmark(no, m.getNo());
    return "redirect:/member/colouringbook.do";
  }

  @RequestMapping("/bmlist")
  public String bmlist(Model model, HttpSession session) {
    Member m = (Member) session.getAttribute("loginInfo");
    model.addAttribute("bmlist", favoriteDao.selectList(m.getNo()));
    model.addAttribute("list", sharedDao.selectList());
    return "/colouringbook.jsp";
  }

  @RequestMapping("/bmdelete")
  public String bmdelete(int no, HttpSession session) {
    Member m = (Member) session.getAttribute("loginInfo");
    memberDao.bmdelete(no, m.getNo());
    return "redirect:/member/colouringbook.do";

  }

  @RequestMapping("/adminlist")
  public String adminList(Model model) {
    model.addAttribute("adlist", sharedDao.selectAdminList());
    return "/colouringbook.jsp";

  }
  @RequestMapping(value = "/injung")
  public String injung(String hidden, HttpServletRequest request, HttpSession session,Model model){
    byte[] imageData = Base64.decodeBase64(hidden.substring(22));
    Member m = (Member)session.getAttribute("loginInfo");
    Gallary g = new Gallary();
    String webAppPath = context.getRealPath("/files");
    String fileName = "/pic_" + System.currentTimeMillis();
    g.setU(fileName);
    g.setWriter(m.getNickName());
    gallaryDao.add(g);
    File file = new File(webAppPath + fileName);
    try(FileOutputStream out = new FileOutputStream(file)) {
      out.write(imageData);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return "redirect:gallerylist.do";
  }
  @RequestMapping(value = "/gallerylist")
  public String galleryList(HttpSession session,Model model){
    model.addAttribute("gallery", gallaryDao.selectList());
    return "../gallery/gallery.jsp";
  }

}
