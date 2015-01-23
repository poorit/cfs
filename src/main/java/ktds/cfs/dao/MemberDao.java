package ktds.cfs.dao;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;

import ktds.cfs.domain.Favorite;
import ktds.cfs.domain.Member;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
  @Autowired
  SqlSessionFactory sqlSessionFactory;
 
  public void insert(Member member)
  {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    
    try{
      sqlSession.insert("ktds.cfs.dao.MemberDao.insert", member);
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
  
  public Member getLoginInfo(String id, String password) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    
    try{
      HashMap<String,String> params = new HashMap<String,String>();
      params.put("id", id);
      params.put("password", password);
      return sqlSession.selectOne("ktds.cfs.dao.MemberDao.loginInfo", params);
      
      
    } catch (Exception e) {
      e.printStackTrace();
      return null;

    }finally
    {
      
      try {
        sqlSession.close();
      } catch (Exception e) {}
    }
   
  }
  public void bookmark(int no1,int no2)
  {
    Favorite f = new Favorite();
    f.setSno(no1);f.setMno(no2);
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try{
      sqlSession.update("ktds.cfs.dao.MemberDao.addcount", f);
      sqlSession.insert("ktds.cfs.dao.MemberDao.favorite", f);
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
  
  
  public boolean exist(String id)
  {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    
    try{
     int count = sqlSession.selectOne("ktds.cfs.dao.MemberDao.exist",id);
     if(count==0)
       return false;
     else
       return true;
      
      
    } catch (Exception e) {
      e.printStackTrace();
      return false;

    }finally
    {
      
      try {
        sqlSession.close();
      } catch (Exception e) {}
    }
   
  }

  public void bmdelete(int no1, int no2)
  {
    Favorite f = new Favorite();
    f.setSno(no1);f.setMno(no2);
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try{
      sqlSession.delete("ktds.cfs.dao.MemberDao.bmdelete", f);
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
