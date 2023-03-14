package exam03;


import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;

/*
 드라이버 클래스 구현
 : 앞에서 개발한 매퍼와 리듀서 클래스를 실행하는 드라이버 클래스를 구현한다.
 맵리듀스 잡(Job)에 대한 실행 정보를 설정하고 실행하는 역할을 한다.
 	1. 잡 객체를 생성한다.
 	2. 잡 객체에 맵리듀스 잡의 실행정보를 설정한다.
 	3. 맵리듀스 잡을 실행한다.
 */
public class WordCount {
	
	public static void main(String[] args) throws Exception{

		//하둡시스템의 환경설정을 위한 객체
		Configuration conf = new Configuration();
		//파라미터 확인 후 종료 설정
		if(args.length !=2) {
			System.err.println("Usage: WordCount <input> <output>");
			System.exit(2);
		}
		
		//맵리듀스 잡 설정을 위한 객체생성
		Job job = Job.getInstance(conf, "WordCount");
		
		//라이브러리 파일 지정
		job.setJarByClass(WordCount.class);
		
		//우리가 제작한 매퍼와 리듀서를 설정
		job.setMapperClass(WordCountMapper.class);
		job.setReducerClass(WordCountReducer.class);
		
		//입출력 데이터 포맷 설정
		job.setInputFormatClass(TextInputFormat.class);
		job.setOutputFormatClass(TextOutputFormat.class);
		
		//매퍼와 리듀서의 출력데이터의 key와 value의 타입을 설정
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(IntWritable.class);
		
		//입출력 데이터를 어떤 경로로 받을지 매개변수를 통해 설정
		FileInputFormat.addInputPath(job, new Path(args[0]));
		FileOutputFormat.setOutputPath(job, new Path(args[1]));
		
		//잡을 실행한다.
		job.waitForCompletion(true);
	}

}
