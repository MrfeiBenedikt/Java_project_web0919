package com.wxf.action;

import com.alibaba.fastjson.JSON;
import com.wxf.bean.AdminInfoBean;
import com.wxf.service.impl.AjaxDemoServiceImpl;
import com.wxf.utils.MyUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/AjaxQueryDemoAction")
public class AjaxQueryDemoAction extends HttpServlet {
  /**
   * @Author Benedikt
   * @Description //TODO 
   * @Date 22:19 2018/09/15 0015
   * @Param [request, response]
   * @return void 
   **/
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    //获取表单数据
    AdminInfoBean adminB = MyUtils.convertFormData2Bean(request, AdminInfoBean.class);
    // 进行查询操作
    List<AdminInfoBean> lstAdmins = MyUtils.getInstance(AjaxDemoServiceImpl.class).queryLoginInfoByParams(adminB);
    System.out.println("查询结果：" + lstAdmins);

    // 借助第三方的工具将集合转换为json字符串【alibaba的fastjson插件包】
    // 将查询结果集list转换为json字符串
    String strJson = JSON.toJSONStringWithDateFormat(lstAdmins, "yyyy-MM-dd HH:mm:ss");
    // ajax响应
    // 响应客户单的请求
    PrintWriter pw = response.getWriter();
    // 将json字符串发回客户端浏览器
    pw.write(strJson);
    pw.flush();
    pw.close();
  }
}
