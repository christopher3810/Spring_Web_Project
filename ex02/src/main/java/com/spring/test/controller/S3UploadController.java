package com.spring.test.controller;

import java.io.File;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.test.domain.AttachFileDTO;
import com.spring.test.domain.ReplyVO;
import com.spring.test.s3.S3Util;
import com.spring.test.s3.UploadFileUtil;
import com.spring.test.service.BoardService;
import com.spring.test.service.S3service;

import lombok.var;
import lombok.extern.log4j.Log4j;
@Log4j
@Controller
public class S3UploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(S3UploadController.class);

	private static final int ResponseEntity = 0;

	S3Util s3 = new S3Util();
	String bucketName = "sungmin-s3-bucket";


	//자격증 & 신분증 이미지 업로드
	@ResponseBody
	@RequestMapping(value = "/uploadAjaxCert", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String uploadAjaxCertificate(MultipartFile file) throws Exception {

		logger.info("자격증");
		logger.info("originalName: " + file.getOriginalFilename());
		String uploadpath = "almom/images";

		ResponseEntity<String> img_path = new ResponseEntity<>(
				UploadFileUtil.uploadFile(uploadpath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);
		String certificatePath = (String) img_path.getBody();

		return certificatePath;
	}

	//커버이미지 업로드
	@ResponseBody
	@RequestMapping(value = "/uploadAjaxCover", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String uploadAjaxCoverImg(@RequestParam("uploadFile") MultipartFile multipartFile) throws Exception {

		logger.info("커버이미지");
		logger.info("originalName: " + multipartFile.getOriginalFilename());
		String uploadpath = "almom/coverImage";

		ResponseEntity<String> img_path = new ResponseEntity<>(
				UploadFileUtil.uploadFile(uploadpath, multipartFile.getOriginalFilename(), multipartFile.getBytes()),
				HttpStatus.CREATED);
		String coverImagePath = (String) img_path.getBody();

		return coverImagePath;
	}

	// 프로필 이미지 업로드
	/*
	@ResponseBody
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String uploadAjax(MultipartFile file, String str, HttpSession session, HttpServletRequest request,
			Model model) throws Exception {

		logger.info("originalName: " + file.getOriginalFilename());
		//프로필 이미지의 추가경로
		String uploadpath = "almom/profileImage";

		ResponseEntity<String> img_path = new ResponseEntity<>(
				UploadFileUtil.uploadFile(uploadpath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);

		String user_imgPath = (String) img_path.getBody();

		logger.info(user_imgPath);

		UserVO vo = new UserVO();
		vo.setUser_profileImagePath(user_imgPath);
		UserVO userSession = (UserVO) session.getAttribute("login");
		vo.setUser_id(userSession.getUser_id());
		logger.info("file name : " + user_imgPath);

		userService.uploadImg(vo);

		userSession.setUser_profileImagePath(user_imgPath);
		session.setAttribute("login", userSession);
		logger.info(user_imgPath);
		return user_imgPath;
	}
*/

	//s3 이미지 디스플레이 
	@SuppressWarnings("resource")
	@ResponseBody
	@RequestMapping("/displayS3images")
	public ResponseEntity<byte[]> displayFile(String fileName, String directory , String uuid , String path) throws Exception {
		log.info("(display)fileName : " + fileName);
		log.info("(display)directory : " + directory);
		log.info("(display)uuid : " + uuid);
		log.info("(display)path : " + path);
		//파일 타입 구분인자 
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		HttpURLConnection uCon = null;
		String date = getdate();
		int w = 0;
		int h = 0;
		int q  = 100;
		String inputPath = path;
		
		if(directory.equals("productlistmain")) {
			
			inputPath = path;
			w = 400;
			h = 350;
		}
		else if(directory.equals("images")) {
			
			inputPath = path;
			w = 300;
			h = 250;
			//2020/00/00 = date
			//s3 bucket + date = image 경로
		}

	
		try {
			HttpHeaders headers = new HttpHeaders();
			URL url;
			try {
				//url = new URL(s3.getFileURL(bucketName+"/"+inputDirectory, fileName));
				
				String str = "https://d3fjc4x2ovyjvz.cloudfront.net"+inputPath+"/"+uuid +"_"
						+ fileName+"?w="+w+"&h="+h+"&f=webp&q="+q+"" ;
				log.info("(dispaly)str test : " + str);
				
				String txt = str;
			    char[] txtChar = txt.toCharArray();
			    for (int j = 0; j < txtChar.length; j++) {
			        if (txtChar[j] >= '\uAC00' && txtChar[j] <= '\uD7A3') {
			            String targetText = String.valueOf(txtChar[j]);
			            try {
			                txt = txt.replace(targetText, URLEncoder.encode(targetText, "utf-8"));
			            } catch (UnsupportedEncodingException e) {
			                e.printStackTrace();
			            }
			        }
			        if(txtChar[j] == ' ') {
			        	txt = txt.replace(" ", "%20");
			        }
			    }
			    //aws s3를 다이렉트로 이용하는 경우에는 인코딩을 " " -> "+" 로 해야하고
			    //aws cloudfront cdn을 사용하는 경우에는  " " -> "%20"으로 해야된다
			    //인코딩과정을 거치면 공백 + 한글 제목에서 다 커버가능
			    str = txt;
				log.info("한글만 encoded check  : " + str);
				url = new URL(str);
				log.info("s3에서 가져온 url 체크  : "+url);
				uCon = (HttpURLConnection)url.openConnection(); 
				log.info("url -> uCon check" + uCon);
				in = url.openStream(); // s3에서 해당 파일 url 불러와서 http로 토스 
				log.info("try catch in in check" + in);
			} catch (Exception e) {
				//url = new URL(s3.getFileURL(bucketName, "default.jpg"));
				//uCon = (HttpURLConnection) url.openConnection();
				//in = uCon.getInputStream();
				
			}
			log.info("check in inputstream " + in);
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			log.info("(s3controller/displayfile)check return entity : " + entity);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}
/*
	@ResponseBody
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName, String directory)throws Exception {

		logger.info("delete file: " + fileName);
		logger.info("delete foloder:"+directory);
		String inputDirectory = null;
		if(directory.equals("profile")) {
			inputDirectory = "almom/profileImage";
		}
		else if(directory.equals("certificate")) {
			inputDirectory = "almom/certificate";
		}else {
			inputDirectory = "almom/coverImage";
		}
		URL url;
		HttpURLConnection uCon = null;

		try {
			s3.fileDelete(bucketName, inputDirectory+fileName);
		} catch (Exception e) {
// s3.fileDelete(bucketName, "s_user.jpg");
			e.printStackTrace();
		}

		new File(inputDirectory + fileName.replace('/', File.separatorChar)).delete();

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	@ResponseBody
	@RequestMapping(value = "/deleteFileDB", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFileDB(String fileName, String directory)throws Exception {

		logger.info("delete file: " + fileName);
		logger.info("delete foloder:"+directory);
		String inputDirectory = null;
		if(directory.equals("profile")) {
			inputDirectory = "almom/profileImage";
		}
		else if(directory.equals("certificate")) {
			inputDirectory = "almom/certificate";
		}else {
			inputDirectory = "almom/coverImage";
		}
		URL url;
		HttpURLConnection uCon = null;

		try {
			s3.fileDelete(bucketName, inputDirectory+fileName);
		} catch (Exception e) {
// s3.fileDelete(bucketName, "s_user.jpg");
			e.printStackTrace();
		}
		service.deleteImage(fileName);
		new File(inputDirectory + fileName.replace('/', File.separatorChar)).delete();

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
*/
	private String getdate() {
		//mm소문자말고 MM대문자 확인 할것
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", "/"); //년월일 폴더
	}

	@PostMapping("/s3image")
	public @ResponseBody ResponseEntity<List<AttachFileDTO>> uploadImages(@RequestParam("uploadFile") MultipartFile[] files
	,boolean parseCheck)throws Exception  {	
		
		
		//date	
		String date = getdate();
		S3service.createFolder(date);
		//create dateFolder in aws s3
		
		log.info("[ s3controller 진입 ]");

		//DB
   		//String s3Path = "/images";
   		date = "/"+date;
		//S3service.uploadObject(files,date);
   		//log.info("(s3controller)리턴하는 list 값 확인 : " + list);
   		List<AttachFileDTO> list = S3service.uploadObject(files,date, parseCheck);
   		log.info(list);
   		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@PostMapping(value = "/s3delete",			
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE}) //JSON

	public ResponseEntity<String> deleteimageobj(@RequestBody AttachFileDTO adto){ 
		//JSON -> REPLYVO
		log.info("deleteimageobj parameter check : " + adto);
		var temp ="";
		temp = adto.getUploadPath() + "/" + adto.getUuid() + adto.getFileName();
		log.info("deleteimageobj path check " + temp);
		try {
			S3service.deleteObject(temp);;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
		//3항 연산자로 댓글 추가된 숫자 확인 후 처리`
	}
}