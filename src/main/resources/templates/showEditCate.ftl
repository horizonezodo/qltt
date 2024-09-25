<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Cate</title>
</head>
<body>
<h1>Edit Cate</h1>
<form action="/admin/editCate/${cate.cateId}" method="post">
    <label for="name">Name:</label>
    <input type="text" id="name" name="cateName" value="${cate.cateName}">
    <br><br>
    <label for="isActivate">
        <input type="checkbox" id="isActivate" value="true" name="isActivate" ${cate.cateActivate?then('checked', '')}>
        Is Activate
    </label>
    <br><br>
    <button type="submit">Save</button>
</form>

<a href="/showCate">Back to List</a>
</body>
</html>
