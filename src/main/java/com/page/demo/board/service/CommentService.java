package com.page.demo.board.service;

import java.sql.Timestamp;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.page.demo.board.dto.CommentDTO;
import com.page.demo.board.mapper.CommentMapper;

@Service
public class CommentService {

	
	@Autowired
	CommentMapper mapper;
	

	public ArrayList<CommentDTO> list(int board_idx) {
		// TODO Auto-generated method stub
		return mapper.list(board_idx);
	}

	public String insert(CommentDTO dto) {
		// TODO Auto-generated method stub
		dto.setWdate(new Timestamp(System.currentTimeMillis()));
		System.out.println(dto.getContent());
		System.out.println(dto.getBoard_idx());
		System.out.println(dto.getWdate());
		
		//�ӽ÷� board_idx ����
		if(dto.getContent()=="") return "fail"; //���� �Է°��� ���� ���
		if(mapper.insert(dto)) return "success";
		else return "fail"; //�ý��ۻ� ����
	}

	public String update(CommentDTO dto) {
		// TODO Auto-generated method stub
		if(dto.getContent()=="")return "fail";
		else {
			mapper.update(dto);
			return "success";
		}
	}

	public String delete(int idx) {
		// TODO Auto-generated method stub
		mapper.delete(idx);
		return "success";
	}

}
