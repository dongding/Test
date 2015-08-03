package com.BiShe.bean;

public class Comment {
	private int commentId;
	private int dataId;
	private String historyComments;
	private String createDate;
	private String createBy;
	
	public Comment() {
		
	}
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public int getDataId() {
		return dataId;
	}
	public void setDataId(int dataId) {
		this.dataId = dataId;
	}
	public String getHistoryComments() {
		return historyComments;
	}
	public void setHistoryComments(String historyComments) {
		this.historyComments = historyComments;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	@Override
	public String toString() {
		return "Comment [commentId=" + commentId + ", createBy=" + createBy
				+ ", createDate=" + createDate + ", dataId=" + dataId
				+ ", historyComment=" + historyComments + "]";
	}

}
