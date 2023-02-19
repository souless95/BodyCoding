package com.bc.bodycoding.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GymService {

	public List<GymDTO> select();
}
