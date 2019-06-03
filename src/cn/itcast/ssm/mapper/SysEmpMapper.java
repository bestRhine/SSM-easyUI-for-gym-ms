package cn.itcast.ssm.mapper;

import cn.itcast.ssm.po.SysEmp;
import cn.itcast.ssm.po.SysEmpExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysEmpMapper {
    long countByExample(SysEmpExample example);

    int deleteByExample(SysEmpExample example);

    int deleteByPrimaryKey(String empId);

    int insert(SysEmp record);

    int insertSelective(SysEmp record);

    List<SysEmp> selectByExample(SysEmpExample example);

    SysEmp selectByPrimaryKey(String empId);

    int updateByExampleSelective(@Param("record") SysEmp record, @Param("example") SysEmpExample example);

    int updateByExample(@Param("record") SysEmp record, @Param("example") SysEmpExample example);

    int updateByPrimaryKeySelective(SysEmp record);

    int updateByPrimaryKey(SysEmp record);
}