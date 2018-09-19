package com.wxf.service.impl;

import com.wxf.bean.AdminInfoBean;
import com.wxf.db.DBProvider;
import com.wxf.service.IAjaxDemoService;
import com.wxf.utils.MyUtils;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.util.ArrayList;
import java.util.List;

public class AjaxDemoServiceImpl implements IAjaxDemoService {

  /**
   * @Author Benedikt
   * @Description //TODO
   * @Date 17:29 2018/09/15 0015
   * @Param [adminB]
   * @return java.util.List<com.wxf.bean.AdminInfoBean>
   **/
  public List<AdminInfoBean> queryLoginInfoByParams(AdminInfoBean adminB) {
    // 组织查询语句
    StringBuilder sbQuerySql = new StringBuilder(" select * from admininfo where 1=1 ");

    // 查询条件的参数集合
    List<Object> lstParams = new ArrayList<>();
    if (adminB != null) {
      // 根据查询条件动态拼写查询条件
      // 姓名模糊查询
      String strName = adminB.getAdminname();
      if (strName != null && !strName.equals("")) {
        // 添加姓名的模糊查询条件
        sbQuerySql.append(" and adminName like ? ");
        // 保存查询参数
        lstParams.add("%" + strName + "%");
      }

      // 地址模糊查询
      String strAddress = adminB.getAdminaddress();
      if (strAddress != null && !strAddress.equals("")) {
        // 添加姓名的模糊查询条件
        sbQuerySql.append(" and adminaddress like ? ");
        // 保存查询参数
        lstParams.add("%" + strAddress + "%");
      }

    }

    // 调用db层进行数据库查询操作
    List<AdminInfoBean> lstAdmins = MyUtils.getInstance(DBProvider.class).query(sbQuerySql.toString(),
            new BeanListHandler<>(AdminInfoBean.class), lstParams.toArray());
    // 返回结果
    return lstAdmins;
  }

}
