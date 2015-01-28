package ktds.cfs.dao;

import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ktds.cfs.domain.Board;
@Repository
public class BoardDao {
  @Autowired
  SqlSessionFactory sqlSessionFactory;
  
  public Board selectOne(int num)
  {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try {
      sqlSession.update("ktds.cfs.dao.BoardDao.addcount",num);
      return sqlSession.selectOne("ktds.cfs.dao.BoardDao.selectOne",num);
      
    } catch (Exception e) {
      e.printStackTrace();
      return null;
      
    }finally
    {
      sqlSession.close();
    }
  }
  
  public int totalCount()
  {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try {
      return sqlSession.selectOne("ktds.cfs.dao.BoardDao.totalCount");
    } catch (Exception e) {
      e.printStackTrace();
      return 0;
    }finally
    {
      sqlSession.close();
    }
  }
  
  public List<Board> selectList(int startIndex, int pageSize)
  {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try{
      HashMap<String, Integer> map = new HashMap<String, Integer>();
      map.put("startIndex", startIndex);
      map.put("pageSize", pageSize);
      return sqlSession.selectList("ktds.cfs.dao.BoardDao.selectList", map);
      
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }finally
    {
     sqlSession.close();
    }
  }
  
  public void insert(Board board)
  {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try{
      sqlSession.insert("ktds.cfs.dao.BoardDao.insert", board);
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
  
  public void delete(int num)
  {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try{
//      Board board = new Board();
//      board.setNo(num);
//      board.setWriter(nick);
      sqlSession.delete("ktds.cfs.dao.BoardDao.delete", num);
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
 
  public void update(Board board)
  {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try{
      sqlSession.update("ktds.cfs.dao.BoardDao.update", board);
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

  public List<Board> searchTitle(String searchValue) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    
    try{
      HashMap<String,String> params = new HashMap<String,String>();
      params.put("searchValue", searchValue);
      return sqlSession.selectList("ktds.cfs.dao.BoardDao.searchTitle",params);
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }finally
    {
     sqlSession.close();
    }
    
  }
  public List<Board> searchWriter(String searchValue) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    
    try{
      HashMap<String,String> params = new HashMap<String,String>();
      params.put("searchValue", searchValue);
      return sqlSession.selectList("ktds.cfs.dao.BoardDao.searchWriter",params);
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }finally
    {
     sqlSession.close();
    }
    
  }
  public List<Board> searchContents(String searchValue) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    
    try{
      HashMap<String,String> params = new HashMap<String,String>();
      params.put("searchValue", searchValue);
      return sqlSession.selectList("ktds.cfs.dao.BoardDao.searchContents",params);
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }finally
    {
     sqlSession.close();
    }
    
  }
}
