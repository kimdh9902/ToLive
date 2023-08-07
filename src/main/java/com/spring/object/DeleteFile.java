package com.spring.object;

import java.io.File;
import java.io.IOException;
import java.nio.file.DirectoryNotEmptyException;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Path;

public class DeleteFile {
	public static void deleteFile(Path deletePath) {

		// 다운로드 받은 zip을 삭제하는 메소드 파일을 업로드 할때 자동으로 실행됨
		
		try {
			// 파일 삭제
			Files.delete(deletePath);

		} catch (NoSuchFileException e) {
			System.out.println("삭제하려는 zip 파일이 없습니다");
		} catch (DirectoryNotEmptyException e) {
			System.out.println("디렉토리가 비어있지 않습니다");
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println("파일 삭제가 완료되었습니다.");
	}
	
	public static void deleteFile(String path) {
		
		// 다운받은 zip 파일을 압축해제한 폴더를 삭제하는 메소드 delete 문을 실행할때 실행됨
		
		File deleteFolder = new File(path);

		if(deleteFolder.exists()){
			File[] deleteFolderList = deleteFolder.listFiles();
			
			for (int i = 0; i < deleteFolderList.length; i++) {
				if(deleteFolderList[i].isFile()) {
					deleteFolderList[i].delete();
				}else {
					deleteFile(deleteFolderList[i].getPath());
				}
				deleteFolderList[i].delete(); 
			}
			deleteFolder.delete();
		}
	}
	
}
