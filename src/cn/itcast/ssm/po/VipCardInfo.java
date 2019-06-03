package cn.itcast.ssm.po;

import java.math.BigDecimal;

public class VipCardInfo {
	private int  cardTypeSerial;
	private String tenantID;
	private String vipCardType;
	private String chargeMethod;
	private int  effectiveMonth;
	private int  effectiveTimes;
	private String beginDate;
	private String endDate;
	private int  dropOutMoney;
	private BigDecimal commissionRatio;
	private int giveTime;
	private int  giveTimes;
	private int  price;
	private String description;
	private BigDecimal discount;
	private String gift;
	private String isEnabled;
	private String beginTime;
	private String endTime;
	public int getCardTypeSerial() {
		return cardTypeSerial;
	}
	public void setCardTypeSerial(int cardTypeSerial) {
		this.cardTypeSerial = cardTypeSerial;
	}
	public String getTenantID() {
		return tenantID;
	}
	public void setTenantID(String tenantID) {
		this.tenantID = tenantID;
	}
	public String getVipCardType() {
		return vipCardType;
	}
	public void setVipCardType(String vipCardType) {
		this.vipCardType = vipCardType;
	}
	public String getChargeMethod() {
		return chargeMethod;
	}
	public void setChargeMethod(String chargeMethod) {
		this.chargeMethod = chargeMethod;
	}
	public int getEffectiveMonth() {
		return effectiveMonth;
	}
	public void setEffectiveMonth(int effectiveMonth) {
		this.effectiveMonth = effectiveMonth;
	}
	public int getEffectiveTimes() {
		return effectiveTimes;
	}
	public void setEffectiveTimes(int effectiveTimes) {
		this.effectiveTimes = effectiveTimes;
	}
	public String getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getDropOutMoney() {
		return dropOutMoney;
	}
	public void setDropOutMoney(int dropOutMoney) {
		this.dropOutMoney = dropOutMoney;
	}
	public BigDecimal getCommissionRatio() {
		return commissionRatio;
	}
	public void setCommissionRatio(BigDecimal commissionRatio) {
		this.commissionRatio = commissionRatio;
	}
	public int getGiveTime() {
		return giveTime;
	}
	public void setGiveTime(int giveTime) {
		this.giveTime = giveTime;
	}
	public int getGiveTimes() {
		return giveTimes;
	}
	public void setGiveTimes(int giveTimes) {
		this.giveTimes = giveTimes;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public BigDecimal getDiscount() {
		return discount;
	}
	public void setDiscount(BigDecimal discount) {
		this.discount = discount;
	}
	public String getGift() {
		return gift;
	}
	public void setGift(String gift) {
		this.gift = gift;
	}
	public String getIsEnabled() {
		return isEnabled;
	}
	public void setIsEnabled(String isEnabled) {
		this.isEnabled = isEnabled;
	}
	public String getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
}
