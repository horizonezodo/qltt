<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Show Cate</title>
    <link href="/css/main.css" rel="stylesheet">
</head>
<body>


    <#if newDetail??>
        <button><a href="/admin/show-edit-new-detail/${newDetail.newDetailId}">Update Detail</a></button>
        <button><a href="/admin/delete-new-detail/${newDetail.newDetailId}">Delete Detail</a></button>
        <table border="0">
    <thead>
    <tr>
        <th>New Id</th>
        <th>Title</th>
        <th>Content</th>
        <th>Category Name</th>
        <th> Status </th>
        <th>Create At</th>
    </tr>
    </thead>
    <tbody>
        <tr>
            <td>${newDetail.newDetailId}</td>
            <td>${newDetail.title}</td>
            <td>${newDetail.content}</td>
            <td>${cateName}</td>
            <td>${newDetail.status?string('Yes', 'No')}</td>
            <td>${newDetail.createAt}</td>
        </tr>
    </tbody>
</table>
    <#else>
        <tr>
            <button><a href="/admin/addNewDetail/${cateId}">New Detail</a></button>
            <td colspan="6">No details available.</td> <!-- Hiển thị thông báo khi không có detail -->
        </tr>
    </#if>


<script src="/js/main.js"></script>
</body>
</html>