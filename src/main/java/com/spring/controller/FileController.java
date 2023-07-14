package com.spring.controller;

import java.io.File;
import java.nio.file.Files;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.object.MyFile;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/file/*")
public class FileController {
	
	private MyFile uploader = null;
	
	@GetMapping("/board")
	public String board() {
		return "test";
	}
	
	@PostMapping("/board")
	public String boardImg(@RequestParam("uploadFile") MultipartFile[] uploadFile, Model model, HttpSession session, int b_no) {
		uploader = new MyFile();
		log.info(uploader);
	    String id = (String)session.getAttribute("SESS_ID");
	    if(id != null) {
	    	log.info(uploader.getUploadFolder());
		    uploader.setUploadFolderPlus(id);
			uploader.setUploadFolderPlus("board");
			uploader.setFileName(String.valueOf(b_no));
			log.info(uploader.getUploadFolder());
			uploader.uploadFile(uploadFile); // Unexpected output data
	    }else {
	    	log.info("no log");
	    }
	    
		return "test";
	}
	
	@GetMapping("/profile")
	public String profileImg() {
		uploader = new MyFile();
		log.info(uploader);
//	    String id = (String)session.getAttribute("SESS_ID");
	    if(id != null) {
//	    	log.info(uploader.getUploadFolder());
//		    uploader.setUploadFolderPlus(id);
//			uploader.setUploadFolderPlus("board");
//			uploader.setFileName(String.valueOf(b_no));
//			log.info(uploader.getUploadFolder());
//			uploader.uploadFile(uploadFile); // Unexpected output data
	    }else {
	    	log.info("no log");
	    }
		return null;
	}

	@GetMapping("/attach")
	@ResponseBody
	public ResponseEntity<byte[]> pullImg(String fileName) {
		log.info(uploader.getUploadFolder());
		File file = new File(uploader.getUploadFolder()+File.separatorChar, uploader.getFileName());
		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
