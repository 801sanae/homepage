package com.bit.homepage.domain;

public class Board {
	private long no;
	private String title;
	private String content;
	private int view_cnt;
	private Long member_no;
	private String member_name;
	private String reg_date;
	
	public long getNo() {
		return no;
	}
	public String getTitle() {
		return title;
	}
	public String getContents() {
		return content;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	
	public long getMember_no() {
		return member_no;
	}
	
	public String getMember_name() {
		return member_name;
	}
	
	public String getReg_date() {
		return reg_date;
	}
	
	
	public void setNo(long no) {
		this.no = no;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setContents(String content) {
		this.content = content;
	}

	public void setMember_no(Long long1) {
		this.member_no = long1;
	}
	
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "Board [no=" + no + ", title=" + title + ", content=" + content + ", view_cnt=" + view_cnt
				+ ", member_no=" + member_no + ", member_name=" + member_name + ", reg_date=" + reg_date + "]";
	}
	
}
