package com.ggc.Classes;

import java.util.ArrayList;


public class OrderLST {

	ArrayList<OrderENT> orderENTs = new ArrayList<OrderENT>();
	private String keyword="";
	private int currentPage=0;
    private int totalPages;
    private int pageSize=20;
    private int totalItems;
	private int first;
	String username="";
	String productname="";
    
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	} 
	public ArrayList<OrderENT> getOrderENTs() {
		return orderENTs;
	}
	public void setOrderENTs(ArrayList<OrderENT> orderENTs) {
		this.orderENTs = orderENTs;
	}
	//sorting
    private Boolean isDescending ;
    private String sortedByField;
    
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}    
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
		calcPagingParameters();
	}
	
	
	public int getTotalItems() {
		return totalItems;
	}
	
	//public abstract int getTotalItems(AIPPagingParamInterface prm) ;
	
	
	public void setTotalItems(int totalItems) {
		this.totalItems = totalItems;
		calcPagingParameters();
	}
	
	public void setProperties(int totalItems,int currentPage,int pageSize){
		this.totalItems=totalItems;
		this.currentPage=currentPage;
		this.pageSize=pageSize;
		calcPagingParameters();
	}
	private void calcPagingParameters(){
		try{
		   int totalPage = getTotalItems()/getPageSize();
		   if(getTotalItems()%getPageSize()!=0)totalPage++;
			setTotalPages(totalPage);
			//check request page is exist
			if(getCurrentPage()<=0 || getCurrentPage()>totalPage){
				setCurrentPage(1);
			}
			setFirst((getCurrentPage()-1)*getPageSize());
			//first = ((getCurrentPage()-1)*getPageSize());
		}catch(Exception ex){
			
		}
	}

	public Boolean getIsDescending() {
		return isDescending;
	}
	public void setIsDescending(Boolean isDescending) {
		this.isDescending = isDescending;
	}
	public String getSortedByField() {
		return sortedByField;
	}
	public void setSortedByField(String sortedByField) {
		this.sortedByField = sortedByField;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getFirst() {
		return first;
	}
	public void setFirst(int first) {
		this.first = first;
	}	
}
