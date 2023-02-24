package com.bc.bodycoding.account;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown=true)
public class KakaoProfile {

	public Long id;
	public String connected_at;
	public KakaoAccount kakao_account;
	
	@Data
	@JsonIgnoreProperties(ignoreUnknown=true)
	public class KakaoAccount {

//		public Boolean hasEmail;
//		public Boolean emailNeedsAgreement;
//		public Boolean isEmailValid;
//		public Boolean isEmailVerified;
		public String email;
//		public Boolean hasAgeRange;
//		public Boolean ageRangeNeedsAgreement;
//		public String ageRange;
//		public Boolean hasBirthday;
//		public Boolean birthdayNeedsAgreement;
		public String birthday;
//		public String birthdayType;
//		public Boolean hasGender;
//		public Boolean genderNeedsAgreement;
		public String gender;
	}

}

