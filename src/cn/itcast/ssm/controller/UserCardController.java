package cn.itcast.ssm.controller;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.mysql.jdbc.StringUtils;

import cn.itcast.ssm.po.ActiveUser;
import cn.itcast.ssm.po.SysEmp;
import cn.itcast.ssm.po.UserCard;
import cn.itcast.ssm.po.UserInfo;
import cn.itcast.ssm.service.UserCardService;
import cn.itcast.ssm.service.UserInfoService;;

@Controller
public class UserCardController extends BaseController {

	@Resource
	UserCardService userCardService;

	@Resource
	UserInfoService userInfoService;

	@RequestMapping("/userCard/addCard")
	public String addCard(Model model) throws Exception {
		return "addCard";
	}

	@RequestMapping("/userCard/activeCardHome")
	public String activeCardHome(Model model) throws Exception {
		return "activeCard";
	}

	@RequestMapping("/userCard/transCardHome")
	public String tarnsCardHome(Model model) throws Exception {
		return "transCard";
	}

	@RequestMapping("/userCard/cardRenewalsHome")
	public String cardRenewalsHome(Model model) throws Exception {

		return "cardRenewals";
	}

	@RequestMapping("/userCard/list")
	public @ResponseBody List<UserCard> list() {
		int total = userCardService.getTotal();
		List<UserCard> userCardList = userCardService.list(0, total);
		return userCardList;
	}

	////// 列表查询
	@RequestMapping("/userCard/listBy")
	public @ResponseBody List<UserCard> listBy(String phone) {

		if (phone == null || phone == "") {
			int total = userCardService.getTotal();
			List<UserCard> userCardList = userCardService.list(0, total);
			return userCardList;
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("phone", phone);
			List<UserInfo> userInfoList = userInfoService.find(map);
			if (userInfoList.size() == 0) {
				map.put("userNumber", "-1");
				List<UserCard> userCardList = userCardService.find(map);
				return userCardList;
			}
			map.put("userNumber", userInfoList.get(0).getUserNumber());
			List<UserCard> userCardList = userCardService.find(map);

			return userCardList;
		}

	}

	////// 编辑
	@RequestMapping("/userCard/edit")
	public @ResponseBody String edit(HttpServletRequest request, HttpServletResponse response) {
		UserCard us = new UserCard();
		String cardNumber = request.getParameter("cardNumber");
		String userNumber = request.getParameter("userNumber");
		String cardTypeSerial = request.getParameter("cardTypeSerial");
		us.setCardNumber(cardNumber);
		us.setUserNumber(userNumber);
		us.setCardTypeSerial(Integer.parseInt(cardTypeSerial));
		userCardService.update(us);
		return "success";
	}

	////// 删除
	@RequestMapping("/userCard/delete")
	public @ResponseBody String delete(HttpServletRequest request, HttpServletResponse response) {
		String userNumber = request.getParameter("cardNumber");
		userCardService.deleteById(userNumber);
		return "success";
	}

	////// 添加
	@RequestMapping("/userCard/add")
	public @ResponseBody String add(HttpServletRequest request, HttpServletResponse response) {
		UserCard us = new UserCard();
		String userNumber = request.getParameter("userNumber");
		String cardTypeSerial = request.getParameter("cardTypeSerial");
		String cardTypeName = request.getParameter("cardTypeName");
		String cardType = request.getParameter("cardType");
		String username = request.getParameter("username");
		String cardStatus = request.getParameter("cardStatus");
		String cardRenewals = request.getParameter("cardRenewals");
		int cardRenewals1 = 0;
		int effectiveMonth = Integer.parseInt(request.getParameter("effectiveMonth"));
		int effectiveTimes = Integer.parseInt(request.getParameter("effectiveTimes"));
		int giveTime = Integer.parseInt(request.getParameter("giveTime"));
		int giveTimes = Integer.parseInt(request.getParameter("giveTimes"));
		int realPrice = Integer.parseInt(request.getParameter("realPrice"));
		int price = Integer.parseInt(request.getParameter("price"));
		if (!cardRenewals.equals("")) {
			cardRenewals1 = Integer.parseInt(cardRenewals);
		}
		if (cardStatus.equals("used")) {
			us.setActivationTime(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		}
		if (cardType.equals("按时计费")) {
			int TimeCardSumTime = effectiveMonth + giveTime + cardRenewals1;
			us.setTimeCardSumTime(TimeCardSumTime);
			us.setRemainingTime(TimeCardSumTime);
		}
		if (cardType.equals("按次计费")) {
			int TimesCardSumTimes = effectiveTimes + giveTimes + cardRenewals1;
			us.setTimesCardSumTimes(TimesCardSumTimes);
			us.setRemainingTimes(TimesCardSumTimes);
		}
		us.setUserNumber(userNumber);
		us.setCardTypeSerial(Integer.parseInt(cardTypeSerial));
		us.setCardTypeName(cardTypeName);
		us.setUsername(username);
		us.setCardStatus(cardStatus);
		us.setRealPrice(realPrice);
		us.setPrice(price);
		us.setCardRenewals(cardRenewals1);
		us.setCardType(cardType);
		userCardService.insert(us);
		return "success";
	}

	@RequestMapping("/userCard/transCard")
	public @ResponseBody String transCard(HttpServletRequest request, HttpServletResponse response) {
		String cardNumber = request.getParameter("cardNumber");
		String userNumberTrans = request.getParameter("userNumberTrans");
		String userNumberTransTo = request.getParameter("userNumberTransTo");
		String cardStatusInput = request.getParameter("cardStatusInput");
		String username = request.getParameter("username");
		if (cardStatusInput.equals("used"))
			return "error";
		UserCard uc = userCardService.get(cardNumber);
		uc.setUserNumber(userNumberTransTo);
		uc.setUsername(username);
		userCardService.update(uc);
		return "success";
	}

	@RequestMapping("/userCard/renewalsCard")
	public @ResponseBody String renewalsCard(HttpServletRequest request, HttpServletResponse response) {
		String cardNumber = request.getParameter("id");
		int cardRenewals = Integer.parseInt(request.getParameter("cardRenewalsInput"));
		UserCard uc = userCardService.get(cardNumber);
		if (!uc.getCardStatus().equals("unused"))
			return "error";
		uc.setCardRenewals(uc.getCardRenewals() + cardRenewals);
		if (uc.getCardType().equals("按次计费")) {
			uc.setTimesCardSumTimes(uc.getTimesCardSumTimes()+cardRenewals);
			uc.setRemainingTimes(uc.getRemainingTimes() + cardRenewals);
			}
		
		if (uc.getCardType().equals("按时计费")) {
			uc.setTimeCardSumTime(uc.getTimeCardSumTime()+cardRenewals);
			uc.setRemainingTime(uc.getRemainingTime()+cardRenewals);
		}
		userCardService.update(uc);
		return "success";
	}

	@RequestMapping("/userCard/getUser")
	public @ResponseBody UserInfo getUser(HttpServletRequest request, HttpServletResponse response) {
		String phone = request.getParameter("phone");
		UserInfo userInfo = userInfoService.getByPhone(phone);
		;
		// @ResponseBody将Retailer转成json格式输出
		return userInfo;
	}

	@RequestMapping("/userCard/active")
	public @ResponseBody String active(HttpServletRequest request, HttpServletResponse response) {
		String cardNumber = request.getParameter("cardNumber");
		String userNumber = request.getParameter("userNumber");
		String cardType = request.getParameter("cardType");
		UserCard userCard = userCardService.get(cardNumber);
		if (!userCard.getCardStatus().equals("unused")) {
			return "check";
		}
		int remainingTime = userCard.getRemainingTime();
		int remainingTimes = userCard.getRemainingTimes();
		userCard.setCardStatus("used");
		userCard.setRemainingTime(0);
		userCard.setRemainingTimes(0);
		String localDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		userCard.setActivationTime(localDate);
		////////
		UserInfo userInfo = userInfoService.get(userNumber);
		if (cardType.equals("按时计费")) {
			userInfo.setTimeCardEnabled("yes");
			userInfo.setCardActivationDateTime(localDate);
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date localdate1 = format.parse(localDate, new ParsePosition(0));
			Date localdate2 = format.parse(userInfo.getTimeCardEffectiveDate(), new ParsePosition(0));
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(compareDate(localdate1, localdate2));
			// add方法中的第二个参数n中，正数表示该日期后n天，负数表示该日期的前n天
			calendar.add(Calendar.DATE, remainingTime);
			Date date1 = calendar.getTime();
			String out = format.format(date1);
			userInfo.setTimeCardEffectiveDate(out);
		}
		if (cardType.equals("按次计费")) {
			userInfo.setTimesCardRemainingTimes(userInfo.getTimesCardRemainingTimes() + remainingTimes);
			userInfo.setTimesCardSumTimes(userInfo.getTimesCardSumTimes() + remainingTimes);
		}
		userCardService.update(userCard);
		System.out.println(cardType);
		userInfoService.update(userInfo);

		return "success";
	}

	private Map<String, Object> userCardToMap(UserCard userCard) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cardTypeName", checkStringIsEmpty(userCard.getCardTypeName()));

		return map;
	}

	private String checkStringIsEmpty(String param) {
		return param == null ? null : (param.equals("") ? null : "%" + param + "%");
	}

	private Date compareDate(Date date1, Date date2) {
		if (getYearMonth(date1) > getYearMonth(date2)) {
			return date1;
		} else {
			return date2;
		}
	}

	private int getYearMonth(Date dt) {// 传入日期
		Calendar cal = Calendar.getInstance();
		cal.setTime(dt);// 设置时间
		int year = cal.get(Calendar.YEAR);// 获取年份
		int month = cal.get(Calendar.MONTH);
		int day = cal.get(Calendar.DAY_OF_MONTH);// 获取月份
		return year * 10000 + month * 100 + day;// 返回年份乘以100加上月份的值，因为月份最多2位数，所以年份乘以100可以获取一个唯一的年月数值
	}
}
