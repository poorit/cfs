package ktds.cfs.control;

import javax.servlet.RequestDispatcher; 
import javax.servlet.http.HttpSession;

import ktds.cfs.dao.BoardDao;
import ktds.cfs.dao.CommentDao;
import ktds.cfs.dao.MemberDao;
import ktds.cfs.domain.Board;
import ktds.cfs.domain.Comment;
import ktds.cfs.domain.Member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardControl {
  
  //스프링에게 필요한 객체를 요구한다.
  @Autowired
  BoardDao boardDao;
  
  @Autowired
  MemberDao memberDao;
  
  @Autowired
  CommentDao commentDao;
  
  @RequestMapping("/view")
  public String view(int no, Model model, HttpSession session)
  {
    Member member = (Member)session.getAttribute("loginInfo");
    model.addAttribute("board",boardDao.selectOne(no));
    model.addAttribute("list", commentDao.selectList());
    //model.addAttribute("comment", commentDao.)
    return "/board/view.jsp";
  }
  
  //http://localhost:8080/web03/board/list.do 요청을 처리하는 메서드
  @RequestMapping("/list")
  public String list(Model model, HttpSession session)
  {
    model.addAttribute("list", boardDao.selectList());
    return "/board/list.jsp";
  }
  
  @RequestMapping("/add")
  public String add(Board board, HttpSession session)
  {
    Member member = (Member)session.getAttribute("loginInfo");
    board.setWriter(member.getNickName());
    boardDao.insert(board);
    return "redirect:list.do";
  }
  
  @RequestMapping("/goToUpdate")
  public String goToUpdate(int no, Model model)
  {
    model.addAttribute("board",boardDao.selectOne(no));
    return "/board/update.jsp";
  }
  
  @RequestMapping("/update")
  public String update(int no, Board board,Model model)
  {
    
    board.setNo(no);
    boardDao.update(board);
    return "redirect:list.do";
  }
  @RequestMapping("/delete")
  public String delete(int no, HttpSession session)
  {
    Member member = (Member)session.getAttribute("loginInfo");
    boardDao.delete(no);
    return "redirect:list.do";
  }
  
  @RequestMapping("/addComment")
  public String addComment(int no, Comment comment, HttpSession session)
  {
    Member member = (Member)session.getAttribute("loginInfo");
    comment.setWriter(member.getNickName());
    comment.setB_no(no);
    commentDao.insert(comment);
    return "redirect:view.do?no="+no;
  }
  @RequestMapping("/delcom")
  public String delcom(int no, Comment comment)
  {
    commentDao.delcom(no);
    
    return "redirect:view.do?no="+comment.getB_no();
  }
  
  @RequestMapping("/search")
  public String search(Model model,String criteria, String searchValue)
  {
    System.out.println(criteria+", "+searchValue);
    if(criteria.equals("제목"))
    {
      String s="%"+searchValue+"%";
      model.addAttribute("titlelist", boardDao.searchTitle(s));
      return "/board/searchlist.jsp";
     
    }
    else if(criteria.equals("작성자"))
    {
      String s="%"+searchValue+"%";
      model.addAttribute("writerlist", boardDao.searchWriter(s));
      return "/board/searchlist.jsp";
    }
    else if(criteria.equals("내용"))
    {
      String s="%"+searchValue+"%";
      model.addAttribute("contentslist", boardDao.searchContents(s));
      return "/board/searchlist.jsp";
    }
    return "redirect:list.do";
  }
}
