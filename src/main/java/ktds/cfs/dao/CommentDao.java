package ktds.cfs.dao;

import java.util.HashMap;
import java.util.List;

import ktds.cfs.domain.Board;
import ktds.cfs.domain.Comment;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDao {
  
  @Autowired
  SqlSessionFactory sqlSessionFactory;
  
  
  public List<Comment> selectList(int startIndex, int pageSize,int no)
  {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try{
      HashMap<String, Integer> map = new HashMap<String, Integer>();
      map.put("startIndex", startIndex);
      map.put("pageSize", pageSize);
      map.put("b_no",no);
      return sqlSession.selectList("ktds.cfs.dao.CommentDao.selectList", map);
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }finally
    {
     sqlSession.close();
    }
  }
  
  public int totalCount(int num) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try {
      return sqlSession.selectOne("ktds.cfs.dao.CommentDao.totalCount", num);
    } catch (Exception e) {
      e.printStackTrace();
      return 0;
      
    } finally {
      sqlSession.close();
    }
  }
  
  public void insert(Comment comment)
  {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try{
      sqlSession.insert("ktds.cfs.dao.CommentDao.insert", comment);
      sqlSession.commit();
    } catch (Exception e) {
      e.printStackTrace();
    }finally
    {
      try {
        sqlSession.close();
      } catch (Exception e) {}
    }
  }
  public void delcom(int num)
  {
    
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try{
//      Board board = new Board();
//      board.setNo(num);
//      board.setWriter(nick);
      sqlSession.delete("ktds.cfs.dao.CommentDao.delcom", num);
      sqlSession.commit();
    } catch (Exception e) {
      e.printStackTrace();
    }finally
    {
      try {
        sqlSession.close();
      } catch (Exception e) {}
    }
  }
}
