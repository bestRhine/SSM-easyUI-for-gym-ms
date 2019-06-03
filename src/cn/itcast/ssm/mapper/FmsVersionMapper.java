package cn.itcast.ssm.mapper;

import cn.itcast.ssm.po.FmsVersion;
import cn.itcast.ssm.po.FmsVersionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FmsVersionMapper {
    long countByExample(FmsVersionExample example);

    int deleteByExample(FmsVersionExample example);

    int insert(FmsVersion record);

    int insertSelective(FmsVersion record);

    List<FmsVersion> selectByExample(FmsVersionExample example);

    int updateByExampleSelective(@Param("record") FmsVersion record, @Param("example") FmsVersionExample example);

    int updateByExample(@Param("record") FmsVersion record, @Param("example") FmsVersionExample example);

	FmsVersion getCurrentVersionInfo();
}