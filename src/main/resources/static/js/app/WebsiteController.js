'use strict';

angular.module('qlttApp').factory('WebsiteService', ['$http', '$q', 'urls', function ($http, $q, urls) {
    const factory = {
        loginUser: loginUser,
    };

    function loginUser(login) {
        console.log('Login');
        const deferred = $q.defer();
        $http.post(urls.BASE + 'login', login)
            .then(
                function (response) {
                    console.log('Fetched successfully:', response);
                    deferred.resolve(response);
                },
                function (errResponse) {
                    console.error('Error during login:', errResponse);
                    deferred.reject(errResponse);
                }
            );
        return deferred.promise;
    }

    return factory;
}]).controller('WebsiteController', ['WebsiteService', '$scope', '$state', function (WebsiteService, $scope, $state) {
    console.log('WebsiteController initialized');
    var self = this;
    self.login = {};
    self.submit = submit;
    self.loginUser = loginUser;
    self.successMessage = '';
    self.errorMessage = '';

    function submit() {
        console.log('Submitting');
        loginUser(self.login);
    }

    function loginUser(login) {
        console.log('About to log in');
        WebsiteService.loginUser(login)
            .then(
                function (response) {
                    console.log('Login successfully');
                    if (response.data.message === 'Admin') {
                        $state.go('home');
                    } else {
                        $state.go('user-home');
                    }
                },
                function (errResponse) {
                    console.error('Login failed');
                    self.errorMessage = 'Error during login: ' + errResponse.data.message;
                    self.successMessage = '';
                }
            );
    }
}]);
