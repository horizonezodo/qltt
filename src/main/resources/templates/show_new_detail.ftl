
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

            <div ng-if="ctrl.detail">
                <button ng-click="ctrl.editDetail(ctrl.detail.cateId)" class="btn btn-default btn-rounded btn-sm">Update news detail</button>
                <button ng-click="ctrl.removeDetail(ctrl.detail.newDetailId)" class="btn btn-danger btn-rounded btn-sm">Delete news</button>
                <button ng-click="ctrl.back()" class="btn btn-default btn-rounded btn-sm" style="float: right">Back</button>
            </div>
            <table class="table table-bordered">
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
                    <td>{{ctrl.detail.newDetailId}}</td>
                    <td>{{ctrl.detail.title}}</td>
                    <td>{{ctrl.detail.content}}</td>
                    <td>{{ctrl.detail.cateId}}</td>
                    <td>{{ctrl.detail.status ? 'Yes' : ''}}</td>
                    <td>{{ctrl.detail.createAt}}</td>
                </tr>
                </tbody>
            </table>
            <div ng-if="!ctrl.detail || Object.keys(ctrl.detail).length === 0" class="alert alert-warning">
                <tr>
                    <button class="btn btn-default btn-rounded btn-sm">Create news Detail</button>
                    <td colspan="6">No details available.</td>
                </tr>
            </div>

        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="alert alert-success" role="alert" ng-if="ctrl.successMessage">{{ctrl.successMessage}}</div>
                <div class="alert alert-danger" role="alert" ng-if="ctrl.errorMessage">{{ctrl.errorMessage}}</div>
                <form ng-submit="ctrl.submit()" name="detailForm" class="form-horizontal">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><strong>Create News Details</strong></h3>
                            <ul class="panel-controls">
                                <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
                            </ul>
                        </div>
                        <div class="panel-body">

                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Title</label>
                                <div class="col-md-6 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                        <input type="text" ng-model="ctrl.newDetail.title" name="title" class="form-control"/>
                                    </div>
                                    <span class="help-block">Type some title</span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Content</label>
                                <div class="col-md-6 col-xs-12">
                                    <textarea type="text" ng-model="ctrl.newDetail.content" class="content" id="content" name="content" rows="5" ></textarea>
                                    <span class="help-block">Type some content</span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">News Status</label>
                                <div class="col-md-6 col-xs-12">
                                    <label class="check"><input type="checkbox" ng-model="ctrl.newDetail.status" name="status" value="true" class="icheckbox"/> Is Activate</label>
                                    <span class="help-block">Activate or Deactivate News</span>
                                </div>
                            </div>

                        </div>
                        <div class="panel-footer">
                            <input type="submit"  ng-value="!ctrl.newDetail.newDetailId ? 'Add' : 'Update'" class="btn btn-primary btn-sm" ng-disabled="detailForm.$invalid || detailForm.$pristine">
                            <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="detailForm.$pristine">Reset Form</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
    <!-- PAGE CONTENT -->

    <!-- END PAGE CONTENT -->
</div>





