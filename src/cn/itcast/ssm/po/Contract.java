package cn.itcast.ssm.po;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Contract{
	
	   private  String    ctid;
	   private String tid;                //租户id
	   private String ctteacher;
	   private String ctsaler;
	   
	   
	   private String ctbegin;             //起止日期
	   
	   
	   
	   private String ctend;              //datetime
	   private  float  ctorder;           //decimal
	   private float  ctpay;                      //decimal
	   private String ctoperator;          //录入人
	   private String cttype;                     // comment '表示是新办、转让、更换教练'
	   private String ctcoursetype;          //合同关联课程类型，私课,组课


	public String getCtcoursetype() {
		return ctcoursetype;
	}
	public void setCtcoursetype(String ctcoursetype) {
		this.ctcoursetype = ctcoursetype;
	}
	public String getCtid() {
		return ctid;
	}
	public void setCtid(String ctid) {
		this.ctid = ctid;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getCtteacher() {
		return ctteacher;
	}
	public void setCtteacher(String ctteacher) {
		this.ctteacher = ctteacher;
	}
	public String getCtsaler() {
		return ctsaler;
	}
	public void setCtsaler(String ctsaler) {
		this.ctsaler = ctsaler;
	}
	   
	public String getCtbegin() {

		   
		return ctbegin;
	}
	public void setCtbegin(String ctbegin) {
		this.ctbegin = ctbegin;
	}
	  

	public String getCtend() {
		return ctend;
	}
	public void setCtend(String ctend) {
		this.ctend = ctend;
	}
	public float getCtorder() {
		return ctorder;
	}
	public void setCtorder(float ctorder) {
		this.ctorder = ctorder;
	}
	public float getCtpay() {
		return ctpay;
	}
	public void setCtpay(float ctpay) {
		this.ctpay = ctpay;
	}
	public String getCtoperator() {
		return ctoperator;
	}
	public void setCtoperator(String ctoperator) {
		this.ctoperator = ctoperator;
	}
	public String getCttype() {
		return cttype;
	}
	public void setCttype(String cttype) {
		this.cttype = cttype;
	}
	
	
	
	
}