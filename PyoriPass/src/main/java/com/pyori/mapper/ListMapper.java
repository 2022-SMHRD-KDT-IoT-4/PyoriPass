package com.pyori.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.pyori.domain.ListVO;

public interface ListMapper {
   @Select("SELECT g.guest_name, p.pension_name, re.checkin_date, re.checkout_date, r.room_name, g.guest_nfc, g.reservation_num\r\n" + 
   		"FROM(\r\n" + 
   		"   SELECT *\r\n" + 
   		"   FROM t_host\r\n" + 
   		"   WHERE host_id = #{host_id}\r\n" + 
   		") h\r\n" + 
   		"LEFT OUTER JOIN t_pension p ON h.host_id = p.host_id\r\n" + 
   		"LEFT OUTER JOIN t_room r ON p.pension_seq = r.pension_seq\r\n" + 
   		"LEFT OUTER JOIN t_reservation re ON r.room_seq = re.room_seq\r\n" + 
   		"LEFT OUTER JOIN t_guest g ON re.reservation_num = g.reservation_num" + 
         "   ORDER BY re.checkin_date DESC;")
   List<ListVO> listselect(String host_id);
}