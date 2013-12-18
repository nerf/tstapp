'use strict';

/* Controllers */

angular.module('tstApp.controllers', []).
  controller('CompaniesCtrl', ['$scope', 'Company', function($scope, Company) {

    $scope.companies = Company.query();

    $scope.deleteCompany = function(company_id) {
      new Company().$delete({id: company_id})

      for (var i = $scope.companies.length - 1; i >= 0; i--) {
        if ($scope.companies[i].id === company_id)
          $scope.companies.splice(i, 1);
      };
    };
  }]).
  controller('NewCompanyCtrl', ['$location', '$scope', 'Company', function($location, $scope, Company) {
    $scope.company = {};

    $scope.save = function(){
      $scope.errors = null;

      var success = function() {
        $scope.company = {};

        $location.path('#/companies')
      };

      var failure = function(resp) {
        $scope.errors = resp.data.errors;
      };

      new Company({company: $scope.company}).$save({}, success, failure);
    };
  }]).
  controller('EditCompanyCtrl', ['$scope', '$location', '$routeParams', 'Company', function($scope, $location, $routeParams, Company){
    $scope.company = Company.get({id: $routeParams.id})

    $scope.save = function(){
      $scope.errors = null;

      var success = function() {
        $scope.company = {};

        $location.path('#/companies')
      };

      var failure = function(resp) {
        $scope.errors = resp.data.errors;
      };

      new Company({company: $scope.company}).$update({id: $scope.company.id}, success, failure);
    };

  }]).
  controller('OwnersCompanyCtrl', ['$scope', '$location', '$routeParams', 'Owner', function($scope, $location, $routeParams, Owner){
    $scope.owners = Owner.query({company_id: $routeParams.company_id});

  }]);
