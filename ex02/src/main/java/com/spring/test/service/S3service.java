package com.spring.test.service;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.spring.test.controller.UploadController;

import lombok.extern.log4j.Log4j;

/**
 * @author Sangwon Hyun
 * @since 2020. 2. 20. AWS 관련 비즈니스
 * 
 *        <PRE>
 * ---------------------
 * 개정이력
 * 2020. 2. 20. Sangwon Hyun : 최초작성
 *        </PRE>
 */
@Log4j
@Service
@Transactional(rollbackFor = Exception.class)
public class S3service {
	private static AmazonS3 s3Client;
	private static String accessKey = "AKIAXO3VOZSHE7HTLZ7B"; // 엑세스 키
	private static String secretKey = "kUTwy4hCqeD/27IEcgtLv5t5pyeObqvc/Y/0dEGB"; // 보안 엑세스 키
	@PostConstruct
	public void setS3Client() {
		AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);

		s3Client = AmazonS3ClientBuilder.standard()
				.withCredentials(new AWSStaticCredentialsProvider(credentials))
				.withRegion(Regions.AP_NORTHEAST_2)
				.build();
	}

	private static String bucketName = "sungmin-s3-bucket"; // S3 버킷경로

	public static void uploadObject(MultipartFile[] files, String bucketKey) throws IOException {

		ObjectMetadata omd = new ObjectMetadata();

		for (int i = 0; i < files.length; i++) {
			omd.setContentType(files[i].getContentType());
			omd.setContentLength(files[i].getSize());
			omd.setHeader("filename", files[i].getOriginalFilename());
			log.info(omd.getContentType());
			log.info(omd.getContentLength());
			log.info(omd);
			log.info(files[i].getOriginalFilename());
			log.info(files[i].getSize());
			log.info(files[i].getContentType());
			log.info(files[i].getInputStream());
			log.info(bucketName + bucketKey);

			s3Client.putObject(new PutObjectRequest(bucketName + bucketKey, files[i].getOriginalFilename(),
					files[i].getInputStream(), null));
		}
	}

	/**
	 * 
	 * @Method Name : uploadQRcode
	 * @작성일 : 2020. 2. 17.
	 * @작성자 : Sangwon Hyun
	 * @Method 설명 : S3 buffered 이미지 업로드
	 * @param os
	 * @param imgName   (저장하고 싶은 이미지이름)
	 * @param bucketKey (실제 저장할 경로)
	 * @throws IOException
	 */
	public void uploadBufferedImage(ByteArrayOutputStream os, String imgName, String bucketKey) throws IOException {
		byte[] buffer = os.toByteArray();
		InputStream is = new ByteArrayInputStream(buffer);
		ObjectMetadata meta = new ObjectMetadata();
		meta.setContentLength(buffer.length);
		s3Client.putObject(new PutObjectRequest(bucketName + bucketKey, imgName, is, meta));
	}

}
