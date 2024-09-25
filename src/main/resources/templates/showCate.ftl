<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Show Cate</title>
    <link href="/css/main.css" rel="stylesheet">
</head>
<body>
<a href="/admin/addCate">Create new Category</a>
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
    <tr>
        <td>${cate.cateId}</td>
        <td>${cate.cateName}</td>
        <td>${cate.cateActivate?string('Yes', 'No')}</td>
        <td><button><a href="/admin/showEditCate/${cate.cateId}">Edit</a></button> <button><a href="/admin/deleteCate/${cate.cateId}">Delete</a></button> <button><a href="/viewDetail/${cate.cateId}">View Detail</a> </button></td>
    </tr>
    </#list>
    </tbody>
</table>
<script src="/js/main.js"></script>
</body>
</html>