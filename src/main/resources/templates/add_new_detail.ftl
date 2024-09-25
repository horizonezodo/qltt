<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Cate</title>
    <link rel="stylesheet" href="https://cdn.ckeditor.com/ckeditor5/43.1.1/ckeditor5.css" />
</head>
<body>
<h1>Create a New Detail</h1>
<form action="/admin/addNewDetail/${cateId}" method="post">
    <label for="title">Title:</label>
    <input type="text" id="title" name="title" required>
    <br><br>
    <label for="content">Content:</label>
    <textarea type="text" id="content" name="content"></textarea>
    <br><br>

    <label for="status">
        <input type="checkbox" id="status" name="status" value="true">
        Is Activate
    </label>
    <button type="submit">Create</button>
</form>
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
