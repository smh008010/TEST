package com.njxzc.service;

import java.util.List;

import com.njxzc.model.Indrug;

public interface IndrugService {

    List<Indrug> queryall(Indrug indrug);
    
    Indrug queryoneid(Integer indrugid);
    
    int updateByPrimaryKeySelective(Indrug record);

    int insert(Indrug record);
}
