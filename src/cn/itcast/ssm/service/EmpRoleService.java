package cn.itcast.ssm.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.itcast.ssm.po.SysEmp;

public interface EmpRoleService{
	
	List<SysEmp> findEmpnamesByRname(Map map);
	
}