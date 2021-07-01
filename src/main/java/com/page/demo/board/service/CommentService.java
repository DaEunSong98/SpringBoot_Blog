package com.page.demo.board.service;

import java.sql.Timestamp;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.page.demo.board.dto.CommentDTO;
import com.page.demo.board.mapper.CommentMapper;

@Service
public class CommentService {

	
	@Autowired
	CommentMapper mapper;
	
	public ArrayList<CommentDTO> list() {
		// TODO Auto-generated method stub
	
		return mapper.list();
	}

	public String insert(CommentDTO dto) {
		// TODO Auto-generated method stub
		dto.setWdate(new Timestamp(System.currentTimeMillis()));
		System.out.println(dto.getContent());
		System.out.println(dto.getIdx());
		System.out.println(dto.getWdate());
		
		//�ӽ÷� board_idx ����
		dto.setBoard_idx(41);
		if(dto.getContent()=="") return "fail"; //���� �Է°��� ���� ���
		if(mapper.insert(dto)) return "success";
		else return "fail"; //�ý��ۻ� ����
	}

	public void update(CommentDTO dto) {
		// TODO Auto-generated method stub
		mapper.update(dto);
	}

	public void delete() {
		// TODO Auto-generated method stub
		mapper.delete();
	}

}
