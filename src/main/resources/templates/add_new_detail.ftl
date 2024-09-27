<!DOCTYPE html>
<html lang="en">
<head>
    <!-- META SECTION -->
    <title>Joli Admin - Responsive Bootstrap Admin Template</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="icon" href="/favicon.ico" type="image/x-icon" />
    <!-- END META SECTION -->

    <!-- CSS INCLUDE -->
    <link rel="stylesheet" type="text/css" id="theme" href="/css/theme-default.css"/>
    <link rel="stylesheet" type="text/css" href="/css/ckeditor-custom.css"/>

    <!-- EOF CSS INCLUDE -->
</head>
<body>
<!-- START PAGE CONTAINER -->
<div class="page-content-wrap" style="height: 738px;">

    <div class="row">
        <div class="col-md-12">

            <form class="form-horizontal" action="/admin/addNewDetail/${cateId}" method="post">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><strong>Create News Details</strong></h3>
                        <ul class="panel-controls">
                            <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
                        </ul>
                    </div>
                    <div class="panel-body">
                    </div>
                    <div class="panel-body">

                        <div class="form-group">
                            <label class="col-md-3 col-xs-12 control-label">Title</label>
                            <div class="col-md-6 col-xs-12">
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                    <input type="text" name="title" class="form-control"/>
                                </div>
                                <span class="help-block">Type some title</span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 col-xs-12 control-label">Content</label>
                            <div class="col-md-6 col-xs-12">
                                <textarea type="text" class="content" id="content" name="content" rows="5" ></textarea>
                                <span class="help-block">Type some content</span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 col-xs-12 control-label">News Status</label>
                            <div class="col-md-6 col-xs-12">
                                <label class="check"><input type="checkbox" name="status" value="true" class="icheckbox"/> Is Activate</label>
                                <span class="help-block">Activate or Deactivate News</span>
                            </div>
                        </div>

                    </div>
                    <div class="panel-footer">
                        <button class="btn btn-default">Clear Form</button>
                        <button class="btn btn-primary pull-right">Submit</button>
                    </div>
                </div>
            </form>

        </div>
    </div>

</div>
<!-- END PAGE CONTAINER -->


<!-- START PRELOADS -->
<audio id="audio-alert" src="audio/alert.mp3" preload="auto"></audio>
<audio id="audio-fail" src="audio/fail.mp3" preload="auto"></audio>
<!-- END PRELOADS -->

<!-- START SCRIPTS -->
<!-- START PLUGINS -->
<script type="text/javascript" src="/js/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/js/plugins/jquery/jquery-ui.min.js"></script>
<script type="text/javascript" src="/s/plugins/bootstrap/bootstrap.min.js"></script>
<!-- END PLUGINS -->

<!-- START THIS PAGE PLUGINS-->
<script type='text/javascript' src='/js/plugins/icheck/icheck.min.js'></script>
<script type="text/javascript" src="/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
<script type="text/javascript" src="/js/plugins/scrolltotop/scrolltopcontrol.js"></script>

<script type="text/javascript" src="/js/plugins/morris/raphael-min.js"></script>
<script type="text/javascript" src="/js/plugins/morris/morris.min.js"></script>
<script type="text/javascript" src="/js/plugins/rickshaw/d3.v3.js"></script>
<script type="text/javascript" src="/js/plugins/rickshaw/rickshaw.min.js"></script>
<script type='text/javascript' src='/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js'></script>
<script type='text/javascript' src='/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js'></script>
<script type='text/javascript' src='/js/plugins/bootstrap/bootstrap-datepicker.js'></script>
<script type="text/javascript" src="/js/plugins/owl/owl.carousel.min.js"></script>

<script type="text/javascript" src="/js/plugins/moment.min.js"></script>
<script type="text/javascript" src="/js/plugins/daterangepicker/daterangepicker.js"></script>
<!-- END THIS PAGE PLUGINS-->

<!-- START TEMPLATE -->
<script type="text/javascript" src="/js/settings.js"></script>

<script type="text/javascript" src="/js/plugins.js"></script>
<script type="text/javascript" src="/js/actions.js"></script>

<script type="text/javascript" src="/js/demo_dashboard.js"></script>
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
            toolbar: [ 'bold', 'italic' ],
        } )
        .catch( error => {
            console.error( error );
        } );
</script>
<!-- END TEMPLATE -->
<!-- END SCRIPTS -->
</body>
</html>






