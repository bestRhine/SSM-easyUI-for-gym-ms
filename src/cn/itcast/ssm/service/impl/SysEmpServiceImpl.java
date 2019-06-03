package cn.itcast.ssm.service.impl;

import java.util.List;

import cn.itcast.ssm.mapper.SysEmp2Mapper;
import cn.itcast.ssm.po.SysEmp;
import cn.itcast.ssm.service.SysEmpService;


import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SysEmpServiceImpl implements SysEmpService{    
	@Autowired
	private SysEmp2Mapper sysEmpMapper;

	@Override
	public SysEmp get(Serializable id) {
		return sysEmpMapper.get(id);
	}
	public List<SysEmp> find(Map map) {
		return sysEmpMapper.find(map);
	} 
	public void insert(SysEmp SysEmp) {
		sysEmpMapper.insert(SysEmp);
	}
	public void update(SysEmp SysEmp) {
		sysEmpMapper.update(SysEmp);
	}
	public void deleteById(Serializable id) {
		sysEmpMapper.deleteById(id);
	}
	public void delete(Serializable[] ids) {
		sysEmpMapper.delete(ids);
	}
	@Override
	public List<SysEmp> list(int start, int count) {
		// TODO Auto-generated method stub
		return sysEmpMapper.list(start,count);
	}
	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return sysEmpMapper.getTotal();
	}
	@Override
	public SysEmp getByPhone(String phone) {
		// TODO Auto-generated method stub
		return sysEmpMapper.getByPhone(phone);
	}
	
}  
