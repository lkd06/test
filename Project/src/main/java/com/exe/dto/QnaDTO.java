package com.exe.dto;

public class QnaDTO {

	private int num; //��ȣ
	private String category; //ī�װ�
	private String subject; //����
	private String content; //����
	private int hitCount;
	private String ipAddr;
	private String created;
	private int groupNum; //Q,A �׷�ȭ
	private int depth; //Q:�θ�,A:�ڽ�
	private int orderNo; //A����
	private int parent; //������ �ʿ�
	
	private int listNum;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public String getIpAddr() {
		return ipAddr;
	}
	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getGroupNum() {
		return groupNum;
	}
	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
}
