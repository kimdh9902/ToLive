package com.spring.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.object.MyFile;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/file/*")
public class FileController {
	
	private MyFile uploader = new MyFile();
	
	@GetMapping("/board")
	public String board() {
		return "test";
	}
	
	@PostMapping("/board")
	public String boardImg(@RequestParam("uploadFile") MultipartFile[] uploadFile, Model model, HttpSession session, int b_no) {
		log.info(uploader);
	    String id = (String)session.getAttribute("SESS_ID");
	    if(id != null) {
	    	log.info(uploader.getUploadFolder());
		    uploader.setUploadFolderPlus(id);
			uploader.setUploadFolderPlus("board");
			uploader.setFileName(String.valueOf(b_no));
			log.info(uploader.getUploadFolder());
			uploader.uploadFile(uploadFile); // Unexpected output data
	    }
	    
		return "test";
	}
	
	@GetMapping("/profile")
	public String profileImg() {
		
		return null;
	}
	
//	@PostMapping("/upload")
//	   public String uploadFormPost(@RequestParam("uploadFile") MultipartFile[] uploadFile, Model model, HttpSession session) {
//	      log.info("uploadFormAction");
//	      String id = (String)session.getAttribute("SESS_ID"); 
//	      log.info(id);
//	      uploader.setUploadFolderPlus(id);
//	      uploader.setUploadFolderPlus();
//	      log.info(uploader.getUploadFolder());
//	      
//	      for(MultipartFile multipartFile : uploadFile) {
//	         log.info("----------------------------");
//	         log.info("upload File Name : " + multipartFile.getOriginalFilename() );
//	         log.info("upload File Size : " + multipartFile.getSize() );
//	         
////	         File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
//	         File saveFile = new File(uploader.getUploadFolder(), multipartFile.getOriginalFilename());
//	         try {
//	            multipartFile.transferTo(saveFile);
//	            
//	            model.addAttribute("msg", "success file uploaded-" + multipartFile.getOriginalFilename());
//	            model.addAttribute("originalFileName", multipartFile.getOriginalFilename());
//	            
//	         } catch (Exception e) {
//	            log.error(e.getMessage());
//	            model.addAttribute("msg", "fail file uploaded-" + multipartFile.getOriginalFilename());
//	         }
//	         
//	      }
//	      return "upload/upload-action";
//	   }
	
	@GetMapping("/attach")
	public String pullImg() {
		
		return null;
	}
}
