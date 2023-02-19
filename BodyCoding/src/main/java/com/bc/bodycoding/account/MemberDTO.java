package com.bc.bodycoding.account;

import lombok.Data;

@Data
public class MemberDTO {

	private int idx;
	private java.sql.Date regidate;
	private String center_name;
	private int center_num;
	private String center_addr;
	private String CEO_name;
	private String center_phone;
	private String center_email;
	private String about;
	private String comfort;
	private String running_time;
	private String center_ofile;
	private String center_sfile;
}
