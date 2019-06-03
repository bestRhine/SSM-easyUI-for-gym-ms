package cn.itcast.ssm.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.ssm.mapper.UserCardMapper;
import cn.itcast.ssm.mapper.UserCardMapper;
import cn.itcast.ssm.po.UserCard;
import cn.itcast.ssm.po.UserCard;
import cn.itcast.ssm.po.VipCardInfo;
import cn.itcast.ssm.service.UserCardService;

@Service
public class UserCardServiceImpl implements UserCardService{
	
	@Autowired
	private UserCardMapper userCardMapper;


	@Override
	public UserCard get(Serializable id) {
		return userCardMapper.get(id);
	}
	public List<UserCard> find(Map map) {
		return userCardMapper.find(map);
	} 
	public void insert(UserCard UserCard) {
		userCardMapper.insert(UserCard);
	}
	public void update(UserCard UserCard) {
		userCardMapper.update(UserCard);
	}
	public void deleteById(Serializable id) {
		userCardMapper.deleteById(id);
	}
	public void delete(Serializable[] ids) {
		userCardMapper.delete(ids);
	}
	@Override
	public List<UserCard> list(int start, int count) {
		// TODO Auto-generated method stub
		return userCardMapper.list(start,count);
	}
	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return userCardMapper.getTotal();
	}
	@Override
	public List<UserCard> findCardsByUserNumber(String UserNumber) {
		// TODO Auto-generated method stub
		return userCardMapper.findCardsByUserNumber(UserNumber);
	}
	


	
	
}