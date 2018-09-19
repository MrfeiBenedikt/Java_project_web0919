package com.wxf.action;

import com.wxf.bean.AdminInfoBean;
import com.wxf.utils.MyUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "/AjaxDemoAction",urlPatterns = "/AjaxDemoAction")
public class AjaxDemoAction extends HttpServlet {
  /**
   * create by: mmzs
   * description:
   * create time: 10:03 2018/09/14 0014
   *
   * @Param: request
   * @Param: response
   * @return void
   */
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // 接收数据
    AdminInfoBean adminB = MyUtils.convertFormData2Bean(request, AdminInfoBean.class);
    System.out.println("从客户端请求获取的用户名为："+adminB.getAdminname());

    // 响应客户端的请求
    PrintWriter pw = response.getWriter();
    pw.write("用户已存在");
    pw.flush();
    //pw.close();
  }
}
