package ams.ggc.common.orm;

import ams.ggc.common.NEWS.NewsDAO;
import ams.ggc.common.NEWS.NewsDAOInterface;
import ams.ggc.common.User.UserDAO;
import ams.ggc.common.User.UserDAOInterface;
import ams.ggc.common.order.OrderDAO;
import ams.ggc.common.order.OrderDAOInterface;
import ams.ggc.common.product.ProductDAO;
import ams.ggc.common.product.ProductDAOInterface;



public class SellDAOManager {
	
	static NewsDAOInterface _newsDAOInterface ;
	static OrderDAOInterface _orderDAOInterface ;
	static UserDAOInterface _userDAOInterface ;
	static ProductDAOInterface _productDAOInterface ;
	
	public static ProductDAOInterface getProductDAOInterface(){
		if (_productDAOInterface == null) {
			_productDAOInterface = new ProductDAO();
		}
		return _productDAOInterface; 
	}
	
	public static UserDAOInterface getUserDAOInterface(){
		if (_userDAOInterface == null) {
			_userDAOInterface = new UserDAO();
		}
		return _userDAOInterface; 
	}
	
	public static NewsDAOInterface getNewsDAOInterface(){
		if (_newsDAOInterface == null) {
			_newsDAOInterface = new NewsDAO();
		}
		return _newsDAOInterface; 
	}
	
	public static OrderDAOInterface getOrderDAOInterface(){
		if (_orderDAOInterface == null) {
			_orderDAOInterface = new OrderDAO();
		}
		return _orderDAOInterface; 
	}
	
	
}