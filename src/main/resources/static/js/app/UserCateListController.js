'use strict';

angular.module('qlttApp').factory('UserCateListService', ['$http', '$q', 'urls',
    function ($http, $q, urls) {
        const categories = [];

        const factory = {
            getAllCategories: getAllCategories,
            loadAllCategory: loadAllCategory,
        };
        function loadAllCategory() {
            console.log('Fetching all categories');
            const deferred = $q.defer();
            $http.get('http://localhost:8080/user/cate-list')
                .then(
                    function (response) {
                        console.log('Fetched successfully all categories');
                        console.log(response)
                        categories.length = 0;
                        Array.prototype.push.apply(categories, response.data);
                        deferred.resolve(response);
                    },
                    function (errResponse) {
                        console.error('Error while loading categories');
                        deferred.reject(errResponse);
                    }
                );
            return deferred.promise;
        }

        function getAllCategories() {
            console.log("categories: " + categories)
            return categories;
        }

        return factory;
    }
])
    .controller('UserCateListController', ['UserCateListService', '$scope', '$state', function (UserCateListService, $scope, $state) {
        var self = this;
        self.category = {
            cateId: undefined,
            cateName: '',
            cateActivate: false
        };

        self.viewDetail = function (cateId){
            $state.go('user-detail', {id: cateId});
        };


        loadAllCategories();

        function loadAllCategories() {
            self.isLoading = true;
            UserCateListService.loadAllCategory().then(
                function (response) {
                    console.log("data nhận được: " + response.data.data)
                    self.categories = response.data;
                    console.log('Categories loaded: ', self.categories);
                },
                function (errResponse) {
                    console.error('Error while fetching categories', errResponse);
                }
            ).finally(() => {
                self.isLoading = false;
            });
        }

    }]);
