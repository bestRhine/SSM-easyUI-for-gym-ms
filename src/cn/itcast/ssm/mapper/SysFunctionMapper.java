package cn.itcast.ssm.mapper;

import cn.itcast.ssm.po.SysFunction;
import cn.itcast.ssm.po.SysFunctionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysFunctionMapper {
    long countByExample(SysFunctionExample example);

    int deleteByExample(SysFunctionExample example);

    int deleteByPrimaryKey(String functionId);

    int insert(SysFunction record);

    int insertSelective(SysFunction record);

    List<SysFunction> selectByExample(SysFunctionExample example);

    SysFunction selectByPrimaryKey(String functionId);

    int updateByExampleSelective(@Param("record") SysFunction record, @Param("example") SysFunctionExample example);

    int updateByExample(@Param("record") SysFunction record, @Param("example") SysFunctionExample example);

    int updateByPrimaryKeySelective(SysFunction record);

    int updateByPrimaryKey(SysFunction record);
}