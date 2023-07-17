package com.spring.object;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@NoArgsConstructor
public class MyFile {
	private String defaultFolder = "C:\\spring-tool-suite-3.9.18\\workspace\\TripToLive\\src\\main\\webapp\\resources\\TripToLive";
	private String uploadFolder = "";
	private String fileName;

	// 한폴더 단위 경로 지정 
	public void setUploadFolderPlus(String uploadFolder) {
		this.uploadFolder += "\\"+uploadFolder;
	}

	// 기본 경로와 지정한 경로 합쳐서 받음
	public String getUploadFolder() {
		return defaultFolder+uploadFolder;
	}
	
	// 파일이름에 추가한 구분자 받아오는 용도
	public String getFileName() {
		return fileName;
	}
	// 파일이름에 구분자 추가하는 용도
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public boolean uploadFile(MultipartFile[] uploadFile) {
	     for(MultipartFile multipartFile : uploadFile) {
	        log.info("upload File Name : " + multipartFile.getOriginalFilename() );
	        log.info("upload File Size : " + multipartFile.getSize() );
//	        File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
	        // multipartFile.getOriginalFilename() 클라이언트의 파일 시스템에서 원래 파일 이름을 반환합니다.
	        // File(File parent, String child) 폴더 밑에 자식
	        this.setFileName(this.getFileName()+"_"+multipartFile.getOriginalFilename());
	        File saveFile = new File(this.getUploadFolder(), this.getFileName());
	        if(!saveFile.exists()) {
	        	saveFile.getParentFile().mkdirs();
	        }
	        try {
	           multipartFile.transferTo(saveFile); // 수신된 파일을 지정된 대상 파일로 전송
	        } catch (Exception e) {
	            log.error(e.getMessage());
	        	e.printStackTrace();
	           return false;
	        }
	     }
	     return true;
	}

	public boolean uploadFile(MultipartFile uploadFile) {
	     if(uploadFile != null) {
	        log.info("upload File Name : " + uploadFile.getOriginalFilename() );
	        log.info("upload File Size : " + uploadFile.getSize() );
//	        File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
	        // multipartFile.getOriginalFilename() 클라이언트의 파일 시스템에서 원래 파일 이름을 반환합니다.
	        // File(File parent, String child) 폴더 밑에 자식
	        this.setFileName(this.getFileName()+"_"+uploadFile.getOriginalFilename());
	        File saveFile = new File(this.getUploadFolder(), this.getFileName());
	        if(!saveFile.exists()) {
	        	saveFile.getParentFile().mkdirs();
	        }
	        try {
	        	uploadFile.transferTo(saveFile); // 수신된 파일을 지정된 대상 파일로 전송
	        } catch (Exception e) {
	            log.error(e.getMessage());
	        	e.printStackTrace();
	           return false;
	        }
	     }
	     return true;
	}
	 
}
