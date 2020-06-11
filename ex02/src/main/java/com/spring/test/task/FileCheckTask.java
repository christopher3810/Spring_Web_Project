package com.spring.test.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.spring.test.domain.BoardAttachVO;
import com.spring.test.mapper.BoardAttachMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class FileCheckTask {
	
	@Setter(onMethod_ = { @Autowired })
	private BoardAttachMapper attachMapper;
	
	private String getFolderYesterDay() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal = Calendar.getInstance();
		
		cal.add(Calendar.DATE, -1);
		
		String str = sdf.format(cal.getTime());
		
		return str.replace("-", File.separator);
		
	}
	
	//cron 속성 부여해서 주기 제어
	@Scheduled(cron="0 0 2 * * *")
	public void checkFiles()throws Exception{
		
		log.warn("File Check Task 동작중 .................................");
		log.warn(new Date());
		
		List<BoardAttachVO> fileList = attachMapper.getOldFiles();
		log.info(fileList);
		// 데이터 베이스 파일 리스트로 디렉토리 안에 파일 체크 준비 
		List<Path> fileListPaths = fileList.stream().map(vo -> Paths.get("D:\\web_upload", vo.getUploadPath(),
				vo.getUuid() + "_" + vo.getFileName())).collect(Collectors.toList());
				
		//썸네일 이미지를 갖는 파일들
		fileList.stream().filter(vo -> vo.isFileType() == true)
		.map(vo -> Paths.get("D:\\web_upload" , vo.getUploadPath(), "s_" + vo.getUuid() + "_" + vo.getFileName()))
			.forEach(p -> fileListPaths.add(p));
		
		log.warn("======================================================================");
		
		fileListPaths.forEach(p -> log.warn(p));
		
		//어제날짜 디렉토리 안에 있는 파일
		
		File targetDir = Paths.get("D:\\web_upload", getFolderYesterDay()).toFile();
		
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath())==false);
		
		log.warn("-------------------------------------------------------------------------");
		for(File file : removeFiles) {
			
			log.warn(file.getAbsolutePath());
			file.delete();
		}
		
	}
}
