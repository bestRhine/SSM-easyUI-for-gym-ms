package cn.itcast.ssm.service.impl;

import java.util.List;

import cn.itcast.ssm.mapper.UserInfoMapper;
import cn.itcast.ssm.po.UserInfo;
import cn.itcast.ssm.service.UserInfoService;


import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserInfoServiceImpl implements UserInfoService{    
	@Autowired
	private UserInfoMapper userInfoMapper;

	@Override
	public UserInfo get(Serializable id) {
		return userInfoMapper.get(id);
	}
	public List<UserInfo> find(Map map) {
		return userInfoMapper.find(map);
	} 
	public void insert(UserInfo UserInfo) {
		userInfoMapper.insert(UserInfo);
	}
	public void update(UserInfo UserInfo) {
		userInfoMapper.update(UserInfo);
	}
	public void deleteById(Serializable id) {
		userInfoMapper.deleteById(id);
	}
	public void delete(Serializable[] ids) {
		userInfoMapper.delete(ids);
	}
	@Override
	public List<UserInfo> list(int start, int count) {
		// TODO Auto-generated method stub
		return userInfoMapper.list(start,count);
	}
	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return userInfoMapper.getTotal();
	}
	@Override
	public UserInfo getByPhone(String phone) {
		// TODO Auto-generated method stub
		return userInfoMapper.getByPhone(phone);
	}
	
}  
