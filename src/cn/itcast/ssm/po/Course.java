package cn.itcast.ssm.po;
public class Course{
	 private int    cid;       
	 private String     tid;        
	 private String   cname;          
	 private String   cinfo;          
	 private String   ctype;
	 private String   clevel;
	 private String   cpay;
	
	public String getClevel() {
		return clevel;
	}
	public void setClevel(String clevel) {
		this.clevel = clevel;
	}
	public String getCpay() {
		return cpay;
	}
	public void setCpay(String cpay) {
		this.cpay = cpay;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCinfo() {
		return cinfo;
	}
	public void setCinfo(String cinfo) {
		this.cinfo = cinfo;
	}
	public String getCtype() {
		return ctype;
	}
	public void setCtype(String ctype) {
		this.ctype = ctype;
	}
	 
	 
}