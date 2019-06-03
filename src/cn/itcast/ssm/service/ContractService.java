package cn.itcast.ssm.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.itcast.ssm.po.Contract;
import cn.itcast.ssm.po.ContractCourse;
import cn.itcast.ssm.po.ContractItem;
import cn.itcast.ssm.po.ContractUserInfo;
import cn.itcast.ssm.po.CtMoreInfo;

public interface ContractService{
	void addContract(Contract contract);
	List<CtMoreInfo> showMoreCtInfo(int ctid);
	List<CtMoreInfo> showMoreMemInfo(int ctid);
	
	List<Contract>  findBy(Map map);
	void  updateContract(int ctid,String cname);
	
	void  contractTransCourse(Map map);
	void  changeTeacher(int ctid,String name, String type);
	
	void insertMiddleContractCourse(ContractCourse contractCourse);
	void insertMiddleContractUserInfo(ContractUserInfo contractMember);
	int maxCurrentId();
	void insertCtRecord(int ctid, String ctoperator, String ctteacher, String cname, int amountuse);
	int getRecordByConditon(Map<String, Object> map);
}