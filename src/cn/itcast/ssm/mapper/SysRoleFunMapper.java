package cn.itcast.ssm.mapper;

import cn.itcast.ssm.po.SysRoleFun;
import cn.itcast.ssm.po.SysRoleFunExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysRoleFunMapper {
    long countByExample(SysRoleFunExample example);

    int deleteByExample(SysRoleFunExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(SysRoleFun record);

    int insertSelective(SysRoleFun record);

    List<SysRoleFun> selectByExample(SysRoleFunExample example);

    SysRoleFun selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") SysRoleFun record, @Param("example") SysRoleFunExample example);

    int updateByExample(@Param("record") SysRoleFun record, @Param("example") SysRoleFunExample example);

    int updateByPrimaryKeySelective(SysRoleFun record);

    int updateByPrimaryKey(SysRoleFun record);
}