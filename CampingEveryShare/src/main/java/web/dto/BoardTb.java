package web.dto;

import java.util.Date;

public class BoardTb {

   private int boardNo;
   private String title;
   private int location;
   private Date postDate;
   private int hit;
   private String content;
   private int deleteStatus;
   private int userNo;
   private int boardCate;
   
   public BoardTb() {}

   public BoardTb(int boardNo, String title, int location, Date postDate, int hit, String content, int deleteStatus,
         int userNo, int boardCate) {
      super();
      this.boardNo = boardNo;
      this.title = title;
      this.location = location;
      this.postDate = postDate;
      this.hit = hit;
      this.content = content;
      this.deleteStatus = deleteStatus;
      this.userNo = userNo;
      this.boardCate = boardCate;
   }

   @Override
   public String toString() {
      return "Board [boardNo=" + boardNo + ", title=" + title + ", location=" + location + ", postDate=" + postDate
            + ", hit=" + hit + ", content=" + content + ", deleteStatus=" + deleteStatus + ", userNo=" + userNo
            + ", boardCate=" + boardCate + "]";
   }

   public int getBoardNo() {
      return boardNo;
   }

   public void setBoardNo(int boardNo) {
      this.boardNo = boardNo;
   }

   public String getTitle() {
      return title;
   }

   public void setTitle(String title) {
      this.title = title;
   }

   public int getLocation() {
      return location;
   }

   public void setLocation(int location) {
      this.location = location;
   }

   public Date getPostDate() {
      return postDate;
   }

   public void setPostDate(Date postDate) {
      this.postDate = postDate;
   }

   public int getHit() {
      return hit;
   }

   public void setHit(int hit) {
      this.hit = hit;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   public int getDeleteStatus() {
      return deleteStatus;
   }

   public void setDeleteStatus(int deleteStatus) {
      this.deleteStatus = deleteStatus;
   }

   public int getUserNo() {
      return userNo;
   }

   public void setUserNo(int userNo) {
      this.userNo = userNo;
   }

   public int getBoardCate() {
      return boardCate;
   }

   public void setBoardCate(int boardCate) {
      this.boardCate = boardCate;
   }
   
   
}