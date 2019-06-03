package cn.itcast.ssm.mapper;

import cn.itcast.ssm.po.SysRole;
import cn.itcast.ssm.po.SysRoleExample;
import cn.itcast.ssm.po.SysEmp;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;



public interface SysEmp2Mapper extends BaseDao<SysEmp>{  
    
	
	List<SysEmp> list(int start, int count);  
    //我们这里可以直接使用继承的BaseDao的增删改查方法  
	//还可以在添加新的方法定义
	int getTotal();
	SysEmp listOne(@Param("params") Map map);

	
	List<SysEmp> listByCondition(@Param("params") Map map);




	SysEmp getByPhone(String phone);
	
}  