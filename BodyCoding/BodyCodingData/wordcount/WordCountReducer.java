package exam03;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

/*
 리듀서 구현
 : 글자와 글자수로 구성된 입력파라미터를 받아 글자수를 합산해서 출력하는
 리듀서 클래스를 구현한다.
 	1. 입력 파라미터의 값에 담겨있는 글자수를 합산한다.
 	2. 합산이 종료되면 출력 파라미터에 레코드를 추가한다.
 	
리듀서 클래스를 상속하여 구현한다.
Reducer<입력키타입, 입력값타입, 출력키타입, 출력값타입>을 의미한다.
특히 입력쪽은 Mapper의 출력과 동일한 타입을 가진다.
Mapper에서 context.write(word, one) 와 같이 출력하면
Reducer에서는 <Text, IntWritable> 과 같이 받아서 분석에 사용한다.
 */
public class WordCountReducer extends 
	Reducer<Text, IntWritable, Text, IntWritable>{
	
	//결과값은 Integer타입으로 선언한다. 
	private IntWritable result = new IntWritable();
	
	/*
	 reduce() 메서드 오버라이딩
	 형식 : reduce(입력키타입, Iterator<입력값타입>, Context객체)
	 map() 메서드와 동일한 형태이지만 입력값을 Iterator가 감싸고 있다.
	 가령 글자 a의 값은 <a, 1>로 입력된다. 두개의 값이 집합과 같은 형태로 
	 되어있어 반복객체인 Iterator로 감싸서 선언하게 된다.
	 */
	@Override
	public void reduce(Text key, Iterable<IntWritable> values,
			Context context)
			throws IOException, InterruptedException{
		//글자수 합산을 위한 변수 생성
		int sum = 0;
		//글자수가 담겨있는 Iterator객체의 갯수만큼 반복한다.
		for(IntWritable val : values) {
			//글자수를 합산한다.
			sum += val.get();
		}
		//출력키를 설정한다.
		result.set(sum);
		//출력 데이터를 생성한다.
		context.write(key, result);
		/*
		 결과 데이터는 [단어, 단어의 갯수]와 같이 구성된다.
		 */
	}

}
