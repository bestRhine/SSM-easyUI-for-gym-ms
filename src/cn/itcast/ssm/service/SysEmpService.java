package cn.itcast.ssm.service;

import java.util.List;

import cn.itcast.ssm.po.SysEmp;
import java.io.Serializable;
import java.util.List;
import java.util.Map;


public interface SysEmpService {    
    public SysEmp get(Serializable id);//只查询一个，常用于修改  
    public List<SysEmp> find(Map map);//根据条件查询多个结果
    public void insert(SysEmp sysEmp);//插入，用实体作为参数  
    public void update(SysEmp sysEmp);//修改，用实体作为参数  
    public void deleteById(Serializable id);//按id删除，删除一条；支持整数型和字符串类型ID  
    public void delete(Serializable[] ids);//批量删除；支持整数型和字符串类型ID  
    List<SysEmp> list(int start,int count);
    int  getTotal();
	public SysEmp getByPhone(String phone);
}  
