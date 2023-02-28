package global.dto;


import java.sql.Date;

import lombok.Data;

@Data
public class ProductDTO {
	//상품 일련번호
	private int product_idx;
	//상품 유형
	private String product_type;
	//상품 분류
	private String product_category;
	//멤버쉽 횟수
	private int membership_count;
	//멤버쉽 기간
	private int membership_period;
	//상품명
	private String product_name;
	//상품 설명
	private String product_description;
	//상품 이미지
	private String product_img;
	//상품 가격
	private int product_price;
	//상품 등록일
	private Date product_regidate;
	//지점별 상품 일련번호
	private int product_detail_idx;
	//지점 코드
	private String gym_code;
	//판매 상태
	private String product_status;
	//재고
	private int product_stock;
	//수업 분류
	private String lesson_category;
	//트레이너 이름
	private String mem_name;
	//트레이너 이미지
	private String mem_img;
	//회원 아이디
	private String mem_id;
	//트레이너 아이디
	private String trainer_id;
}
