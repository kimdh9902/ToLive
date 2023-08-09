package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.BoardContentsVO;

public interface BoardContentsMapper {
	
	// 최종적으로 글쓰기 버튼을 누르는 순간에 내용을 입력받을거임 수정이 필요? 없을듯
	// DB에 컨텐츠의 내용을 넣기 넣을때는 반복문을 돌려서 넣기
	int insertBoardContents(@Param("contents")String contents,@Param("type")String type,@Param("contents_no")int contents_no );
	// DB에서 컨텐츠의 내용을 읽어오기
	BoardContentsVO selectBoardContents( int b_no );
	
	int selectCount(int b_no);
	// 컨텐츠의 내용을 업데이트 하기 // 수정과 글쓰기 부분 모두 같은 페이지의 같은 부분에 영향을 줘야한다고 생각
	// attach ?? 화면에 있는 내용을 기반으로 테이블에 입력할수 있도록 조정 ???
	// int updateBoardContents( BoardContentsVO vo);
	// 컨텐츠를 삭제해야됨 원래있던 맵퍼와 상호작용 ?? 혹은 그냥 여기서 모든 것을 한번에 처리할수도 ??
	// 글쓰기 버튼이 눌린 순간 db삭제 - 페이지 읽기 - 읽은 내용을 db에 저장 !!!!!
	boolean deleteBoardContents( int b_no );
		
}
