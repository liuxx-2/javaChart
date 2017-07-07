<html>
<head>
    <title>展示页面</title>
</head>

<body>
<table align="center">
<form action="bookList.html" method="post">
    姓名:<input type="text" name="name" value="${name}">
    <input type="submit" value="百度">
</form>
</table>
<table border="1" align="center" style="width: 300px;height: 200px" bgcolor="#ffe4c4">
    <tr>
        <th>编号</th>
        <th>姓名</th>
        <th colspan="200px"><input type="button" value="添加" onclick="add()"></th>
    </tr>
    <#list list as book >
        <tr>
            <th>${book.t_id}</th>
            <th>${book.t_name}</th>
            <th><input type="button" value="删除" onclick="del(${book.t_id})"></th>
            <th><input type="button" value="修改" onclick="update(${book.t_id})"></th>
        </tr>
    </#list>
    <tr>
        <th colspan="200px">
        ${page} ${cpage}/${totalPage}
        </th>
    </tr>
</table>
<script>
    function add(){
        location.href="insert.html";
    }
    function del(id){
        location.href="delete.html?t_id="+id;
    }
    function update (id){
        location.href="update.html?t_id="+id;
    }
</script>
</body>
</html>