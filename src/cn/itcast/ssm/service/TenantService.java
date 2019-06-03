package cn.itcast.ssm.service;

import java.util.List;

import cn.itcast.ssm.po.Tenant;
import java.io.Serializable;
import java.util.List;
import java.util.Map;


public interface TenantService {    
    public Tenant get(Serializable id);//只查询一个，常用于修改  
    public List<Tenant> find(Map map);//根据条件查询多个结果
    public void insert(Tenant vipCardInfo);//插入，用实体作为参数  
    public void update(Tenant vipCardInfo);//修改，用实体作为参数  
    public void deleteById(Serializable id);//按id删除，删除一条；支持整数型和字符串类型ID  
    public void delete(Serializable[] ids);//批量删除；支持整数型和字符串类型ID  
    List<Tenant> list(int start,int count);
    int  getTotal();
}  
