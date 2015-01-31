package ktds.cfs.control;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/board")
public class BoardControl {

  // 스프링에게 필요한 객체를 요구한다.
  @Autowired
  BoardDao boardDao;

  @Autowired
  MemberDao memberDao;

  @Autowired
  CommentDao commentDao;

  
  @RequestMapping("/list")
  public String list(
      @RequestParam(defaultValue="1") int pageNo, Model model)
  {
    int pageSize = 10;
    int startIndex = (pageNo - 1) * pageSize;
    int totalCount =  boardDao.totalCount();
    int totalPage = totalCount / pageSize;
    if((totalCount % pageSize) > 0)
    {
        ++totalPage;
    }
    model.addAttribute("list", boardDao.selectList(startIndex, pageSize));
    model.addAttribute("pageNo", pageNo);
    model.addAttribute("totalPage", totalPage);
    return "/board/list.jsp";
  }

  @RequestMapping("/add")
  public String add(Board board, HttpSession session) {
    Member member = (Member) session.getAttribute("loginInfo");
    board.setWriter(member.getNickName());
    boardDao.insert(board);
    return "redirect:list.do";
  }
  
  @RequestMapping("/view")
  public String view(int no, HttpSession session,
      @RequestParam(defaultValue="1") int pageNo, Model model) {

    int pageSize = 4;
    int startIndex = (pageNo - 1) * pageSize;
    int totalCount =  commentDao.totalCount(no);
    int totalPage = totalCount / pageSize;
    if((totalCount % pageSize) > 0)
    {
      totalPage++;
    }
    
//    Member member = (Member) session.getAttribute("loginInfo");
    model.addAttribute("board", boardDao.selectOne(no));
    model.addAttribute("list", commentDao.selectList(startIndex, pageSize,no));
    model.addAttribute("pageNo", pageNo);
    model.addAttribute("totalPage", totalPage);
    // model.addAttribute("comment", commentDao.)
    return "/board/view.jsp";
  }

  // http://localhost:8080/web03/board/list.do 요청을 처리하는 메서드



 

  @RequestMapping("/goToUpdate")
  public String goToUpdate(int no, Model model) {
    model.addAttribute("board", boardDao.selectOne(no));
    return "/board/update.jsp";
  }

  @RequestMapping("/update")
  public String update(int no, Board board, Model model) {

    board.setNo(no);
    boardDao.update(board);
    return "redirect:list.do";
  }

  @RequestMapping("/delete")
  public String delete(int no, HttpSession session) {
    Member member = (Member) session.getAttribute("loginInfo");
    boardDao.delete(no);
    return "redirect:list.do";
  }

  @RequestMapping("/addComment")
  public String addComment(int no, Comment comment, HttpSession session) {
    Member member = (Member) session.getAttribute("loginInfo");
    comment.setWriter(member.getNickName());
    comment.setB_no(no);
    commentDao.insert(comment);
    return "redirect:view.do?no="+no;
  }

  @RequestMapping("/delcom")
  public String delcom(HttpServletRequest request,int no) {
    commentDao.delcom(no);
    
    String referer = request.getHeader("Referer");
    return "redirect:"+ referer;
  }

  @RequestMapping("/search")
  public String search(Model model, String criteria, String searchValue) {
    if (criteria.equals("제목")) {
      String s = "%" + searchValue + "%";
      model.addAttribute("titlelist", boardDao.searchTitle(s));
      return "/board/searchlist.jsp";

    } else if (criteria.equals("작성자")) {
      String s = "%" + searchValue + "%";
      model.addAttribute("writerlist", boardDao.searchWriter(s));
      return "/board/searchlist.jsp";
    } else if (criteria.equals("내용")) {
      String s = "%" + searchValue + "%";
      model.addAttribute("contentslist", boardDao.searchContents(s));
      return "/board/searchlist.jsp";
    }
    return "redirect:list.do";
  }
}
