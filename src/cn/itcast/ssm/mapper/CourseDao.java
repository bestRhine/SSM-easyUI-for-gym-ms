package cn.itcast.ssm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.itcast.ssm.po.Course;

public interface CourseDao {

	/* (non-Javadoc)
	 * @see cn.com.jsf.jsfsystem.dao.impl.TestDao#findCourseByName(cn.com.jsf.jsfsystem.entity.course)
	 */
	List<Course> listCourseByName(@Param("params") Map map);
	void deleteCourse(int cid);
	void updateCourse(Course cs);
	void addCourse(Course cs);
	Course getCourse(int cid);

    List<Course> list(int start, int count);
	int getTotal();

}