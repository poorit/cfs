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
import ktds.cfs.domain.Comment;
import ktds.cfs.domain.Gallary;

import org.springframework.stereotype.Repository;

@Repository
public class GallaryDao {
  @Autowired
  SqlSessionFactory sqlSessionFactory;
  public void add(Gallary g)
  {
    
    
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try{
      sqlSession.insert("ktds.cfs.dao.GallaryDao.insert", g);
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
  public List<Gallary> selectList()
  {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    
    try{
      return sqlSession.selectList("ktds.cfs.dao.GallaryDao.selectList");
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }finally
    {
     sqlSession.close();
    }
  }
}
