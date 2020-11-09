package deal.entity;

public class Page {
	 private int pageSize;
	 private int totalPage;  
	 private int Index;
    public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}	
	public int getIndex() {
		return Index;
	}
	public void setIndex(int index) {
		this.Index = index;
	}

   public Page() {
		super();
	}
	public Page(int Index, int pageSize) {
	 this.Index=Index;	 
	 this.pageSize=pageSize;
   } 
}