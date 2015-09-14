#@app = angular.module('app', ['ngResource', 'ngRoute'])

#@app.config [
#  '$routeProvider'
#  '$locationProvider'
#  ($routeProvider, $locationProvider) ->
#    $routeProvider
    # ROOT
#    .otherwise
#      templateUrl: '/templates/main.html',
#      controller: 'HomeCtrl'
#]

#@app.controller 'HomeCtrl', [
#  '$scope'
#  'Question'
#  ($scope, Question) ->
#    $scope.questions = Question.index()

#    $scope.send = ->
#      console.log $scope.qForm["answers"]
      #Students.create { student: $scope.student }, (->
      #  $location.path '/students'
      #), (error) ->
      #  console.log error
#]
