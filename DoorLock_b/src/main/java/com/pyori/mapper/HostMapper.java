package com.pyori.mapper;

import org.apache.ibatis.annotations.Select;

public interface HostMapper {
	
	public void main();

	@Select("select * from t_host where host_id = #{host_id}")
	public String login(String host_id);
	
}
