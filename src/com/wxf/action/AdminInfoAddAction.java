package com.wxf.action;

import com.wxf.bean.AdminInfoBean;
import com.wxf.service.impl.LoginServiceImpl;
import com.wxf.utils.MyUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @ClassName AdminInfoAddAction
 * @Description TODO
 * @Author Benedikt
 * @Date 2018/09/15 0015 22:07
 **/
@WebServlet(name = "AdminInfoAddAction", urlPatterns = "/AdminInfoAddAction")
@MultipartConfig(maxFileSize=1024*1024*5) // 计算的基本单位是字节（byte）
public class AdminInfoAddAction extends HttpServlet {
  /**
   * 业务逻辑处理
   */
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// 1、接收表单数据
    AdminInfoBean adminB = MyUtils.convertFormData2Bean(request, AdminInfoBean.class);
    // 2、调用service层进行数据保存
    int i = MyUtils.getInstance(LoginServiceImpl.class).saveOrUpdateAdminInf(adminB);
    // 3、根据保存处理结果进行页面转发
    if (i > 0) {
      // 保存成功
      response.sendRedirect("adminInfoAddDetail.jsp");
    } else {
      // 保存失败
      response.sendRedirect("adminInfoAdd.jsp");
    }

  }

}
