package global.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDTO {
	//상품 일련번호
	private String product_idx;
	//상품 유형
	private String product_type;
	//상품 분류
	private String product_category;
	//멤버쉽 횟수
	private int membership_count;
	//멤버쉽 기간
	private int membership_period;
	//멤버쉽 종료일
	private Date membership_end;
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
	//mem_id랑 같은 용도! DTO받을 수 있도록
	private String user_id;
	//트레이너 아이디
	private String trainer_id;
	private String trainer_name;
	
	//카트 일련번호
	private String cart_idx;
	//카트 물건 갯수
	private String product_count;
	//장바구니 상품별 주문 총액
	private int unit_price;
	//회원 보유 포인트
	private int mem_point;
	//결제 시, 사용 포인트
	private int use_point;
	//기프트콘 번호
	private String product_serial_num;
	//수령여부 체크
	private String receive_check;
	//환불가능 여부 체크
	private String refund_check;
	//주문 일련번호
	private String order_idx;
	//주문 상세 일련번호
	private String order_detail_idx;
	
	//주문 총액
	private String pay_method;
	//주문 총액
	private int total_price;
	//적립 포인트
	private int save_point;
	//포인트 적용 후 최종 결제 금액
	private int final_price;
	//결제 처리 시, 확인용 상품 유형(멤버쉽,상품)
	private String type;
	
	//주문 날짜
	private String order_date;
	//총 매출
	private int sales;
	//주문명
	private String order_name;
	//주문상태
	private String order_status;
	
}


