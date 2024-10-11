const app = angular.module('qlttApp', ['ui.router']);

app.constant('urls', {
    BASE: 'http://localhost:8080/',
    ADMIN_BASE_API: 'http://localhost:8080/admin/cate-list/',
    USER_BASE_API: 'http://localhost:8080/user/cate-list/'
});

app.config(function($stateProvider, $urlRouterProvider) {
        $stateProvider
            .state('login', {
                url: '/',
                templateUrl: 'partials/pages-login-website',
                controller: 'WebsiteController',
                controllerAs: 'ctrl',
            })
            .state('home', {
                url: '/home',
                templateUrl: 'partials/showCate',
                controller: 'AdminCateListController',
                controllerAs: 'ctrl',
            })
            .state('admin-view-detail', {
                url: '/admin/view-detail/:id',
                templateUrl: 'partials/show_new_detail',
                controller: 'AdminDetailController',
                controllerAs: 'ctrl',
            })
            .state('user-home', {
                url: '/user/home',
                templateUrl: 'partials/user-index',
                controllerAs: 'ctrl',
            })
            .state('user-category', {
                url: '/user/cate-list',
                templateUrl: 'partials/show_user_cate',
                controller: 'UserCateListController',
                controllerAs: 'ctrl',
            })
            .state('user-detail', {
                url: '/user/viewDetail/:id',
                templateUrl: 'partials/user_show_new_detail',
                controller: 'UserDetailController',
                controllerAs: 'ctrl',
        });
        $urlRouterProvider.otherwise('/');
    }
);
