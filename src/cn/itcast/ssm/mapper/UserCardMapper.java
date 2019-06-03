package cn.itcast.ssm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.itcast.ssm.po.UserInfo;
import cn.itcast.ssm.po.VipCardInfo;
import cn.itcast.ssm.po.UserCard;

public interface UserCardMapper extends BaseDao<UserCard> {
	List<UserCard> list(int start, int count);  
    //我们这里可以直接使用继承的BaseDao的增删改查方法  
	//还可以在添加新的方法定义
	
	public List<UserCard> findCardsByUserNumber(String UserNumber) ;
	List<UserInfo> listByCondition(@Param("params") Map map);

	int getTotal();
	UserInfo listOne(@Param("params") Map map);
	
}
