package com.pyori.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.pyori.domain.ListVO;
import com.pyori.mapper.ListMapper;
import com.zaxxer.hikari.util.SuspendResumeLock;

@RestController
public class ListRestController {
   
   @Autowired
   ListMapper mapper;
   
   
   
   @RequestMapping("/listselect")
   public List<ListVO> listselect(String host_id){
      List<ListVO> list = mapper.listselect(host_id);
      System.out.println("리스트 :" + list);
      
      return list;
   }
}