package com.spring.test.s3;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
/*
@Configuration
public class S3Config {

    //프로퍼티스 파일 혹은 yaml 파일에서 s3 access id와 pw를 호출한다.
	private static String accessKey = "AKIAXO3VOZSHE7HTLZ7B"; // 엑세스 키
	private static String secretKey = "kUTwy4hCqeD/27IEcgtLv5t5pyeObqvc/Y/0dEGB"; // 보안 엑세스 키
	
	@Bean
	public static BasicAWSCredentials AwsCredentials() {
		BasicAWSCredentials awsCreds = new BasicAWSCredentials(accessKey, secretKey);
		return awsCreds;
	}
	
	@Bean
	public static AmazonS3 AwsS3Client() {
		
		AmazonS3 s3Builder = AmazonS3ClientBuilder.standard()
				.withCredentials(new AWSStaticCredentialsProvider(AwsCredentials()))
				.withRegion(Regions.AP_NORTHEAST_2)
				.build();
		
		return s3Builder;
	}
}
*/
