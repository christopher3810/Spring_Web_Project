package com.spring.test.service;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.spring.test.controller.UploadController;
import com.spring.test.domain.AttachFileDTO;

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
	private static String accessKey = "AKIAXO3VOZSHAIF7PIC6"; // 엑세스 키
	private static String secretKey = "ZiRpCpp1jqhPyI3E4QzwD7UpsZ2dZyk6V6KEjdVo"; // 보안 엑세스 키

	@PostConstruct
	public void setS3Client() {
		AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);

		s3Client = AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(credentials))
				.withRegion(Regions.AP_NORTHEAST_2).build();
	}

	private static String bucketName = "sungmin-s3-bucket"; // S3 버킷경로

	// 폴더 생성 (폴더는 파일명 뒤에 "/"를 붙여야한다.)
	public static void createFolder(String folderName) {

		// yyyy/mm/dd
		log.info("(s3service)s3폴더경로명 : " + folderName);
		String tempyear = folderName.substring(0, 4);
		String tempmonth = folderName.substring(5, 7);
		String tempdays = folderName.substring(8, 10);
		log.info("(s3service)해당년도 : " + tempyear);
		log.info("(s3service)해당월  : " + tempmonth);
		log.info("(s3service)해당일 : " + tempdays);
		
		
		//해당 객체의 존재를 확인 할때 해당 객체가 폴더일 경우 뒤에/ 를 붙여줘야 됨
		boolean yearExists = s3Client.doesObjectExist(bucketName, tempyear+"/");
		log.info("(s3service)폴더경로 해당년 확인  : " +yearExists);
		boolean monthExists = s3Client.doesObjectExist(bucketName + "/" + tempyear, tempmonth+"/");
		log.info("(s3service)폴더경로 해당월 확인  : " +monthExists);
		boolean daysExists = s3Client.doesObjectExist(bucketName + "/" + tempyear + "/" + tempmonth, tempdays+"/");
		log.info("(s3service)폴더경로 해당일 확인  : " +daysExists);

		if (yearExists) {

			if (monthExists) {
				s3Client.putObject(bucketName + "/" + tempyear + "/" + tempmonth, tempdays + "/",
						new ByteArrayInputStream(new byte[0]), new ObjectMetadata());
				log.info("(s3service)동일년도 동일월에 일자로 경로생성");
			} else {
				s3Client.putObject(bucketName + "/" + tempyear, tempmonth + "/", new ByteArrayInputStream(new byte[0]),
						new ObjectMetadata());
				s3Client.putObject(bucketName + "/" + tempyear + "/" + tempmonth, tempdays + "/",
						new ByteArrayInputStream(new byte[0]), new ObjectMetadata());
				log.info("(s3service)연도만 같아 월+일 경로 생성");
			}

		} else {
			s3Client.putObject(bucketName, tempyear + "/", new ByteArrayInputStream(new byte[0]), new ObjectMetadata());
			s3Client.putObject(bucketName + "/" + tempyear, tempmonth + "/", new ByteArrayInputStream(new byte[0]),
					new ObjectMetadata());
			s3Client.putObject(bucketName + "/" + tempyear + "/" + tempmonth, tempdays + "/",
					new ByteArrayInputStream(new byte[0]), new ObjectMetadata());
			log.info("(s3service)해당년도 처음 만든 경로 년+월+알 경로생성");
		}

	}

	public static List<AttachFileDTO> uploadObject(MultipartFile[] files, String bucketKey 
			, boolean parsecheck) throws IOException {
		
		List<AttachFileDTO> list = new  ArrayList<>();
		
		for (int i = 0; i < files.length; i++) {

			ObjectMetadata omd = new ObjectMetadata();
			AttachFileDTO attachDTO = new AttachFileDTO();
			
			UUID uid = UUID.randomUUID();
	        try {
	        	attachDTO.setFileName(files[i].getOriginalFilename());
				attachDTO.setUploadPath(bucketKey);
				attachDTO.setMaincheck(parsecheck);
				attachDTO.setUuid(uid.toString());	
				String test = files[i].getContentType() ;
				log.info("(s3service)해당 컨텐츠파일 명 제대로 들어가는지 : " + test);
				if(test.startsWith("image")) {
					attachDTO.setImage(true);
				}
				omd.setContentType(files[i].getContentType());
				omd.setContentLength(files[i].getSize());
				// omd.setHeader("filename", files[i].getOriginalFilename());
				log.info("(s3service)컨텐츠타입"+omd.getContentType());
				log.info("(s3service)컨텐츠 길이"+omd.getContentLength());
				log.info("(s3service)오리지널 파일명 : "+files[i].getOriginalFilename());
				log.info("(s3service)파일 사이즈 : " + files[i].getSize());
				log.info("(s3service)파일 컨텐츠 타입 "+files[i].getContentType());
				log.info("(s3service)파일 inputstream : "+files[i].getInputStream());
				log.info("(s3service)해당 파일이 저장된 버킷 경로 : "+bucketName + bucketKey);
				
				String savedName = uid.toString() + "_" + files[i].getOriginalFilename();
				
		        log.info("(s3service)UUID적용된 파일명 : " + savedName);
		        
				s3Client.putObject(new PutObjectRequest(bucketName + bucketKey, savedName,
						files[i].getInputStream(), omd));
				
		        list.add(attachDTO); //DTO객체 리스트에 추가 
	        }
	        catch(Exception e){
	        	e.printStackTrace();
				log.error(e.getMessage());
	        }
	        //try catch
	        
		}//end of for
		return list; //리스트 넘기기
	}

	// src파일 읽어오기
	public S3ObjectInputStream getSrcFile(String bucketName, String fileName) throws IOException {
		System.out.println("넘어오는 파일명 : " + fileName);
		fileName = (fileName).replace(File.separatorChar, '/');
		S3Object s3object = s3Client.getObject(new GetObjectRequest(bucketName, fileName)); // 해당 파일 s3객체에 담기

		S3ObjectInputStream objectInputStream = s3object.getObjectContent(); // s3객체를 스트림으로 변환

		return objectInputStream;
	}
	
	public static void deleteObject(String targetpath) throws IOException {
		log.info("s3service_(deleteobject)_paramcheck : " + targetpath);
		try {
			s3Client.deleteObject(new DeleteObjectRequest(bucketName, targetpath));
		} catch (Exception e) {
// s3.fileDelete(bucketName, "s_user.jpg");
			e.printStackTrace();
		}
	}

	/*
	 * // 파일 삭제 public void fileDelete(String fileName) {
	 * 
	 * System.out.println("fileName : " + fileName); String imgName =
	 * (fileName).replace(File.separatorChar, '/');
	 * s3Client.deleteObject(this.getBucketName(), imgName);
	 * System.out.println("삭제성공"); }
	 */

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
	 * 
	 *                     public void uploadBufferedImage(ByteArrayOutputStream os,
	 *                     String imgName, String bucketKey) throws IOException {
	 *                     byte[] buffer = os.toByteArray(); InputStream is = new
	 *                     ByteArrayInputStream(buffer); ObjectMetadata meta = new
	 *                     ObjectMetadata(); meta.setContentLength(buffer.length);
	 *                     s3Client.putObject(new PutObjectRequest(bucketName +
	 *                     bucketKey, imgName, is, meta)); }
	 */
}
