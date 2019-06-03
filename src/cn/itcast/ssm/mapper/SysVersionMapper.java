package cn.itcast.ssm.mapper;

import cn.itcast.ssm.po.SysVersion;
import cn.itcast.ssm.po.SysVersionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysVersionMapper {
    long countByExample(SysVersionExample example);

    int deleteByExample(SysVersionExample example);

    int deleteByPrimaryKey(String versionId);

    int insert(SysVersion record);

    int insertSelective(SysVersion record);

    List<SysVersion> selectByExample(SysVersionExample example);

    SysVersion selectByPrimaryKey(String versionId);

    int updateByExampleSelective(@Param("record") SysVersion record, @Param("example") SysVersionExample example);

    int updateByExample(@Param("record") SysVersion record, @Param("example") SysVersionExample example);

    int updateByPrimaryKeySelective(SysVersion record);

    int updateByPrimaryKey(SysVersion record);
}