package ktds.cfs.dao;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpSession;

import ktds.cfs.domain.Shared;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.support.SessionStatus;

@Repository
public class SharedDao {
  @Autowired
  SqlSessionFactory sqlSessionFactory;
  
  public List<Shared> selectList()
  {
   
    SqlSession sqlSession2 = sqlSessionFactory.openSession();
    System.out.println(sqlSession2.selectList("ktds.cfs.dao.SharedDao.selectList"));
    
    try{
      return sqlSession2.selectList("ktds.cfs.dao.SharedDao.selectList");
      
    } catch (Exception e) {
      e.printStackTrace();
      return null;
      

    }finally
    {
     sqlSession2.close();
    }
  }
  
  public void insert(Shared shared)
  {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try{ 
      sqlSession.insert("ktds.cfs.dao.SharedDao.insert", shared);
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
