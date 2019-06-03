package cn.itcast.ssm.mapper;

import cn.itcast.ssm.po.SysEmp;
import cn.itcast.ssm.po.SysEmpRole;
import cn.itcast.ssm.po.SysEmpRoleExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface SysEmpRoleMapper {
    long countByExample(SysEmpRoleExample example);

    int deleteByExample(SysEmpRoleExample example);

    int deleteByPrimaryKey(String id);

    int insert(SysEmpRole record);

    int insertSelective(SysEmpRole record);

    List<SysEmpRole> selectByExample(SysEmpRoleExample example);

    SysEmpRole selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") SysEmpRole record, @Param("example") SysEmpRoleExample example);

    int updateByExample(@Param("record") SysEmpRole record, @Param("example") SysEmpRoleExample example);

    int updateByPrimaryKeySelective(SysEmpRole record);

    int updateByPrimaryKey(SysEmpRole record);
    
    List<SysEmp> findEmpnamesByRname(@Param("params") Map map);
}