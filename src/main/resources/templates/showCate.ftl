
<!-- START PAGE CONTAINER -->
<div class="page-container">

    <!-- START PAGE SIDEBAR -->
    <div class="page-sidebar">
        <!-- START X-NAVIGATION -->
        <ul class="x-navigation">
            <li class="xn-logo">
                <a href="/cate-list">Joli Admin</a>
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
            <#--            <li class="xn-openable">-->
            <#--                <a href="/cate-list"><span class="fa fa-image"></span> Category</a>-->
        </ul>
        <!-- END X-NAVIGATION -->
    </div>
    <!-- END PAGE SIDEBAR -->

    <div class="page-content-wrap" style="height: 738px;">
        <div class="page-content">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Category Id</th>
                    <th>Category Name</th>
                    <th>Category Status</th>
                    <th> Action </th>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="e in ctrl.categories">
                    <td>{{e.cateId}}</td>
                    <td>{{e.cateName}}</td>
                    <td>{{e.cateActivate}}</td>
                    <td>
                        <button type="button" ng-click="ctrl.editCategory(e.cateId)" class="btn btn-success custom-width">Edit</button>
                        <button type="button" ng-click="ctrl.viewDetail(e.cateId)" class="btn btn-primary custom-width">View Detail</button>
                        <button type="button" ng-click="ctrl.removeCategory(e.cateId)" class="btn btn-danger custom-width">Remove</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="alert alert-success" role="alert" ng-if="ctrl.successMessage">{{ctrl.successMessage}}</div>
                <div class="alert alert-danger" role="alert" ng-if="ctrl.errorMessage">{{ctrl.errorMessage}}</div>
                <form ng-submit="ctrl.submit()" name="categoryForm" class="form-horizontal" class="form-horizontal">
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
                                        <input type="text" name="name"  ng-model="ctrl.category.cateName" class="form-control"/>
                                    </div>
                                    <span class="help-block">This is title of category</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Checkbox</label>
                                <div class="col-md-6 col-xs-12">
                                    <label class="check"><input type="checkbox" ng-model="ctrl.category.cateActivate" class="icheckbox" name="isActivate" value="true" checked="checked"/> Is Activate</label>
                                    <span class="help-block">Is activate or deactivate</span>
                                </div>
                            </div>

                        </div>
                        <div class="panel-footer">
                            <input type="submit"  ng-value="!ctrl.category.cateId ? 'Add' : 'Update'" class="btn btn-primary btn-sm" ng-disabled="categoryForm.$invalid || categoryForm.$pristine">
                            <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="categoryForm.$pristine">Reset Form</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>

    </div>
    <!-- PAGE CONTENT -->

    <!-- END PAGE CONTENT -->
</div>
<!-- END PAGE CONTAINER -->
