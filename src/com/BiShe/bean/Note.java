package com.BiShe.bean;

public class Note {
	private int noteId;
	private int dataId;
	private String historyNotes;
	private String createDate;
	public Note() {
		// TODO Auto-generated constructor stub
	}
	public int getNoteId() {
		return noteId;
	}
	public void setNoteId(int noteId) {
		this.noteId = noteId;
	}
	public int getDataId() {
		return dataId;
	}
	public void setDataId(int dataId) {
		this.dataId = dataId;
	}
	public String getHistoryNotes() {
		return historyNotes;
	}
	public void setHistoryNotes(String historyNotes) {
		this.historyNotes = historyNotes;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	@Override
	public String toString() {
		return "Note [createDate=" + createDate + ", dataId=" + dataId
				+ ", historyNotes=" + historyNotes + ", noteId=" + noteId + "]";
	}
	
	

}
