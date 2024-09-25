<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Cate</title>
    <link rel="stylesheet" href="https://cdn.ckeditor.com/ckeditor5/43.1.1/ckeditor5.css" />
</head>
<body>
<h1>Edit Cate</h1>
<form action="/admin/edit-new-detail/${updateDetail.newDetailId}" method="post">
    <label for="name">Title:</label>
    <input type="text" id="title" name="title" value="${updateDetail.title}">
    <br><br>
    <label for="name">Content:</label>
    <textarea type="text" id="content" name="content" >${updateDetail.content}</textarea>
    <br><br>
    <label for="name">Category Name:</label>
    <input type="text" id="name" name="cateName" value="${cateName}" readonly></input>
    <br><br>
    <label for="isActivate">
        <input type="checkbox" id="isActivate" value="true" name="isActivate" ${updateDetail.status?then('checked', '')}>
        Is Activate
    </label>
    <br><br>
    <label for="name">Created At:</label>
    <input type="text" id="name" name="cateName" value="${updateDetail.createAt}" readonly></input>
    <br><br>
    <button type="submit">Save</button>
</form>

<a href="/showCate">Back to List</a>

<script type="importmap">
        {
            "imports": {
                "ckeditor5": "https://cdn.ckeditor.com/ckeditor5/43.1.1/ckeditor5.js",
                "ckeditor5/": "https://cdn.ckeditor.com/ckeditor5/43.1.1/"
            }
        }
    </script>
<script type="module">
    import {
        ClassicEditor,
        Essentials,
        Paragraph,
        Bold,
        Italic
    } from 'ckeditor5';

    ClassicEditor
        .create( document.querySelector( '#content' ), {
            plugins: [ Essentials, Paragraph, Bold, Italic ],
            toolbar: [ 'bold', 'italic' ]
        } )
        .catch( error => {
            console.error( error );
        } );
</script>
</body>
</html>
