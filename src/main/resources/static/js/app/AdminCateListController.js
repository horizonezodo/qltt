'use strict';

angular.module('qlttApp').factory('AdminCateListService', ['$http', '$q', 'urls',
    function ($http, $q, urls) {
        const categories = [];

        const factory = {
            getAllCategories: getAllCategories,
            createNewCategory: createNewCategory,
            updateCategory: updateCategory,
            loadAllCategory: loadAllCategory,
            getCategory: getCategory,
            removeCategory: removeCategory
        };

        function loadAllCategory() {
            console.log('Fetching all categories');
            const deferred = $q.defer();
            $http.get(urls.ADMIN_BASE_API)
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

        function getCategory(id) {
            console.log('Fetching category with id :' + id);
            const deferred = $q.defer();
            $http.get('http://localhost:8080/admin/cate/' + id)
                .then(
                    function (response) {
                        console.log('Fetched successfully category with id :' + id);

                        deferred.resolve(response.data);
                    },
                    function (errResponse) {
                        console.error('Error while loading category with id :' + id);
                        deferred.reject(errResponse);
                    }
                );
            return deferred.promise;
        }

        function createNewCategory(category) {
            console.log('Creating category');
            const deferred = $q.defer();
            $http.post('http://localhost:8080/admin/addCate', category)
                .then(
                    function (response) {
                        loadAllCategory();
                        deferred.resolve(response.data);
                    },
                    function (errResponse) {
                        console.error('Error while creating category : ' + errResponse.data.errorMessage);
                        deferred.reject(errResponse);
                    }
                );
            return deferred.promise;
        }

        function updateCategory(category, id) {
            console.log('Updating category with id ' + id);
            const deferred = $q.defer();
            $http.post('http://localhost:8080/admin/editCate/'+ id, category)
                .then(
                    function (response) {
                        loadAllCategory();
                        deferred.resolve(response.data);
                    },
                    function (errResponse) {
                        console.error('Error while updating category with id :' + id);
                        deferred.reject(errResponse);
                    }
                );
            return deferred.promise;
        }

        function removeCategory(id) {
            console.log('Removing category with id ' + id);
            const deferred = $q.defer();
            $http.post('http://localhost:8080/admin/deleteCate/'+ id)
                .then(
                    function (response) {
                        loadAllCategory();
                        deferred.resolve(response.data);
                    },
                    function (errResponse) {
                        console.error('Error while removing category with id :' + id);
                        deferred.reject(errResponse);
                    }
                );
            return deferred.promise;
        }

        return factory;
    }
])
    .controller('AdminCateListController', ['AdminCateListService', '$scope', '$state', function (AdminCateListService, $scope, $state) {
        var self = this;
        self.category = {
            cateId: undefined,
            cateName: '',
            cateActivate: false
        };
        self.categories = [];
        self.isLoading = false;

    self.submit = submit;
    self.createNewCategory = createNewCategory;
    self.updateCategory = updateCategory;
    self.editCategory = editCategory;
    self.removeCategory = removeCategory;
    self.reset = reset;
    self.viewDetail = function (cateId){
        $state.go('admin-view-detail', {id: cateId});
    };

    self.successMessage = '';
    self.errorMessage = '';

    loadAllCategories();

    function loadAllCategories() {
        self.isLoading = true;
        AdminCateListService.loadAllCategory().then(
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

    function submit() {
        console.log('Submitting');
        if (self.category.cateId === undefined || self.category.cateId === null) {
            console.log('Saving new category', self.category);
            createNewCategory(self.category);
        } else {
            updateCategory(self.category, self.category.cateId);
            console.log('Category updated with id ', self.category.cateId);
        }
    }

    function createNewCategory(category) {
        console.log("Creating new category");
        AdminCateListService.createNewCategory(category)
            .then(
                function (response) {
                    console.log("Category created successfully");
                    self.successMessage = 'Category created successfully';
                    self.errorMessage = '';
                    $scope.categoryForm.$setPristine();
                    self.isLoading = true;
                    loadAllCategories();
                    reset()
                },
                function (errResponse) {
                    console.log("Failed to create category");
                    self.successMessage = '';
                    self.errorMessage = 'Failed to create category';
                }
            );
    }

    function updateCategory(category, cateId) {
        console.log("Updating category");
        AdminCateListService.updateCategory(category, cateId)
            .then(
                function (response) {
                    console.log("Category updated successfully");
                    self.successMessage = 'Category updated successfully';
                    self.errorMessage = '';
                    $scope.categoryForm.$setPristine();
                    self.isLoading = true;
                    loadAllCategories();
                    reset()
                },
                function (errResponse) {
                    console.log("Failed to update category");
                    self.successMessage = '';
                    self.errorMessage = 'Failed to update category';
                }
            );
    }

    function removeCategory(catId) {
        console.log('Removing category with id ' + catId);
        AdminCateListService.removeCategory(catId)
            .then(
                function () {
                    console.log('Category removed successfully');
                    self.isLoading = true;
                    loadAllCategories();
                },
                function (errResponse) {
                    console.error('Error while removing category ' + catId + ', Error :' + errResponse.data);
                }
            );
    }

    function editCategory(id) {
        self.successMessage = '';
        self.errorMessage = '';
        AdminCateListService.getCategory(id).then(
            function (category) {
                self.category = category;
            },
            function (errResponse) {
                console.error('Error while loading category ' + id + ', Error :' + errResponse.data);
            }
        );
    }

    function reset() {
        self.successMessage = '';
        self.errorMessage = '';
        self.category = {
            cateId: undefined,
            cateName: '',
            cateActivate: false
        };
        $scope.categoryForm.$setPristine();
    }

}]);
