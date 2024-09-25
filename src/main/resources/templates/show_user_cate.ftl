<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Show Cate</title>
    <link href="/css/main.css" rel="stylesheet">
</head>
<body>
<table border="0">
    <thead>
    <tr>
        <th>Category Id</th>
        <th>Category Name</th>
        <th>Category Status</th>
        <th> Action </th>
    </tr>
    </thead>
    <tbody>
    <#list cateList as cate>
         <#if cate??>
        <tr>
            <td>${cate.cateId}</td>
            <td>${cate.cateName}</td>
            <td>${cate.cateActivate?string('Yes', 'No')}</td>
            <td> <button><a href="/user/viewDetail/${cate.cateId}">View Detail</a> </button></td>
        </tr>
        </#if>
    </#list>
    </tbody>
</table>
<script src="/js/main.js"></script>
</body>
</html>