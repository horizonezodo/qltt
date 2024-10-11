'use strict';

angular.module('qlttApp').factory('UserDetailService', ['$http', '$q', 'urls',
    function ($http, $q, urls) {
        const detail = {};

        const factory = {
            getDetail: getDetail,
            loadDetail: loadDetail,
            resetDetail: resetDetail,
        };

        function getDetail(id) {
            console.log('Fetching detail');
            const deferred = $q.defer();
            $http.get('http://localhost:8080/user/viewDetail/' + id)
                .then(
                    function (response) {
                        console.log('Fetched successfully detail');
                        Object.assign(detail, response.data.newDetail);
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

        function resetDetail() {
            for (let key in detail) {
                delete detail[key];
            }
        }

        return factory;
    }
])
    .controller('UserDetailController', ['UserDetailService', '$scope', '$state', '$stateParams',
        function (UserDetailService, $scope, $state, $stateParams) {
            var self = this;
            self.detail = null
            let idCate = $stateParams.id;
            self.newDetail = {
                newDetailId: undefined,
                title: '',
                cateId: idCate,
                content: '',
                status: false,
                createAt: '',
            };
            self.back = function (){
                UserDetailService.resetDetail()
                idCate = undefined;
                self.newDetail = {};
                self.detail = {}
                $state.go('user-category');
            };

            loadDetail(idCate);

            function loadDetail(idCate) {
                self.isLoading = true;
                UserDetailService.getDetail(idCate).then(
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
        }
    ]);
