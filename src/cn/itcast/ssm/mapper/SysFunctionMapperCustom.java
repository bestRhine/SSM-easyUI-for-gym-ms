package cn.itcast.ssm.mapper;

import java.util.List;

import cn.itcast.ssm.po.SysFunction;

public interface SysFunctionMapperCustom {


	List<SysFunction> findAdminFunctionListByUserId(String userid);

	List<SysFunction> findEmpFunctionListByUserId(String userid);

}
