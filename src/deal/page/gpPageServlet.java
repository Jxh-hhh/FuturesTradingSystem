package deal.page;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import deal.daoimpl.GpDaoImpl;
import deal.daoimpl.PageDaoImpl;
import deal.entity.Page;
import deal.entity.gp;

/**
 * Servlet implementation class gpPageServlet
 */
@WebServlet("/gpPageServlet")
public class gpPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public gpPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  request.setCharacterEncoding("UTF-8");
		  System.out.println("welcome");
		  //获取当前页数，首次进入时start为0，点击超链接时获取start页数
		  int start=request.getParameter("start")==null?0:Integer.parseInt(request.getParameter("start"));
		  //通过page实现类获得总页数，这里的3为每页数目
		  int pageSize=3;
		  PageDaoImpl pg=new PageDaoImpl();
		  int totalPage=pg.getTotalPage(pageSize); 
		  //前一页页数、后一页变量值
		  int prePage=start-1>0?start-1:start+1;
		  int nextPage=start+1<totalPage?start+1:totalPage-1;
		  //使用request.setAttribute方法便于页面中使用el语法
		  request.setAttribute("totalPage", totalPage);
		  request.setAttribute("prePage", prePage); 
		  request.setAttribute("nextPage", nextPage);
		  //获得当前页的数据
		  Page pg1=new Page(start,pageSize); 
		  GpDaoImpl gp =new GpDaoImpl();
		  try {
			List<gp> currentgp=(List<gp>)gp.queryGpByPage(pg1);
			 request.setAttribute("gpList", currentgp);
			 request.getRequestDispatcher("index.jsp").forward(request, response);
		   } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		  }
	}

}
