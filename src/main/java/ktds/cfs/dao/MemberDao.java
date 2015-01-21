package ktds.cfs.dao;

import java.sql.Connection;    
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ktds.cfs.domain.Member;


@Repository   // 스프링프레임워크가 객체를 자동생성
public class MemberDao {
  
  @Autowired
  SqlSessionFactory sqlSessionFactory;
  
  public void insert(Member member) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try {
          sqlSession.insert("ktds.cfs.dao.MemberDao.insert", member);
          sqlSession.commit();
         } catch(Exception e) {
           e.printStackTrace();
         } finally {
           sqlSession.close();
         }
  }
  
}



