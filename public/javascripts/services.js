'use strict';

angular.module('tstApp.services', [], function($provide){
  $provide.factory('Company', function($resource){
    return $resource( "/companies/:id", {id: '@id'}, {update: {method: 'PUT'}} )
  });

  $provide.factory('Owner', function($resource){
    return $resource(
      "/companies/:company_id/owners/:id", 
      {company_id: '@company_id', id: '@id'}, 
      {update: {method: 'PUT'}} 
    )
  });
});
