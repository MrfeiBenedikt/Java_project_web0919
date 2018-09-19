package com.wxf.action;

import com.wxf.bean.AdminInfoBean;
import com.wxf.db.DBProvider;
import com.wxf.service.impl.LoginServiceImpl;
import com.wxf.utils.MyUtils;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "/LoginAction", urlPatterns = "/LoginAction")
public class LoginAction extends HttpServlet {
  /**
   * 对客户端请求进行响应处理
   */
  protected void service(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    // 业务逻辑处理
    // 设置request编码
    request.setCharacterEncoding("utf-8");

    //    // 获取用户名
//    String strUserName = request.getParameter("txtUserName");// 需要和表单的空间的name属性值保持一致
//    // 获取用户名
//    String strUserPsw = request.getParameter("txtUserPsw");// 需要和表单的空间的name属性值保持一致
//    // 将表单数据存入实体bean中进行传输
//    AdminInfoBean adminB = MyUtils.getInstance(AdminInfoBean.class);
//    adminB.setAdminname(strUserName);
//    adminB.setAdminpsw(strUserPsw);
//
//    System.out.println("客户端登录的用户名：" + strUserName);
//    System.out.println("客户端登录的密码：" + strUserPsw);

    // 取出客户端发送的表单数据
    // 将表单数据存入实体bean中进行传输
    AdminInfoBean adminB = MyUtils.convertFormData2Bean(request, AdminInfoBean.class);
    MyUtils.logRootLogger.info("登录用户名：" + adminB.getAdminname());
    MyUtils.logRootLogger.info("注册时间：" + MyUtils.convertDate2String(adminB.getRegdate(), "yyyy-MM-dd HH:mm:ss"));
    // 调用model层进行业务逻辑处理：查询数据库进行用户信息合法性验证
    List<AdminInfoBean> lstAdmins = MyUtils.getInstance(LoginServiceImpl.class).queryLoginInfo(adminB);
    // 根据接收到的model的返回结果，进行用户视图的转发控制
    if (lstAdmins != null && lstAdmins.size() > 0) {
      // 登录成功，挑战到登录成功的页面
      // 缓存登录成功的用户信息
      request.getSession().setAttribute("loginedUser", lstAdmins.get(0));
      // 使用重定向
      response.sendRedirect("logined.jsp");
    } else {
      // 登录失败，重新登录
      // 使用重定向
      response.sendRedirect("login.jsp");
    }
  }

}
