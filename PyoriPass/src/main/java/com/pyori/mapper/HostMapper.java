package com.pyori.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.pyori.domain.HostVO;

public interface HostMapper {
	
	// 1. 회원가입
	// 1-1. 회원가입 : 기존 회원인지 아닌지 확인
	@Select("select * from t_host where host_id = #{host_id}")
	public String join_check(String host_id);
	
	// 1-2. 회원가입 : 이메일 인증 메일 발송 전 authStatus 0 상태로 데이터 삽입
	@Insert("insert into t_host(host_id) values (#{host_id})")
	public void joinForEmailCheck(String host_id);
	
	// 1-3. 회원가입 : 이메일 인증 전 발급된 임시키로 데이터 수정
	@Update("update t_host set host_authStatus=#{host_authStatus} where host_id=#{host_id}")
	public void updateAuthKey(HostVO vo);
	
	// 1-4. 회원가입 : 이메일 인증 완료한 회원 가입
	@Update("update t_host set host_pw = #{host_pw}, host_tel = #{host_tel} where host_id=#{host_id} and host_authStatus=1")
	public void join(HostVO vo);
	
	// 2. 로그인
	@Select("select * from t_host where host_id = #{host_id}")
	public HostVO login(String host_id);
	
	// 3. 회원 삭제
	@Delete("delete from t_host where host_id=#{host_id}")
	public String Delete(String host_id);
	
	// 4. 회원 정보 수정  - host_name 삭제했어요.
	@Update("update t_host "
			+ "set host_pw=#{host_pw}, host_tel=#{host_tel}"
			+ "where host_id=#{host_id}")
	public String Update(HostVO vo);
	
	// 5. 비밀번호 찾기 : 임시비밀번호로 회원 비밀번호 수정
	@Update("update t_host set host_pw = #{host_pw} where host_id=#{host_id}")
	public void updateTempPw(HostVO vo);
	
}
