package com.wxf.service;

import com.wxf.bean.AdminInfoBean;

import java.util.List;

public interface IAjaxDemoService {

  /**
   * 根据查询条件进行查询用户信息
   * @param adminB 查询条件实体
   * @return 查询结果集
   */
  public List<AdminInfoBean> queryLoginInfoByParams(AdminInfoBean adminB);
}

