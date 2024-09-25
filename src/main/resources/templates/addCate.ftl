<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Cate</title>
</head>
<body>
<h1>Create a New Cate</h1>
<form action="/admin/addCate" method="post">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required>
    <br><br>
    <label for="isActivate">
        <input type="checkbox" id="isActivate" name="isActivate" value="true">
        Is Activate
    </label>
    <br><br>
    <button type="submit">Create</button>
</form>
</body>
</html>
