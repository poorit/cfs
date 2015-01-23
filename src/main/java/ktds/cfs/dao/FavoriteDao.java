package ktds.cfs.dao;

import java.util.List;

import ktds.cfs.domain.Member;
import ktds.cfs.domain.Shared;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class FavoriteDao {

  @Autowired
  SqlSessionFactory sqlSessionFactory;
  public List<Shared> selectList(int mno)
  {
   
    SqlSession sqlSession2 = sqlSessionFactory.openSession();
    
    
    try{
      return sqlSession2.selectList("ktds.cfs.dao.FavoriteDao.selectList",mno);
      
    } catch (Exception e) {
      e.printStackTrace();
      return null;
      

    }finally
    {
     sqlSession2.close();
    }
  }
}
