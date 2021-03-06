(function () {
  'use strict';

  var module;
  try {
    module = angular.module('helpers');
  } catch (e) {
    module = angular.module('helpers', []);
  }

  module
    .factory('eventService', function ($rootScope, $timeout) {
      var service = {};
      var lastEvents = {};

      service.broadcast = function broadcast(eventName, data) {
        $rootScope.$broadcast(eventName, data);
        lastEvents[eventName] = { data: data };
      };

      service.on = function on(eventName, handler) {
        $rootScope.$on(eventName, handler);
        if (lastEvents[eventName] && handler) {
          $timeout(function () {
            handler({}, lastEvents[eventName].data);
          });
        }
      };

      return service;
    })
  ;
})();
