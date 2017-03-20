package ams.ggc.business;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import ams.ggc.common.*;
import ams.ggc.common.tools.BusinessManagerSuper;
import ams.ggc.common.tools.MD5Encryptor;

import com.mysql.jdbc.Connection;

public class UserBusinessManager extends BusinessManagerSuper {
	private Connection cn = super.cn();
	
	public boolean register(UserENT u, String type) {
	try {
		PreparedStatement ps;
		if("real".equalsIgnoreCase(type)){
			ps = cn.prepareStatement("insert into realuser values(?,?,?,?,?,?,?,?,?,?,?)");
			RealUserENT ent = u.getRealUserENT(); 
			ps.setString(1, ent.getName());
			ps.setString(2, ent.getFamilyName());
			ps.setString(3, ent.getTel());
			ps.setString(4, ent.getAddress());
			ps.setString(5, ent.getEmailAddress());
			ps.setString(6, u.getUserName());
			ps.setString(7, ent.getWebSiteAddress());
			ps.setString(8, ent.getNationalID());
			ps.setString(9, ent.getFaxNo());
			ps.setString(10, ent.getDob());
			ps.setString(11, ent.getOccupation());
		}else{
			ps = cn.prepareStatement("insert into legaluser values(?,?,?,?,?,?,?,?)");
			CompanyUserENT ent = u.getCompanyUserENT(); 
			ps.setString(1, ent.getCompanyName());
			ps.setString(2, ent.getEconomicNumber());
			ps.setString(3, ent.getTel());
			ps.setString(4, ent.getWebSiteAddress());
			ps.setString(5, ent.getEmailAddress());
			ps.setString(6, ent.getAddress());
			ps.setString(7, u.getUserName());
			ps.setString(8, ent.getFaxNo());
			u.setCompany(true);
		}
		PreparedStatement ps2 = cn.prepareStatement("insert into user values(?,?,?,?,?)");
		ps2.setString(1, u.getUserName());
		ps2.setString(2, MD5Encryptor.encode(u.getPassword()));
		ps2.setBoolean(3, u.getIsConfirmed());
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
		ps2.setString(4, dateFormat.format(calendar.getTime()));
		ps2.setBoolean(5, u.isCompany());
		ps2.execute();
		ps.execute();
		ps.close();
		ps2.close();
		cn.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	return true;
	}
	public boolean checkUsernameValidity(String userName){
		PreparedStatement ps;
		try {
			ps = cn.prepareStatement("SELECT count( * ) as totalItems FROM user where username = ?");
			ps.setString(1, userName);
			ResultSet rs = ps.executeQuery();
			int i = 0;
			while (rs.next()) {
				i = rs.getInt("totalItems");
			}
			ps.close();
			rs.close();
			cn.close();
			if(i>0)
				return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	public UserLST getUserLST(UserLST lst) {
		ArrayList<UserENT> userENTs = new ArrayList<UserENT>();
		try {
			PreparedStatement ps;
			ps=cn.prepareStatement("SELECT count( * ) as totalItems FROM user");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				lst.setTotalItems(rs.getInt("totalItems"));
			}
			ps=cn.prepareStatement("call GetUsers(?,?,?)");
			ps.setString(1, "%"+lst.getKeyword()+"%");
			ps.setInt(2, lst.getFirst());
			ps.setInt(3, lst.getPageSize());
			rs = ps.executeQuery();
			while (rs.next()) {
				UserENT userENT = new UserENT();
				userENT.setUserName(rs.getString("username"));
				userENT.setConfirmed(rs.getBoolean("isconfirmed"));
				userENT.setDate(rs.getString("date"));
				userENT.setCompany(rs.getBoolean("isLegal"));
				userENTs.add(userENT);
			}
			lst.setUserENTs(userENTs);
			rs.close();
			ps.close();
			cn.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return lst;
	}
	
	public ArrayList<RoleENT> getRolesList() {
		ArrayList<RoleENT> roleENTs = new ArrayList<RoleENT>();
		try {
			PreparedStatement ps;
			ps=cn.prepareStatement("SELECT  * FROM role");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				RoleENT roleENT = new RoleENT();
				roleENT.setEname(rs.getString("englishName"));
				roleENT.setFname(rs.getString("farsiName"));
				roleENTs.add(roleENT);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return roleENTs;
	}
	public UserENT getUserENT(String username) {
		UserENT userENT = new UserENT();
		PreparedStatement ps;
		try {
			ps=cn.prepareStatement("SELECT * FROM user where username = ?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				userENT.setUserName(rs.getString("username"));
				userENT.setPassword(rs.getString("password"));
				userENT.setConfirmed(rs.getBoolean("isconfirmed"));
				userENT.setDate(rs.getString("date"));
				userENT.setCompany(rs.getBoolean("isLegal"));
			}
			ArrayList<RoleENT> roleENTs = new ArrayList<RoleENT>();
			ps=cn.prepareStatement("SELECT * FROM userrole where username = ?");
			ps.setString(1, username);
			rs = ps.executeQuery();
			while (rs.next()) {
				RoleENT ent = new RoleENT();
				ent.setEname(rs.getString("role"));
				roleENTs.add(ent);
			}
			userENT.setRoleENTs(roleENTs);
			if(userENT.isCompany()){
				ps=cn.prepareStatement("SELECT * FROM legaluser where username = ?");
				ps.setString(1, username);
				rs = ps.executeQuery();
				CompanyUserENT ent = new CompanyUserENT();
				while (rs.next()) {
					ent.setAddress(rs.getString("address"));
					ent.setCompanyName(rs.getString("companyName"));
					ent.setEconomicNumber(rs.getString("economicNumber"));
					ent.setTel(rs.getString("tel"));
					ent.setEmailAddress(rs.getString("email"));
					ent.setWebSiteAddress(rs.getString("website"));
					ent.setFaxNo(rs.getString("faxNo"));
					userENT.setCompanyUserENT(ent);
				}
			}else{
				ps=cn.prepareStatement("SELECT * FROM realuser where username = ?");
				ps.setString(1, username);
				rs = ps.executeQuery();
				RealUserENT ent = new RealUserENT();
				while (rs.next()) {
					ent.setName(rs.getString("name"));
					ent.setFamilyName(rs.getString("familyName"));
					ent.setTel(rs.getString("tel"));
					ent.setAddress(rs.getString("address"));
					ent.setEmailAddress(rs.getString("email"));
					ent.setWebSiteAddress(rs.getString("website"));
					ent.setNationalID(rs.getString("nationalID"));
					ent.setFaxNo(rs.getString("faxNo"));
					ent.setDob(rs.getString("dob"));
					ent.setOccupation(rs.getString("occupation"));
					userENT.setRealUserENT(ent);
				}
			}
			rs.close();
			ps.close();
			cn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return userENT;
	}
	public void submitRoles(String[] roles, String username) {
		PreparedStatement ps;
		try {
			ps=cn.prepareStatement("delete FROM userrole where username = ?");
			ps.setString(1, username);
			ps.execute();
			ps = cn.prepareStatement("insert into userrole values (?,?)");
			for (int i = 0 ; i < roles.length ; i ++){
				ps.setString(1, username);
				ps.setString(2, roles[i]);
				ps.execute();
			}
			ps.close();
			cn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public UserENT updateUser(UserENT u){
		PreparedStatement ps;
		try{
			PreparedStatement ps2 = cn.prepareStatement("update user set isconfirmed = ? where username = ?");
			ps2.setBoolean(1, u.getIsConfirmed());
			ps2.setString(2, u.getUserName());
			ps2.execute();
			ps2.close();
			cn.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
			u = null;
		}
		return u;
	}
	public UserENT login(UserENT userENT) {
		try {
			PreparedStatement ps;
			ps=cn.prepareStatement("SELECT  * FROM user where username like ? and password like ?");
			ps.setString(1, userENT.getUserName());
			ps.setString(2, userENT.getPassword());
			ResultSet rs = ps.executeQuery();
			String uName = userENT.getUserName();
			userENT = new UserENT();
			if (rs.next()) {
				userENT = this.getUserENT(uName);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return userENT;
	}
	
	public boolean security(String username,String roles){
		String[] role = roles.split(",");
		boolean stmt = false;
		try {
			PreparedStatement ps;
			ps=cn.prepareStatement("SELECT * FROM userrole where username = ? and role = ?");
			for (int i = 0 ; i < role.length ; i ++){
				ps.setString(1, username);
				ps.setString(2, role[i]);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					stmt = true;
				}
			}
			
			
		} catch (SQLException ex) {
			ex.printStackTrace();
		}	
		return stmt;
	}
}
