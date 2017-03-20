package ams.ggc.common.NEWS;

import ams.ggc.common.tools.AMSException;




public interface NewsDAOInterface {
	public NewsLST getNewsLST(NewsLST lst) throws AMSException; 
    public NewsENT getNewsEnt(int newsId) throws AMSException;
    public NewsLST getNewsMiniLST(String language) throws AMSException;
    public NewsLST saveNews(NewsENT newsENT) throws AMSException;
}
