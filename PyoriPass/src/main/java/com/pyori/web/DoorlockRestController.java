package com.pyori.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.pyori.domain.GuestVO;
import com.pyori.mapper.GuestMapper;

@RestController
public class DoorlockRestController {

   @Autowired
   GuestMapper g_mapper;

   // 1. 도어락 잠금 해제 :접근한 NFC가 우리 게스트인지 확인
   @RequestMapping("/checkNFC")
   public Map checkNFC(@RequestBody Map<String, Object> id) {
      String guest_nfc = (String.valueOf(id.values()));
      
      // JSON 형태로 result값 만들기
      Map result = new HashMap<String, Object>();

      GuestVO vo = g_mapper.checkNFC(guest_nfc);
      if (vo != null) {
         result.put("result", 1); // 게스트 일치
      } else {
         result.put("result", 0); // 게스트 불일치
      }
      return result;
   }

}
