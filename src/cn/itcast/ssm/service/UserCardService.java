package cn.itcast.ssm.service;

import java.util.List;

import cn.itcast.ssm.po.UserCard;
import cn.itcast.ssm.po.UserCard;
import cn.itcast.ssm.po.VipCardInfo;
import java.io.Serializable;
import java.util.List;
import java.util.Map;


public interface UserCardService {    
	public UserCard get(Serializable id);//只查询一个，常用于修改  
    public List<UserCard> find(Map map);//根据条件查询多个结果
    public void insert(UserCard userCard);//插入，用实体作为参数  
    public void update(UserCard userCard);//修改，用实体作为参数  
    public void deleteById(Serializable id);//按id删除，删除一条；支持整数型和字符串类型ID  
    public void delete(Serializable[] ids);//批量删除；支持整数型和字符串类型ID  
    List<UserCard> list(int start,int count);
    int  getTotal();
	public List<UserCard> findCardsByUserNumber(String UserNumber) ;
}  
