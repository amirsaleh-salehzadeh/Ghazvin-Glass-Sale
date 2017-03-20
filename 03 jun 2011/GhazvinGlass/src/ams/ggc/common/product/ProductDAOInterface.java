package ams.ggc.common.product;

import ams.ggc.common.tools.AMSException;


public interface ProductDAOInterface {
	public ProductLST getProductLST(ProductLST lst) throws AMSException;
	public ProductENT saveProduct(ProductENT productENT) throws AMSException;
	public ProductENT getProduct(ProductENT productENT) throws AMSException;
	public void deleteProductENT(int orderId) throws AMSException;
	public void updateViewStatusOfProducts(String[] params) throws AMSException;
}
