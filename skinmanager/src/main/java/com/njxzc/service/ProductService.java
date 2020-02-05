package com.njxzc.service;

import java.util.List;

import com.njxzc.model.Product;
import com.njxzc.model.ProductExample;

public interface ProductService {

	List<Product> selectByExample(ProductExample example);

    Product selectByPrimaryKey(Integer productid);
    
    int updateByPrimaryKeySelective(Product record);
    
	int insert(Product record);
}
