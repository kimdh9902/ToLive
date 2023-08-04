package com.spring.object;

import com.spring.service.UsersService;

public class PageMaker {

	private double totalCount;
	private Criteria cri;
	
	// prev  <
	// next  >
	// start Page
	// end Page
	
	private boolean prev;
	private boolean next;
	private int startPage;  	//1
	private int endPage; 		// 100, 10
	private int realEndPage;	// 34
	private int displayPageAmount; // dpa:5 = prev 1~5 next , dpa = 10 prev 1~10 next
	
	/* ex.게시글 350, displayPageAmount 10, cri.amount 10
	 case 1 startpage  1, endPage 10 : 1~100
	 case 2 startpage 11, endPage 20 : 101~200
	 case 3 startpage 21, endPage 30 : 201~300
	 case 4 startpage 31, endPage 35 : 301~350  */
	/* ex.게시글 339, displayPageAmount 10, cri.amount 5
	 case 1 startpage  1, endPage 10 : 1~50
	 case 2 startpage 11, endPage 20 : 51~100
	 case 3 startpage 21, endPage 30 : 101~150
	 case 4 startpage 31, endPage 40 : 151~200 
	 case 5 startpage 41, endPage 50 : 201~250
	 case 6 startpage 51, endPage 65 : 251~300
	 case 7 startpage 61, endPage 70 : 301~350, endPage70, realEndpage 68  */
	
	/* endPage 계산 
	  pageNum =  8 ->  71~80, case1 endPage 10
	  pageNum = 12 -> 111~20, case2 endPage 20
	  pageNum = 32 -> case4, endPage 40 -> realEndPage 34 -> endPage = realendPage;
	  ex. 8 -> 8 / displayPageAmount -> 1 *displayPageAmount 
	  339 / cri.amount 페이지당 10개씩, 339 / 10 -> 33.9 -> 34, 31~34  */
	
	// 4 * 1.0 / 10 = 0.4, 1 * 10 -> 10
	// display 5, 4.0 / 5, 0.8 = 1.0 * 5 > 5
	
	//10,  1  endPage - (displayPageAmount - 1) = 1
	//20, 11  20 - (displayPageAmount - 1) = 11
	//30, 21
	
	public PageMaker(Criteria cri, int totalCount) {
		this.cri = cri;
		this.totalCount = totalCount;
		this.displayPageAmount = 10;
		this.init();
	}
	

	public void init() {

//		this.endPage = (int)Math.ceil((cri.getPageNum() * 1.0) / this.displayPageAmount) * this.displayPageAmount;
		this.endPage = (int)Math.ceil((cri.getPageNum() * 1.0) / this.displayPageAmount) * this.displayPageAmount;

		this.realEndPage = (int)Math.ceil (this.totalCount / cri.getAmount() );
		System.out.println("####################");
		System.out.println("totalCount - ? "+totalCount);
		System.out.println("cri.getAmount() - ? "+cri.getAmount());
		System.out.println("realEndPage - ? "+realEndPage);
		System.out.println("endPage - ? "+endPage);
		System.out.println("####################");
		this.startPage = this.endPage - (displayPageAmount - 1);	
		
		if (this.endPage > this.realEndPage) {
			this.endPage = this.realEndPage;
		}

		// System.out.println("startPage - " + this.startPage);
		prev = startPage > 1 && startPage > displayPageAmount;
		next = endPage < realEndPage;
	}
	

	public double getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(double totalCount) {
		this.totalCount = totalCount;
		init();
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
		init();
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getDisplayPageAmount() {
		return displayPageAmount;
	}

	public void setDisplayPageAmount(int displayPageAmount) {
		this.displayPageAmount = displayPageAmount;
		this.init();
	}
	

	@Override
	public String toString() {
		return "startPage=" + startPage + ", endPage=" + endPage
				+", realEndPage=" + realEndPage
				+", prev=" + prev +"next=" + next
				+", cri.amount="+cri.getAmount()
				+", displayNum="+displayPageAmount;	
				}


	public static void main(String[] args) {
		/*
		double realEndPage = (int) Math.ceil(339*1.0/5);
		System.out.println(realEndPage);
		System.out.println(); */
		
		Criteria cri = new Criteria(6, 10); // 현재페이지, 한 페이지당 출력 개수
		PageMaker pageMaker = new PageMaker(cri, 100); // cri, totalCount=100;
		pageMaker.setDisplayPageAmount(5);
		System.out.println(pageMaker);
		
		
		cri.setPageNum(4);
		cri.setAmount(10);
		
		
		System.out.println(pageMaker);
		pageMaker.setDisplayPageAmount(5);
		System.out.println(pageMaker);
		
		System.out.println(pageMaker.isPrev());
		for(int i = pageMaker.getStartPage(); i <= pageMaker.getEndPage(); i++) {
			System.out.println( i + "\t");
		}
		System.out.println("\t"+pageMaker.isNext());
		
		cri.setPageNum(10);
		cri.setAmount(6);
		pageMaker.setCri(cri);
		System.out.println(pageMaker);
		

	}

}
