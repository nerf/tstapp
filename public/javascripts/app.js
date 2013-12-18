'use strict';

angular.module('tstApp', [
  'ngRoute',
  'ngResource',
  'tstApp.services',
  'tstApp.controllers'
]).
config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/companies', {templateUrl: 'partials/companies/index.html', controller: 'CompaniesCtrl'});
  $routeProvider.when('/companies/new', {templateUrl: 'partials/companies/new.html', controller: 'NewCompanyCtrl'});
  $routeProvider.when('/companies/:id/edit', {templateUrl: 'partials/companies/edit.html', controller: 'EditCompanyCtrl'});
  $routeProvider.when('/companies/:company_id/owners', {templateUrl: 'partials/companies/owners.html', controller: 'OwnersCompanyCtrl'});
  $routeProvider.otherwise({redirectTo: '/companies'});
}]);
