package com.ggc.business;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ggc.Classes.OrderENT;
import com.ggc.Classes.OrderLST;
import com.ggc.Classes.UserENT;
import com.ggc.Classes.UserLST;
import com.ggc.Classes.tools.BusinessManagerSuper;
import com.mysql.jdbc.Connection;

public class orderBusinessManager extends BusinessManagerSuper {
	private Connection cn = super.cn();
	public OrderLST getOrderLST(OrderLST lst) {
		ArrayList<OrderENT> orderENTs = new ArrayList<OrderENT>();
		try {
			PreparedStatement ps;
			ps=cn.prepareStatement("call GetOrdersTotalRows(?,?,?)");
			ps.setString(1, "%"+lst.getKeyword()+"%");
			ps.setString(2, "%"+lst.getProductname()+"%");
			ps.setString(3, "%"+lst.getUsername()+"%");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				lst.setTotalItems(rs.getInt("totalItems"));
			}
			ps=cn.prepareStatement("call GetOrders(?,?,?,?,?)");
			ps.setString(1, "%"+lst.getKeyword()+"%");
			ps.setString(2, "%"+lst.getProductname()+"%");
			ps.setString(3, "%"+lst.getUsername()+"%");
			ps.setInt(4, lst.getFirst());
			ps.setInt(5, lst.getPageSize());
			rs = ps.executeQuery();
			while (rs.next()) {
				OrderENT orderENT = new OrderENT();
				orderENT.setUsername(rs.getString("username"));
				orderENT.setStatus(rs.getString("status"));
				orderENT.setDateTime(rs.getString("date"));
				orderENT.setProduct(rs.getString("productname"));
				orderENT.setOrderId(rs.getInt("orderID"));
				orderENT.setSize(rs.getString("size"));
				orderENT.setThickness(rs.getString("thickness"));
				orderENT.setAmount(rs.getString("amount"));
				orderENT.setPacking(rs.getBoolean("packing"));
				orderENT.setOperator(rs.getString("operator"));
				orderENTs.add(orderENT);
			}
			lst.setOrderENTs(orderENTs);
			rs.close();
			ps.close();
			cn.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return lst;
	}
	
	public OrderENT saveOrder(OrderENT ent){
		try {
			PreparedStatement ps;
			ps = cn.prepareStatement("insert into orders (ordertext, productname, username, date, status, size, amount, thickness, packing) values(?,?,?,?,?,?,?,?,?)");
			ps.setString(1, ent.getContext());
			ps.setString(2, ent.getProduct());
			ps.setString(3, ent.getUsername());
			ps.setString(4, ent.getDateTime());
			ps.setString(5, ent.getStatus());
			ps.setString(6, ent.getSize());
			ps.setString(7, ent.getAmount());
			ps.setString(8, ent.getThickness());
			ps.setBoolean(9, ent.getPacking());
			ps.execute();
			ps = cn.prepareStatement("SELECT LAST_INSERT_ID() as resultset");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ent.setOrderId(rs.getInt("resultset"));
			}
			ps.close();
			cn.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
				return null;
			}
		return ent;
	}

	public OrderENT getOrderENT(OrderENT orderENT) {
		try {
			PreparedStatement ps;
			if(orderENT.getOperator()!=null){
				ps = cn.prepareStatement("update orders set status = 'در حال بررسی', operator = ? where orderID = ?");
				ps.setString(1, orderENT.getOperator());
				ps.setInt(2, orderENT.getOrderId());
				ps.execute();
			}			
			ps=cn.prepareStatement("select * from orders where orderID = ?");
			ps.setInt(1, orderENT.getOrderId());
			ResultSet rs = ps.executeQuery();
			rs = ps.executeQuery();
			while (rs.next()) {
				orderENT.setUsername(rs.getString("username"));
				orderENT.setStatus(rs.getString("status"));
				orderENT.setDateTime(rs.getString("date"));
				orderENT.setProduct(rs.getString("productname"));
				orderENT.setOrderId(rs.getInt("orderID"));
				orderENT.setSize(rs.getString("size"));
				orderENT.setAmount(rs.getString("amount"));
				orderENT.setThickness(rs.getString("thickness"));
				orderENT.setOperator(rs.getString("operator"));
				orderENT.setContext(rs.getString("ordertext"));
				orderENT.setPacking(rs.getBoolean("packing"));
			}
			rs.close();
			ps.close();
			cn.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return orderENT;
	}

	public void updateStatus(int orderId) {
		try {
			PreparedStatement ps;
			ps = cn.prepareStatement("update orders set status = 'حذف شده' where orderID = ?");
			ps.setInt(1, orderId);
			ps.execute();
			ps.close();
			cn.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
	}

	public void deleteOrder(int orderId) {
		try {
			PreparedStatement ps;
			ps = cn.prepareStatement("delete from orders where orderID = ?");
			ps.setInt(1, orderId);
			ps.execute();
			ps.close();
			cn.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
	}

}
