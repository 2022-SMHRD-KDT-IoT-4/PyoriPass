package com.pyori.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.objenesis.instantiator.annotations.Instantiator;

import com.pyori.domain.HostVO;

public interface HostMapper {
	
	// 회원가입 : 기존 회원인지 아닌지 확인
	@Select("select * from t_host where host_id = #{host_id}")
	public String join_check(String host_id);
	
	// 회원가입
	@Insert("insert into t_host(host_id,host_pw,host_tel) values(#{host_id}, #{host_pw}, #{host_tel})")
	public void join(HostVO vo);
	
	// 로그인
	@Select("select * from t_host where host_id = #{host_id}")
	public HostVO login(String host_id);
	
	// 회원 삭제
	@Delete("delete from t_host where host_id=#{host_id}")
	public String Delete(String host_id);
	
	// 회원 정보 수정
	@Update("update t_host "
			+ "set host_pw=#{host_pw},host_name={host_name},host_tel=#{host_tel}"
			+ "where host_id=#{host_id}")
	public String Update(HostVO vo);
	
	// 비밀번호 찾기
	@Select("select host_pw from t_host where host_id = #{host_id}")
	public String findpw(String host_id);
	
}
