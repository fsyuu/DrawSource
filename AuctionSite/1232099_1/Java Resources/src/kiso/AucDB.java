package kiso;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.*;
import java.util.Date;
import java.text.*;

/**
 * Servlet implementation class AucDB
 */
@WebServlet("/AucDB")
public class AucDB extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String url = "jdbc:mysql://localhost/db1232099?useUnicode=true&characterEncoding=UTF-8";
    String user = "root";
    String pass = "pass";
    
    public AucDB() throws ClassNotFoundException{
        super();
        Class.forName("org.gjt.mm.mysql.Driver");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(Connection con = DriverManager.getConnection(url, user, pass);
				Statement stmt = con.createStatement()){
				request.setCharacterEncoding("UTF-8");
				response.setCharacterEncoding("UTF-8");
				String command = request.getParameter("command");
				
				
//--------------------------------------------------------------------------------------------------------------------------------------//
//--------------------------------------------------commandゾーン(判別)------------------------------------------------------------------//

				if(command==null){
					request.getRequestDispatcher("11/welAuc.jsp").forward(request, response);
				}
				else if(command.equals("details")){
					String bidID = request.getParameter("num");
					String ID = request.getParameter("ID");
					ArrayList<Auction> rList = selectUser(stmt, ID);
					request.setAttribute("rlist", rList);
					ArrayList<Auction> resultList = selectDetails(stmt, bidID);
					request.setAttribute("list", resultList);
					request.getRequestDispatcher("11/details.jsp").forward(request, response);
				}
				else if(command.equals("mypage") || command.equals("マイページ")){
					String ID = request.getParameter("ID");
					ArrayList<Auction> rList = selectUser(stmt, ID);
					request.setAttribute("rlist", rList);
					request.getRequestDispatcher("11/mypage/mypage.jsp").forward(request, response);
				}
				else if(command.equals("notback")){
					String ID = request.getParameter("ID");
					ArrayList<Auction> rList = selectUser(stmt, ID);
					request.setAttribute("rlist", rList);
					request.getRequestDispatcher("11/result4.jsp").forward(request, response);
				}
				else if(command.equals("top")){
					String ID = request.getParameter("ID");
					ArrayList<Auction> rList = selectUser(stmt, ID);
					ArrayList<Auction> resultList = selectAll(stmt);
					request.setAttribute("rlist", rList);
					request.setAttribute("list", resultList);
					request.getRequestDispatcher("11/result2.jsp").forward(request, response);
				}
				else if(command.equals("完了")){
					String ID = request.getParameter("ID");
					String password = request.getParameter("password");
					String user = request.getParameter("user");
					String name = request.getParameter("name");
					String gender = request.getParameter("gender");
					if(gender.equals("0")) gender = "男";
					else gender = "女";
					String barth = request.getParameter("barth");
					String address = request.getParameter("address");
					
					ArrayList<Auction> conList = selectUser(stmt, ID);
					
					if(conList.size()>0){
						request.getRequestDispatcher("11/Accerr2.jsp").forward(request, response);
					}else{
						String sql = "INSERT INTO `ユーザ情報`(`ID`, `password`, `user`, `name`, `gender`, `barth`, `address`) VALUES('"+ID+"', '"+password+"', '"+user+"', '"+name+"', '"+gender+"', '"+barth+"', '"+address+"')";
						int n = stmt.executeUpdate(sql);
						request.setAttribute("num", n);
						
						ArrayList<Auction> rList = selectUser(stmt, ID);
						request.setAttribute("rlist", rList);
						request.getRequestDispatcher("11/entry.jsp").forward(request, response);
					}
				}
				else if(command.equals("検索")){
					String group = request.getParameter("search1");
					String item = request.getParameter("search2");
					String ID = request.getParameter("ID");
					
					ArrayList<Auction> rList = selectUser(stmt, ID);
					ArrayList<Auction> resultList = selectSearch(stmt, group, item);
					request.setAttribute("rlist", rList);
					
					if(group.equals("all")) group = "すべて";
					if(item.equals("")) item = "すべて";
					
					request.setAttribute("group", group);
					request.setAttribute("item", item);
					if(resultList.size()>0){
						request.setAttribute("list", resultList);
						request.getRequestDispatcher("11/result3.jsp").forward(request, response);
					}else{
						request.getRequestDispatcher("11/Accerr3.jsp").forward(request, response);
					}
				}
				else if(command.equals("出品")){
					String ID = request.getParameter("ID");
					String user = request.getParameter("user");
					String item = request.getParameter("item");
					String group = request.getParameter("group");
					String fprice = request.getParameter("fprice");
					String eprice = request.getParameter("eprice");
					
					String head = head(group);
					String bidID = selectCnt(stmt, group, head);
					
					int m = disp(stmt, eprice, bidID, user, item, group, fprice);
					request.setAttribute("num", m);
					
					ArrayList<Auction> rList = selectUser(stmt, ID);
					request.setAttribute("rlist", rList);
					
					request.getRequestDispatcher("11/notback.jsp").forward(request, response);
				}
				else if(command.equals("出品する")){
					String ID = request.getParameter("ID");
					ArrayList<Auction> rList = selectUser(stmt, ID);
					request.setAttribute("rlist", rList);
					request.getRequestDispatcher("11/mypage/display.jsp").forward(request, response);
				}
				else if(command.equals("出品したもの")){
					String ID = request.getParameter("ID");
					String user = request.getParameter("user");
					ArrayList<Auction> rList = selectUser(stmt, ID);
					request.setAttribute("rlist", rList);
					ArrayList<Auction> resultList = selectDisplayed(stmt, user);
					request.setAttribute("list", resultList);
					request.getRequestDispatcher("11/mypage/displayed.jsp").forward(request, response);
				}
				else if(command.equals("次へ")){
					String ID = request.getParameter("ID");
					String password = request.getParameter("password");
					ArrayList<Auction> rList = selectMember(stmt, ID, password);
					request.setAttribute("rlist", rList);
					
					if(rList.size()>0){
						ArrayList<Auction> resultList = selectAll(stmt);
						request.setAttribute("list", resultList);
						request.getRequestDispatcher("11/result2.jsp").forward(request, response);
					}else{
						request.getRequestDispatcher("11/Accerr.jsp").forward(request, response);
					}
				}
				else if(command.equals("入札")){
					String bidID = request.getParameter("bidID");
					String money = request.getParameter("money");
					String ID = request.getParameter("ID");
					String user = request.getParameter("user");
					String bidcount = request.getParameter("bidcount");
					
					String sql = "UPDATE オークション SET price='"+money+"',bidcount="+bidcount+"+1,maxuser='"+user+"' WHERE bidID='"+bidID+"'";
					int n = stmt.executeUpdate(sql);
					request.setAttribute("num", n);
					
					ArrayList<Auction> rList = selectUser(stmt, ID);
					
					request.setAttribute("rlist", rList);
					request.getRequestDispatcher("11/notback.jsp").forward(request, response);
				}
				else if(command.equals("入札中")){
					String ID = request.getParameter("ID");
					String user = request.getParameter("user");
					ArrayList<Auction> rList = selectUser(stmt, ID);
					ArrayList<Auction> resultList = selectMybid(stmt, user);
					request.setAttribute("rlist", rList);
					request.setAttribute("list", resultList);
					request.getRequestDispatcher("11/mypage/bidding.jsp").forward(request, response);
				}
				else if(command.equals("落札分")){
					String ID = request.getParameter("ID");
					String user = request.getParameter("user");
					ArrayList<Auction> rList = selectUser(stmt, ID);
					request.setAttribute("rlist", rList);
					ArrayList<Auction> resultList = selectTender(stmt, user);
					request.setAttribute("list", resultList);
					request.getRequestDispatcher("11/mypage/won.jsp").forward(request, response);
				}
//---------------------------------------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------------------------------------//
				
		}catch(Exception e){
			throw new ServletException(e);
		}
	}
	
	private String head(String group){
		String head = "";
		if(group.equals("ファッション"))					head = "F";
		else if(group.equals("アクセサリー"))			head = "A";
		else if(group.equals("食品"))					head = "E";
		else if(group.equals("飲料"))					head = "D";
		else if(group.equals("パソコン・周辺機器"))		head = "C";
		else if(group.equals("TV・オーディオ・カメラ"))	head = "T";
		else if(group.equals("家電"))					head = "K";
		else if(group.equals("音楽"))					head = "M";
		else if(group.equals("スポーツ"))				head = "S";
		else if(group.equals("アウトドア"))				head = "O";
		else if(group.equals("インテリア"))				head = "I";
		else if(group.equals("日用品雑貨"))				head = "N";
		else if(group.equals("ペット用品"))				head = "P";
		else if(group.equals("おもちゃ・ゲーム"))		head = "G";
		else if(group.equals("本"))						head = "H";
		else if(group.equals("車・バイク"))				head = "B";

		return head;
	}
	
	private String timeshift(String time){
		String retime = "";
		for(int i=0; i < time.length(); i++){
			if(time.charAt(i) == '.'){
				break;
			}
			else if(time.charAt(i) == '-'){
				retime += "/";
			}
			else{
				retime += time.charAt(i);
			}
			
			/*if(time.charAt(i) == '.'){
				retime += "秒";
				break;
			}
			else if(time.charAt(i) == '-'){
				if(cnt == 0) retime += "年";
				else if(cnt == 1) retime += "月";
				cnt++;
			}
			else if(time.charAt(i) == ' ' && cnt == 2){
				retime += "日 ";
			}
			else if(time.charAt(i) == ':'){
				if(cnt == 2) retime += "時";
				else if(cnt == 3) retime += "分";
				cnt++;
			}
			else{
				retime += time.charAt(i);
			}*/
		}
		
		return retime;
	}
	

	
//-------------------------------------------------------入札のリスト群-------------------------------------------------------------------//
	
	private int disp(Statement stmt, String eprice, String bidID, String user, String item, String group, String fprice) throws SQLException{
		String sql = "";
		
		if(eprice==""){
			sql = "INSERT INTO オークション(bidID, user, item, `group`, fprice, price) VALUES ('"+bidID+"', '"+user+"', '"+item+"', '"+group+"', "+fprice+", "+fprice+")";
		}else{
			sql = "INSERT INTO オークション(bidID, user, item, `group`, fprice, price, eprice) VALUES ('"+bidID+"', '"+user+"', '"+item+"', '"+group+"', "+fprice+", "+fprice+", "+eprice+")";
		}
		int n = stmt.executeUpdate(sql);
		
		String sql2 = "UPDATE オークション SET ftimes = times, etimes = times + INTERVAL 7 DAY  WHERE bidID='"+bidID+"'";
		int m = stmt.executeUpdate(sql2);
		
		return m;
	}
	
	private String selectCnt(Statement stmt, String group, String head) throws SQLException{
		String sql = "select * from オークション WHERE `group` = '"+group+"'";
		String bidID = head;
		int cnt = 0;
		
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {
			cnt++;
		}
		for(int i=9; i>String.valueOf(cnt).length(); i--){
			bidID += "0";
		}
		bidID += cnt;
		
		return bidID;
	}
	
	private ArrayList<Auction> selectAll(Statement stmt) throws SQLException, ParseException{
		String sql = "select * from オークション where (price < eprice AND CURRENT_TIMESTAMP < etimes ) OR (eprice = '-' AND CURRENT_TIMESTAMP < etimes)";
		ResultSet rs = stmt.executeQuery(sql);
		ArrayList<Auction> resultList = new ArrayList<Auction>();
		while(rs.next()) {
			Auction A = new Auction();
			A.setBidID(rs.getString("bidID"));
			A.setItem(rs.getString("item"));
			A.setGroup(rs.getString("group"));
			A.setPrice(rs.getInt("price"));
			A.setEprice(rs.getString("eprice"));
			A.setBidcount(rs.getInt("bidcount"));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy'-'MM'-'dd' 'HH':'mm':'ss");
	        Date date = sdf.parse( rs.getString("etimes") );
			A.setEtimestamp(date.getTime());
			resultList.add(A);
		}
		return resultList;
	}
	
	private ArrayList<Auction> selectDetails(Statement stmt, String bidID) throws SQLException, ParseException{
		String sql = "SELECT * FROM オークション WHERE bidID = '"+bidID+"'";
		String maxuser;
		ResultSet rs = stmt.executeQuery(sql);
		ArrayList<Auction> resultList = new ArrayList<Auction>();
		while(rs.next()){
			Auction A = new Auction();
			A.setBidID(rs.getString("bidID"));
			A.setUser(rs.getString("user"));
			if(rs.getString("maxuser") != null) maxuser = rs.getString("maxuser")+"さん";
			else maxuser = "なし";
			A.setMaxuser(maxuser);
			A.setItem(rs.getString("item"));
			A.setGroup(rs.getString("group"));
			A.setBidcount(rs.getInt("bidcount"));
			A.setFprice(rs.getInt("fprice"));
			A.setPrice(rs.getInt("price"));
			A.setEprice(rs.getString("eprice"));
			A.setFtimes(timeshift(rs.getString("ftimes")));
			A.setEtimes(timeshift(rs.getString("etimes")));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy'-'MM'-'dd' 'HH':'mm':'ss");
	        Date date = sdf.parse( rs.getString("etimes") );
			A.setEtimestamp(date.getTime());
			
			resultList.add(A);
		}
		return resultList;
	}
	
	private ArrayList<Auction> selectDisplayed(Statement stmt, String user) throws SQLException, ParseException{
		String sql = "select * from オークション where user='"+user+"'";
		ResultSet rs = stmt.executeQuery(sql);
		ArrayList<Auction> resultList = new ArrayList<Auction>();
		while(rs.next()) {
			Auction A = new Auction();
			A.setBidID(rs.getString("bidID"));
			A.setItem(rs.getString("item"));
			A.setGroup(rs.getString("group"));
			A.setPrice(rs.getInt("price"));
			A.setEprice(rs.getString("eprice"));
			A.setBidcount(rs.getInt("bidcount"));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy'-'MM'-'dd' 'HH':'mm':'ss");
	        Date date = sdf.parse( rs.getString("etimes") );
			A.setEtimestamp(date.getTime());
			resultList.add(A);
		}
		return resultList;
	}
	
	private ArrayList<Auction> selectMybid(Statement stmt, String user) throws SQLException, ParseException{
		String sql = "SELECT * FROM オークション WHERE maxuser='"+user+"'";
		
		ResultSet rs = stmt.executeQuery(sql);
		ArrayList<Auction> resultList = new ArrayList<Auction>();
		while(rs.next()){
			Auction A = new Auction();
			A.setBidID(rs.getString("bidID"));
			A.setItem(rs.getString("item"));
			A.setGroup(rs.getString("group"));
			A.setPrice(rs.getInt("price"));
			A.setEprice(rs.getString("eprice"));
			A.setBidcount(rs.getInt("bidcount"));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy'-'MM'-'dd' 'HH':'mm':'ss");
	        Date date = sdf.parse( rs.getString("etimes") );
			A.setEtimestamp(date.getTime());
			resultList.add(A);
		}
			return resultList;
	}
	
	private ArrayList<Auction> selectSearch(Statement stmt, String group, String item) throws SQLException, ParseException{
		String sql;
		if(group.equals("all")){
			sql = "SELECT * FROM オークション WHERE item LIKE '%"+item+"%'";
		}else if(group.equals("")){
			sql = "SELECT * FROM オークション WHERE `group` = '"+group+"'";
		}else{
			sql = "SELECT * FROM オークション WHERE `group` = '"+group+"' AND item LIKE '%"+item+"%'";
		}
		
		ResultSet rs = stmt.executeQuery(sql);
		ArrayList<Auction> resultList = new ArrayList<Auction>();
		while(rs.next()){
			Auction A = new Auction();
			A.setBidID(rs.getString("bidID"));
			A.setItem(rs.getString("item"));
			A.setGroup(rs.getString("group"));
			A.setPrice(rs.getInt("price"));
			A.setEprice(rs.getString("eprice"));
			A.setBidcount(rs.getInt("bidcount"));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy'-'MM'-'dd' 'HH':'mm':'ss");
	        Date date = sdf.parse( rs.getString("etimes") );
			A.setEtimestamp(date.getTime());
			resultList.add(A);
		}
		return resultList;
	}
	private ArrayList<Auction> selectTender(Statement stmt, String user) throws SQLException, ParseException{
		String sql = "select * from オークション where maxuser='"+user+"' AND !((price < eprice AND CURRENT_TIMESTAMP < etimes ) OR (eprice = '-' AND CURRENT_TIMESTAMP < etimes))";
		ResultSet rs = stmt.executeQuery(sql);
		ArrayList<Auction> resultList = new ArrayList<Auction>();
		while(rs.next()) {
			Auction A = new Auction();
			A.setBidID(rs.getString("bidID"));
			A.setItem(rs.getString("item"));
			A.setGroup(rs.getString("group"));
			A.setPrice(rs.getInt("price"));
			A.setEprice(rs.getString("eprice"));
			A.setBidcount(rs.getInt("bidcount"));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy'-'MM'-'dd' 'HH':'mm':'ss");
	        Date date = sdf.parse( rs.getString("etimes") );
			A.setEtimestamp(date.getTime());
			resultList.add(A);
		}
		return resultList;
	}
	
//---------------------------------------------------------------------------------------------------------------------------------------//
	

//---------------------------------------------------ユーザ情報のリスト群----------------------------------------------------//
	private ArrayList<Auction> selectMember(Statement stmt, String ID, String password) throws SQLException{
		String sql = "SELECT * FROM ユーザ情報 WHERE ID = '"+ID+"'AND password = '"+password+"'";
		ResultSet rs = stmt.executeQuery(sql);
		ArrayList<Auction> rList = new ArrayList<Auction>();
		while(rs.next()){
			Auction A = new Auction();
			A.setUser(rs.getString("user"));
			A.setID(rs.getString("ID"));
			rList.add(A);
		}
		return rList;
	}
	
	private ArrayList<Auction> selectUser(Statement stmt, String ID) throws SQLException{
		String sql = "SELECT * FROM ユーザ情報 WHERE ID = '"+ID+"'";
		ResultSet rs = stmt.executeQuery(sql);
		ArrayList<Auction> rList = new ArrayList<Auction>();
		while(rs.next()){
			Auction A = new Auction();
			A.setID(rs.getString("ID"));
			A.setUser(rs.getString("user"));
			rList.add(A);
		}
		return rList;
	}
}
