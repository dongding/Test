package com.BiShe.bean;

public class ProgramInfo {
	private int TpId;
	private String programName;
	public int getTpId() {
		return TpId;
	}
	public void setTpId(int tpId) {
		TpId = tpId;
	}
	public String getProgramName() {
		return programName;
	}
	public void setProgramName(String programName) {
		this.programName = programName;
	}
	@Override
	public String toString() {
		return "ProgramInfo [TpId=" + TpId + ", programName=" + programName
				+ "]";
	}
	

}
