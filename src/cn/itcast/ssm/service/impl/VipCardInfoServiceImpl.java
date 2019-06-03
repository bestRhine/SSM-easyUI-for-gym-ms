package cn.itcast.ssm.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.ssm.mapper.VipCardInfoMapper;
import cn.itcast.ssm.po.UserInfo;
import cn.itcast.ssm.po.VipCardInfo;
import cn.itcast.ssm.service.VipCardInfoService;


@Service  //涓轰簡鍖呮壂鎻忕殑鏃跺�欒繖涓猄ervice琚壂鎻忓埌  
public class VipCardInfoServiceImpl implements VipCardInfoService{
	@Autowired
	private VipCardInfoMapper vipCardInfoMapper;

	@Override
	public VipCardInfo get(Serializable id) {
		return vipCardInfoMapper.get(id);
	}
	public List<VipCardInfo> find(Map map) {
		return vipCardInfoMapper.find(map);
	} 
	public void insert(VipCardInfo VipCardInfo) {
		vipCardInfoMapper.insert(VipCardInfo);
	}
	public void update(VipCardInfo VipCardInfo) {
		vipCardInfoMapper.update(VipCardInfo);
	}
	public void deleteById(Serializable id) {
		vipCardInfoMapper.deleteById(id);
	}
	public void delete(Serializable[] ids) {
		vipCardInfoMapper.delete(ids);
	}
	@Override
	public List<VipCardInfo> list(int start, int count) {
		// TODO Auto-generated method stub
		return vipCardInfoMapper.list(start,count);
	}
	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return vipCardInfoMapper.getTotal();
	}
	
}
 
 