package com.board.beans;

public class Comment {
	private int idx;
	private String writer;	//writer nickName
	private int writerIdx;
	private String content;
	private String regDate;
	//parent comment id of current comment
	private int parentCommentId;
	//the post id the comment belongs to
	private int parentPostId;
	private boolean isDeleted;
	private String deletedTime;
	private boolean isChildComment;
	private int seq;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getParentCommentId() {
		return parentCommentId;
	}
	public void setParentCommentId(
			int parentCommentId) {
		this.parentCommentId = parentCommentId;
	}
	public int getParentPostId() {
		return parentPostId;
	}
	public void setParentPostId(
			int parentPostId) {
		this.parentPostId = parentPostId;
	}
	public boolean isDeleted() {
		return isDeleted;
	}
	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}
	public String getDeletedTime() {
		return deletedTime;
	}
	public void setDeletedTime(
			String deletedTime) {
		this.deletedTime = deletedTime;
	}
	public boolean isChildComment() {
		return isChildComment;
	}
	public void setChildComment(
			boolean isChildComment) {
		this.isChildComment = isChildComment;
	}
	public int getWriterIdx() {
		return writerIdx;
	}
	public void setWriterIdx(int writerIdx) {
		this.writerIdx = writerIdx;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	
}
