package com.pyori.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.objenesis.instantiator.annotations.Instantiator;

import com.pyori.domain.HostVO;

public interface HostMapper {
	
	@Select("select * from t_host where host_id = #{host_id}")
	public String join_check(String host_id);
	
	@Insert("insert into t_host(host_id,host_pw,host_tel) values(#{host_id}, #{host_pw}, #{host_tel})")
	public void join(HostVO vo);
	
	@Select("select * from t_host where host_id = #{host_id} and host_pw = #{host_pw}")
	public String login(HostVO vo);
	
	@Delete("delete from t_host where host_id=#{host_id}")
	public String Delete(String host_id);
	
	@Update("update t_host "
			+ "set host_id=#{host_id}, host_pw=#{host_pw},host_name={host_name},host_tel=#{host_tel}"
			+ "where host_id=#{host_id}")
	public String Update(HostVO vo);

	
}
