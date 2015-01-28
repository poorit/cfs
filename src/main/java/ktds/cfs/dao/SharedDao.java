package ktds.cfs.dao;

import java.util.List;

import ktds.cfs.domain.Design;
import ktds.cfs.domain.Shared;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
  public List<Shared> selectHot() {
    SqlSession sqlSession2 = sqlSessionFactory.openSession();
    
    try{
      return sqlSession2.selectList("ktds.cfs.dao.SharedDao.selectHotList");
      
    } catch (Exception e) {
      e.printStackTrace();
      return null;
      

    }finally
    {
     sqlSession2.close();
    }
  }
  public void insertUser(Shared shared)
  {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try{ 
      sqlSession.insert("ktds.cfs.dao.SharedDao.insertuser", shared);
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
  
  public void insertAdmin(Shared shared) {
    // TODO Auto-generated method stub
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try{ 
      sqlSession.insert("ktds.cfs.dao.SharedDao.insertadmin", shared);
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
  public List<Design> selectAdminList()
  {
   
    SqlSession sqlSession2 = sqlSessionFactory.openSession();
    
    try{
      
      return sqlSession2.selectList("ktds.cfs.dao.SharedDao.selectAdminList");
      
    } catch (Exception e) {
      e.printStackTrace();
      return null;
      

    }finally
    {
     sqlSession2.close();
    }
  }

  

}
