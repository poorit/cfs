package ktds.cfs.control;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import ktds.cfs.dao.FavoriteDao;
import ktds.cfs.dao.MemberDao;
import ktds.cfs.dao.SharedDao;
import ktds.cfs.domain.Member;

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
  
  //스프링에게 필요한 객체를 요구한다.
  @Autowired
  MemberDao memberDao;
  
  @Autowired
  SharedDao sharedDao;
  
  @Autowired
  ServletContext context;
  
  @Autowired
  FavoriteDao favoriteDao;
  
  //http://localhost:8080/CFS/member/signUp.do
  @RequestMapping("/signUp")
  public String signUp(Member member,MultipartFile file)
  {
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
    return "redirect:../main.jsp";
  }
  @RequestMapping(value="/login",method=RequestMethod.POST)
  public String login(String id, String password,HttpSession session)
  {
    Member member = memberDao.getLoginInfo(id,password);
    if(member != null)
    {

     session.setAttribute("loginInfo", member);
     System.out.println("로그인 성공");
     return "redirect:../main.jsp";
    }
    else
    {
      System.out.println("실패");
      return "redirect:../main.jsp";
    }
  }
  @RequestMapping("/logout")
  public String logout(HttpSession session)
  {
    session.invalidate();
    return "redirect:/main.jsp";
  }
  @RequestMapping("/check")
  public ModelAndView check(String id) {
    ModelAndView mv = new ModelAndView();
    if(memberDao.exist(id))
    {
      mv.addObject("checkId",id);
    }
    mv.setViewName("/member/check.jsp");
    return mv;
  }
  
  @RequestMapping("/colouringbook")
  public String colouringbook(Model model)
  {
    System.out.println("로딩성공");
    List l = sharedDao.selectList();
    model.addAttribute("list",l);
    //session.setAttribute("colouringbook",model);
    return "/colouringbook.jsp";
    
  }
  @RequestMapping("/bookmark")
  public String bookmark(int no,HttpSession session)
  {
    Member m = (Member)session.getAttribute("loginInfo");
    memberDao.bookmark(no,m.getNo());
    return "redirect:/member/main.do";
  }
  @RequestMapping("/bmlist")
  public String bmlist(Model model,HttpSession session)
  {
    Member m = (Member)session.getAttribute("loginInfo");
    model.addAttribute("bmlist",favoriteDao.selectList(m.getNo()));
    model.addAttribute("list",sharedDao.selectList());
    return "/member/main.jsp";
  }
  @RequestMapping("/bmdelete")
  public String bmdelete(int no,HttpSession session)
  {
    Member m = (Member)session.getAttribute("loginInfo");
    memberDao.bmdelete(no,m.getNo());
    return "redirect:/member/bmlist.do";
    
  }
 
  
}
