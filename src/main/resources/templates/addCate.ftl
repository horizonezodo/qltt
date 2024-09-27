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
    <!-- EOF CSS INCLUDE -->
</head>
<body>
<!-- START PAGE CONTAINER -->
<div class="page-container">

    <!-- START PAGE SIDEBAR -->
    <div class="page-sidebar">
        <!-- START X-NAVIGATION -->
        <ul class="x-navigation">
            <li class="xn-logo">
                <a href="/list-cate">Joli Admin</a>
                <a href="#" class="x-navigation-control"></a>
            </li>
            <li class="xn-profile">
                <a href="#" class="profile-mini">
                    <img src="/assets/images/users/avatar.jpg" alt="John Doe"/>
                </a>
                <div class="profile">
                    <div class="profile-image">
                        <img src="/assets/images/users/avatar.jpg" alt="John Doe"/>
                    </div>
                    <div class="profile-data">
                        <div class="profile-data-name">John Doe</div>
                        <div class="profile-data-title">Web Developer/Designer</div>
                    </div>
                    <div class="profile-controls">
                        <a href="pages-profile.html" class="profile-control-left"><span class="fa fa-info"></span></a>
                        <a href="pages-messages.html" class="profile-control-right"><span class="fa fa-envelope"></span></a>
                    </div>
                </div>
            </li>
            <li class="xn-title">Navigation</li>
            <li class="active">
                <a href="/cate-list"><span class="fa fa-desktop"></span> <span class="xn-text">Dashboard</span></a>
            </li>
        </ul>
        <!-- END X-NAVIGATION -->
    </div>
    <!-- END PAGE SIDEBAR -->

    <!-- PAGE CONTENT WRAPPER -->
        <div class="page-content-wrap" style="height: 738px;">
            <button class="btn btn-danger btn-rounded btn-sm"><a href="/list-cate">Back</a></button>
            <div class="row">
                <div class="col-md-12">

                    <form class="form-horizontal" action="/admin/addCate" class="form-horizontal" method="post">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Create New Category</h3>
                                <ul class="panel-controls">
                                    <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
                                </ul>
                            </div>
                            <div class="panel-body">
                            </div>
                            <div class="panel-body">

                                <div class="form-group">
                                    <label class="col-md-3 col-xs-12 control-label">Name Category</label>
                                    <div class="col-md-6 col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                            <input type="text" name="name" class="form-control"/>
                                        </div>
                                        <span class="help-block">This is title of category</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 col-xs-12 control-label">Checkbox</label>
                                    <div class="col-md-6 col-xs-12">
                                        <label class="check"><input type="checkbox" class="icheckbox" name="isActivate" value="true" checked="checked"/> Is Activate</label>
                                        <span class="help-block">Is activate or deactivate</span>
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
        <!-- END PAGE CONTENT WRAPPER -->
    </div>
    <!-- END PAGE CONTENT -->
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
<!-- END TEMPLATE -->
<!-- END SCRIPTS -->
</body>
</html>






