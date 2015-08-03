package com.BiShe.dao;

import java.util.List;

import com.BiShe.bean.ProgramInfo;

public class RemoveSubmittedTrainingprogramFromList {
	public static boolean  removeSubmittedTrainingprogramFromList(List<ProgramInfo>a,List<String> u){
		boolean r = false;
		for(int i = 0; i < u.size(); i++){
			for(int j = 0; j < a.size(); j++){
				if(a.get(j).getProgramName().equalsIgnoreCase(u.get(i))){
					a.remove(j);
					r = true;
					break;
				}
			}
		}
		return r;	
	}

}
