package com.bc.bodycoding.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GymService {

	public List<GymDTO> select();
	public int insert(GymDTO gymDTO);
	public GymDTO selectOne(GymDTO gymDTO);
	public int update(GymDTO gymDTO);
	public int delete(GymDTO gymDTO);
}
