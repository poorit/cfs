package ktds.cfs.dao;

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
  
  
  public List<Comment> selectList()
  {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    
    try{
      return sqlSession.selectList("ktds.cfs.dao.CommentDao.selectList");
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }finally
    {
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
