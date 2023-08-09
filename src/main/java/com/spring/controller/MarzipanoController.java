package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;

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

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.spring.domain.BoardContentsVO;
import com.spring.object.DeleteFile;
import com.spring.object.UnZipTool;
import com.spring.service.BoardContentsService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = { "/marzipano/*", "/display/*" })
@RequiredArgsConstructor
@Log4j
public class MarzipanoController {
	private String uploadFolder = "C:\\sts-3\\workspace\\TripToLive\\src\\main\\webapp\\resources\\TripToLive\\board_contents";
	private final BoardContentsService service;
	// 저장되는 폴더위치 강제로 잡아줄것

	// 파일 업로드하는 곳
	@PostMapping("/uploadAjaxAction")
	@ResponseBody
	public String uploadAjaxAction(MultipartFile[] uploadFile, HttpServletRequest request, BoardContentsVO vo) {
		log.info("uploadFormAction");
		// attach 부분 나중에 jsp 구성할때 결과확인하면서 ?????
		String srcPath = request.getContextPath();
		System.out.println(srcPath);
		srcPath += "/display/attach?fileName=";
		
		// 파일 업로드 하는 부분 @@@@
		JsonArray jsonArray = new JsonArray();
		for (MultipartFile multipartFile : uploadFile) {
			String fileName = multipartFile.getOriginalFilename();
			log.info("----------------------------------------------------------");
			log.info("upload File Name : " + fileName);
			log.info("upload File Size : " + multipartFile.getSize());

			File saveFile = new File(uploadFolder, fileName);
			
			
			JsonObject jsonObject = new JsonObject();
			try {
				multipartFile.transferTo(saveFile);
				jsonObject.addProperty("msg", "success file uploaded-" + multipartFile.getOriginalFilename());
				jsonObject.addProperty("src", srcPath + multipartFile.getOriginalFilename());
				
				// 파일을 집어넣으면 뷰어인지 사진인지 확인하는 절차 둘다 아니면 text로 결정됨
				String type = "";
				if (fileName.endsWith(".zip")) {
					String unZipPath = uploadFolder + "/";
					// 사용자가 업로드한 파일을 압축풀기
					UnZipTool.main(unZipPath, fileName, unZipPath);
					Path deleteZipPath = Paths.get(uploadFolder + "/" + fileName);
					// 사용자가 업로드한 파일을 압축해제한 이후 남은 zip 파일을 삭제
					DeleteFile.deleteFile(deleteZipPath);
					type = "viewer";
					System.out.println(" 타입은 ? " + type);
					System.out.println(" 이름은 ? " + multipartFile.getOriginalFilename().replace(".zip",""));
				} else if (fileName.endsWith(".png") || fileName.endsWith(".jpg") || fileName.endsWith(".jpeg")) {
					type = "image";
					System.out.println(" 타입은 ? " + type);
					System.out.println(" 이름은 ? " + multipartFile.getOriginalFilename());
				}
				
				System.out.println(multipartFile.getOriginalFilename());
				System.out.println(type);
				
				String contents = multipartFile.getOriginalFilename();
				
				service.insertBoardContents(contents, type, 0);

			} catch (Exception e) {
				log.error(e.getMessage());
				jsonObject.addProperty("msg", "fail file uploaded-" + fileName);
			}
			jsonArray.add(jsonObject);
		}
		return new Gson().toJson(jsonArray);
	}

	@GetMapping("marzipanoViewer")
	public String viewTest(@RequestParam(name = "viewerPath") String fileName, Model model) {
		log.info("뷰어도착");
		log.info(fileName);
		model.addAttribute("viewerPath", fileName);
		return "marzipanoViewer";
	}

	
	// 파일 삭제하는 곳
	@GetMapping("deletePicture")
	public String deletePicture() {

		// 마지막에 폴더명만 페이지에서 받기 ?????? b_no ??????
		String path = "C:/STS/workspace/ToLive/src/main/webapp/resources/TripToLive/board_contents/marzipanoSubmitTest - 복사본 (6)";

		// 사진이 저장된 폴더를 삭제 최상위폴더 / 삭제할 폴더
		DeleteFile.deleteFile(path);

		// 삭제된 폴더의 정보를 db에서 삭제
		// 받아온 b_no 에 해당하는 파일을 삭제 ?? b_no 폴더 자체를 삭제하는 방향으로 ??

		log.info("내가 삭제할 파일?" + " 폴더가 삭제되었습니다.");

		return "marzipanoUploadTest";
	}

	@GetMapping("marzipanoTool")
	public String toolIndex() {
		return "marzipanoTool";
	}
	

}
