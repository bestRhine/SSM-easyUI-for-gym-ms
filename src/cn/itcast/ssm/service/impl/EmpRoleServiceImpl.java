package cn.itcast.ssm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.ssm.mapper.SysEmpRoleMapper;
import cn.itcast.ssm.po.SysEmp;
import cn.itcast.ssm.service.EmpRoleService;

@Service
public class EmpRoleServiceImpl implements EmpRoleService{
	
	@Autowired
	private SysEmpRoleMapper sysEmpRoleMapper;
	
	@Override
	public List<SysEmp> findEmpnamesByRname(Map map) {
		// TODO Auto-generated method stub
		return sysEmpRoleMapper.findEmpnamesByRname(map);
	}
	
}