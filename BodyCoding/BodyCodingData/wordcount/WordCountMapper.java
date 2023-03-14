package exam03;

import java.io.IOException;
import java.util.StringTokenizer;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.service.launcher.testservices.ExceptionInExecuteLaunchableService.IOECodedException;

/*
 매퍼구현
 : key가 라인번호이고, value가 문장인 입력파라미터를 받아
 key가 글자이고 value가 글자수인 목록을 출력한다.
 	1. 입력 파라미터의 값인 문장을 공백 단위로 구분해 글자수를 계산한다.
 	2. 구분된 글자는 즉시 출력 파라미터에 추가한다. 이때 글자는 하나이므로 
 		글자수를 1로 설정한다.
 		
매퍼 클래스를 상속받아 작성한다.
Mapper<입력키타입, 입력값타입, 출력키타입, 출력값타입>을 의미한다.
각각 Java에서의 자료형인 Long, String, Integer에 해당한다.
 */
public class WordCountMapper extends 
	Mapper<LongWritable, Text, Text, IntWritable>{
	
	/*
	 값이 1인 Integer타입으로 생성한다. 단어의 글자수가 무조건 1이므로 
	 이와같이 설정한다.
	 */
	private final static IntWritable one = new IntWritable(1);
	//String타입으로 변수 선언
	private Text word = new Text();
	
	/*
	map메서드 오버라이딩
	형식 : map(입력키 타입, 입력값 타입, Context객체) 
	상속받은 매퍼클래스의 타입매개변수 중 '입력'에 해당하는 부분과
	동일한 타입으로 선언한다.
	Context객체를 하둡 맵리듀스 시스템과 통신하면서 출력데이터를 기록하거나
	모니터링에 필요한 상태값, 메세지를 갱신하는 역할을 한다.
	 */
	@Override
	public void map(LongWritable key, Text value, Context context)
		throws IOException, InterruptedException{
		
		/*
		 value를 문자열로 변환 후 space(공백) 단위로 구분하기 위해 객체를 
		 선언한다. 즉 공백으로 문자열을 구분한다.
		 */
		StringTokenizer itr = new StringTokenizer(value.toString());
		//구분된 갯수만큼 반복한다.
		while(itr.hasMoreTokens()) {
			//space로 구분된 String을 설정한다.
			word.set(itr.nextToken());
			/* 매퍼의 출력데이터에 레코드를 추가한다. key가 word이고 
			 value가 one인 레코드를 출력파라미터에 추가한다.
			 즉 상속받은 매퍼클래스의 타입매개변수 중 '출력'에 해당하는 
			 부분과 동일한 타입으로 설정되었다. */
			context.write(word, one);
		}
	}
}
