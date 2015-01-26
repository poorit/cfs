package ktds.cfs.domain;

public class Member {
  protected String photo,id,password,nickName;
  protected int no,userLevel;
  public int getUserLevel() {
    return userLevel;
  }
  public void setUserLevel(int userLevel) {
    this.userLevel = userLevel;
  }
  public int getNo() {
    return no;
  }
 
  public String getPhoto() {
    return photo;
  }

  public void setPhoto(String photo) {
    this.photo = photo;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getNickName() {
    return nickName;
  }

  public void setNickName(String nickName) {
    this.nickName = nickName;
  }
}
