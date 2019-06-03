package cn.itcast.ssm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.itcast.ssm.po.Contract;
import cn.itcast.ssm.po.ContractCourse;
import cn.itcast.ssm.po.ContractItem;
import cn.itcast.ssm.po.ContractUserInfo;
import cn.itcast.ssm.po.CtMoreInfo;

public interface ContractDao{
	
	void addContract(Contract contract);
	
	List<Contract>  findBy(@Param("params") Map map);
	
	List<CtMoreInfo> showMoreCtInfo(int ctid);
	List<CtMoreInfo> showMoreMemInfo(int ctid);
	
	void  updateContract(@Param("ctid") int ctid,@Param("cname") String cname);    //多个参数使用param进行注解,不然会报param not found
	
	void  contractTransCourse(@Param("params") Map map);
	void  changeTeacher(@Param("ctid") int ctid, @Param("name") String name,@Param("type") String type);
	
	void  insertMiddleContractCourse(ContractCourse contractCourse);

	void insertMiddleContractMember(ContractUserInfo contractUserInfo);
	
	int maxCurrentId();

	void insertCtRecord(@Param("ctid")int ctid, @Param("ctoperator")String ctoperator,@Param("ctteacher") String ctteacher,@Param("cname") String cname, @Param("amountuse")int amountuse);

	int getRecordByConditon(@Param("params") Map<String, Object> map);

	
	
}