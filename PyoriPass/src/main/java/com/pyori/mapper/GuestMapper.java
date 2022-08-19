package com.pyori.mapper;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface GuestMapper {
	
	// nfc_update == 1
	@Select("SELECT guest_nfc FROM t_guest WHERE nfc_update = 1")
	public int oneSelect();
	
	// guest_nfc update
	@Update("UPDATE t_guest SET guest_nfc = #{id}, nfc_update = 1"
			+ " WHERE reservation_num = #{reservation_num}")
	public int nfcUpdate(String reservation_num, String id);
	
	// guest_nfc Select
	@Select("SELECT * FROM app_reservation WHERE checkin_date <= NOW()"
			+ " AND checkout_date >= NOW() "
			+ "AND guest_name = "
			+ "(SELECT guest_name FROM t_guest WHERE guest_nfc = #{id})")
	public int nfcSelect(String id);
}








=======
package com.pyori.mapper;

import com.pyori.domain.GuestVO;

public interface GuestMapper {

	// 1. 도어락 잠금 해제 : 들어온 NFC와 일치하는 데이터 조회
	public GuestVO checkNFC(String guest_nfc);

}
