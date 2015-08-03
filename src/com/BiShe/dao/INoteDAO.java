package com.BiShe.dao;

import java.util.List;

import com.BiShe.bean.Note;

public interface INoteDAO {
 
	List<Note> getAllHistoryNotes();
	List<Note> getHistoryNotesByDataId(int dataid);
	boolean insertNote(Note n);
}
