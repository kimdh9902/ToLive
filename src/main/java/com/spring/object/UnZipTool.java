package com.spring.object;

//import zipUtil.CompressZip;


public class UnZipTool {
	public static void main(String zipPath, String zipFile, String unZipPath ) {

//		압축 파일 위치와 압축된 파일
//		zipPath = "C:/STS/download/";
//		zipFile = "ocean01.zip";

//	 	압축을 해제할 위치, 압축할 파일이름
//		unZipPath = "C:/STS/download/";
//		unZipFile = "ocean01";

		System.out.println("--------- 압축 해제 ---------");
		UnZip unZip = new UnZip();
		
		// 압축 해제 
		if (!unZip.unZip(zipPath, zipFile, unZipPath)) {
			System.out.println("압축 해제 실패");
			
		}
	}
}