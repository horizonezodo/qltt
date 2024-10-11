<div class="login-container">
    <div class="login-box animated fadeInDown">
        <div class="login-logo"></div>
        <div class="login-body">
            <div class="alert alert-success" role="alert" ng-if="ctrl.successMessage">{{ctrl.successMessage}}</div>
            <div class="alert alert-danger" role="alert" ng-if="ctrl.errorMessage">{{ctrl.errorMessage}}</div>
            <div class="login-title"><strong>Log In</strong> to your account</div>
            <form ng-submit="ctrl.submit()" name="loginForm" class="form-horizontal">
                <div class="form-group">
                    <div class="col-md-12">
                        <input type="text" class="form-control" ng-model="ctrl.login.username" name="username" placeholder="User Name"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <input type="password" class="form-control" ng-model="ctrl.login.password" name="password" placeholder="Password"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-6">
                        <a href="#" class="btn btn-link btn-block">Forgot your password?</a>
                    </div>
                    <div class="col-md-6">
                        <button type="submit" class="btn btn-info btn-block">Log In</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="login-footer">
            <div class="pull-left">&copy; 2014 AppName</div>
        </div>
    </div>
</div>
