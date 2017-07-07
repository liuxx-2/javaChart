<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Lxx
  Date: 2017/5/16
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<table>
  <tr>
    <th>编号</th>
    <th>姓名</th>
  </tr>
  <c:forEach items="${list}" var="l">
    <tr>
      <th>${l.t_id}</th>
      <th>${l.t_name}</th>
    </tr>
  </c:forEach>
</table>

</body>
</html>
