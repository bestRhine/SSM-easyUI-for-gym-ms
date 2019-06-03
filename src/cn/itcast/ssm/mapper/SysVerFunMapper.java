package cn.itcast.ssm.mapper;

import cn.itcast.ssm.po.SysVerFun;
import cn.itcast.ssm.po.SysVerFunExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysVerFunMapper {
    long countByExample(SysVerFunExample example);

    int deleteByExample(SysVerFunExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(SysVerFun record);

    int insertSelective(SysVerFun record);

    List<SysVerFun> selectByExample(SysVerFunExample example);

    SysVerFun selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") SysVerFun record, @Param("example") SysVerFunExample example);

    int updateByExample(@Param("record") SysVerFun record, @Param("example") SysVerFunExample example);

    int updateByPrimaryKeySelective(SysVerFun record);

    int updateByPrimaryKey(SysVerFun record);
}