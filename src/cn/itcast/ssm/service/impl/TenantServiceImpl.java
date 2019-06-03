package cn.itcast.ssm.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.ssm.mapper.TenantMapper;
import cn.itcast.ssm.po.UserInfo;
import cn.itcast.ssm.po.Tenant;
import cn.itcast.ssm.service.TenantService;


@Service  //涓轰簡鍖呮壂鎻忕殑鏃跺�欒繖涓猄ervice琚壂鎻忓埌  
public class TenantServiceImpl implements TenantService{
	@Autowired
	private TenantMapper tenantMapper;

	@Override
	public Tenant get(Serializable id) {
		return tenantMapper.get(id);
	}
	public List<Tenant> find(Map map) {
		return tenantMapper.find(map);
	} 
	public void insert(Tenant Tenant) {
		tenantMapper.insert(Tenant);
	}
	public void update(Tenant Tenant) {
		tenantMapper.update(Tenant);
	}
	public void deleteById(Serializable id) {
		tenantMapper.deleteById(id);
	}
	public void delete(Serializable[] ids) {
		tenantMapper.delete(ids);
	}
	@Override
	public List<Tenant> list(int start, int count) {
		// TODO Auto-generated method stub
		return tenantMapper.list(start,count);
	}
	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return tenantMapper.getTotal();
	}
	
}
 
 