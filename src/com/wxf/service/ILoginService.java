package com.wxf.service;

import com.wxf.bean.AdminInfoBean;

import java.util.List;

public interface ILoginService {
  public List<AdminInfoBean> queryLoginInfo(AdminInfoBean adminB);
  /**
   * 保存和修改管理员信息
   *
   * @param adminB 参数实体
   * @return 操作结果
   */
  public int saveOrUpdateAdminInf(AdminInfoBean adminB);
}
