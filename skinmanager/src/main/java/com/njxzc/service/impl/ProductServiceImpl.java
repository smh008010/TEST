package com.njxzc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njxzc.dao.ProductMapper;
import com.njxzc.model.Product;
import com.njxzc.model.ProductExample;
import com.njxzc.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductMapper productMapper;
	
	@Override
	public List<Product> selectByExample(ProductExample example) {
		
		return productMapper.selectByExample(example);
	}

	@Override
	public Product selectByPrimaryKey(Integer productid) {
		
		return productMapper.selectByPrimaryKey(productid);
	}

	@Override
	public int updateByPrimaryKeySelective(Product record) {
		
		return productMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int insert(Product record) {
		
		return productMapper.insert(record);
	}

}
