package com.BiShe.dao;


import java.util.List;


import com.BiShe.bean.Traffic;



public interface ITrafficDAO {
	 boolean updateByDataId(Traffic a);
	 boolean insertTraffic(Traffic a );
	Traffic getTrafficById(int dataid);
	List<Traffic> getTrafficByEmpid(String empid);

}
