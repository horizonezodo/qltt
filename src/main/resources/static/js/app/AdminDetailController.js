'use strict';

angular.module('qlttApp').factory('AdminDetailService', ['$http', '$q', 'urls',
    function ($http, $q, urls) {
        const detail = {};

        const factory = {
            getDetail: getDetail,
            createNewDetail: createNewDetail,
            updateDetail: updateDetail,
            loadDetail: loadDetail,
            removeDetail: removeDetail,
            resetDetail:resetDetail,
        };

        function getDetail(id) {
            console.log('Fetching detail');
            const deferred = $q.defer();
            $http.get('http://localhost:8080/admin/viewDetail/' + id)
                .then(
                    function (response) {
                        console.log('Fetched successfully detail');
                        Object.assign(detail, response.data.newDetail);
                        console.log("data: " + response.data.newDetail)
                        deferred.resolve(detail);
                    },
                    function (errResponse) {
                        console.error('Error while loading details');
                        deferred.reject(errResponse);
                    }
                );
            return deferred.promise;
        }

        function loadDetail(){
            console.log(detail)
            const deferred = $q.defer();
            deferred.resolve(detail);
            return deferred.promise;
        }

        function createNewDetail(newDetail, id) {
            console.log('Creating detail');
            const deferred = $q.defer();
            $http.post('http://localhost:8080/admin/addNewDetail/' + id, newDetail)
                .then(
                    function (response) {
                        getDetail(id);
                        deferred.resolve(response.data);
                    },
                    function (errResponse) {
                        console.error('Error while creating detail: ' + errResponse.data.errorMessage);
                        deferred.reject(errResponse);
                    }
                );
            return deferred.promise;
        }

        function updateDetail(newDetail, id, cateId) {
            console.log('Updating detail with id ' + id);
            const deferred = $q.defer();
            $http.post('http://localhost:8080/admin/edit-new-detail/' + id, newDetail)
                .then(
                    function (response) {
                        getDetail(cateId);
                        deferred.resolve(response.data);
                    },
                    function (errResponse) {
                        console.error('Error while updating detail with id: ' + id);
                        deferred.reject(errResponse);
                    }
                );
            return deferred.promise;
        }

        function removeDetail(id, cateId) {
            console.log('Removing detail with id ' + id);
            const deferred = $q.defer();
            $http.post('http://localhost:8080/admin/delete-new-detail/' + id)
                .then(
                    function (response) {
                        getDetail(cateId);
                        deferred.resolve(response.data);
                    },
                    function (errResponse) {
                        console.error('Error while removing detail with id: ' + id);
                        deferred.reject(errResponse);
                    }
                );
            return deferred.promise;
        }

        function resetDetail() {
            for (let key in detail) {
                delete detail[key];
            }
        }

        return factory;
    }
])
    .controller('AdminDetailController', ['AdminDetailService', '$scope', '$state', '$stateParams',
        function (AdminDetailService, $scope, $state, $stateParams) {
            var self = this;
            let idCate = $stateParams.id;
            self.newDetail = {
                newDetailId: undefined,
                title: '',
                cateId: idCate,
                content: '',
                status: false,
                createAt: '',
            };
            self.isLoading = false;

            self.submit = submit;
            self.createNewDetail = createNewDetail;
            self.updateDetail = updateDetail;
            self.editDetail = editDetail;
            self.removeDetail = removeDetail;
            self.reset = reset;
            self.back = function (){
                AdminDetailService.resetDetail();
                idCate = undefined;
                self.newDetail = {};
                self.detail = {}
                $state.go('home');
            };

            self.successMessage = '';
            self.errorMessage = '';

            loadDetail(idCate);

            function loadDetail(idCate) {
                self.isLoading = true;
                AdminDetailService.getDetail(idCate).then(
                    function (response) {
                        self.detail = response;
                        console.log('Detail loaded: ', self.detail);
                    },
                    function (errResponse) {
                        console.error('Error while fetching detail', errResponse);
                    }
                ).finally(() => {
                    self.isLoading = false;
                });
            }

            function submit() {
                console.log('Submitting');
                if (!self.newDetail.newDetailId) {
                    console.log('Saving new detail', self.newDetail);
                    createNewDetail(self.newDetail, self.newDetail.cateId);
                } else {
                    updateDetail(self.newDetail, self.newDetail.newDetailId, self.newDetail.cateId);
                    console.log('Detail updated with id ', self.newDetail.newDetailId);
                }
            }

            function createNewDetail(newDetail, cateId) {
                console.log("Creating new detail");
                AdminDetailService.createNewDetail(newDetail, cateId)
                    .then(
                        function (response) {
                            console.log("Detail created successfully");
                            self.successMessage = 'Detail created successfully';
                            self.errorMessage = '';
                            $scope.detailForm.$setPristine();
                            self.isLoading = true;
                            loadDetail();
                            reset();
                        },
                        function (errResponse) {
                            console.log("Failed to create Detail");
                            self.successMessage = '';
                            self.errorMessage = 'Failed to create Detail';
                        }
                    );
            }

            function updateDetail(newDetail, newDetailId, cateId) {
                console.log("Updating detail");
                AdminDetailService.updateDetail(newDetail, newDetailId, cateId)
                    .then(
                        function (response) {
                            console.log("Detail updated successfully");
                            self.successMessage = 'Detail updated successfully';
                            self.errorMessage = '';
                            $scope.detailForm.$setPristine();
                            self.isLoading = true;
                            loadDetail();
                            reset();
                        },
                        function (errResponse) {
                            console.log("Failed to update Detail");
                            self.successMessage = '';
                            self.errorMessage = 'Failed to update Detail';
                        }
                    );
            }

            function removeDetail(newDetailId, cateId) {
                console.log('Removing Detail with id ' + newDetailId);
                AdminDetailService.removeDetail(newDetailId, cateId)
                    .then(
                        function () {
                            console.log('Detail removed successfully');
                            self.isLoading = true;
                            AdminDetailService.resetDetail();
                            loadDetail(cateId)
                        },
                        function (errResponse) {
                            console.error('Error while removing Detail ' + newDetailId + ', Error: ' + errResponse.data);
                        }
                    );
            }

            function editDetail(id) {
                self.successMessage = '';
                self.errorMessage = '';
                AdminDetailService.getDetail(id).then(
                    function (detail) {
                        console.log("get detail: " + detail);
                        self.newDetail = detail;
                    },
                    function (errResponse) {
                        console.error('Error while loading Detail ' + id + ', Error: ' + errResponse.data);
                    }
                );
            }
            function reset() {
                self.successMessage = '';
                self.errorMessage = '';
                self.newDetail = {
                    newDetailId: undefined,
                    title: '',
                    cateId: idCate,
                    content: '',
                    status: false,
                    createAt: '',
                };
                $scope.detailForm.$setPristine();
            }

        }
    ]);
