package com.pyori.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ListVO {
   private String guest_name;
   private String pension_name;
   private String checkin_date;
   private String checkout_date;
   private String room_name;
   private String reservation_num;
   private String guest_nfc;
}