@app = angular.module('app', ['ngResource', 'ngRoute'])

@app.config ['$httpProvider', ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]

@app.config [
  '$routeProvider'
  '$locationProvider'
  ($routeProvider, $locationProvider) ->
    $routeProvider
    .when '/result',
      templateUrl: '/templates/result.html'
      controller: 'ResultCtrl'
    # ROOT
    .when '/',
      templateUrl: '/templates/main.html',
      controller: 'HomeCtrl'
]

@app.controller 'HomeCtrl', [
  '$scope'
  '$location'
  'Question'
  'qService'
  ($scope, $location, Question, qService) ->
    $scope.questions = Question.index()
    $scope.quiz = {}

    $scope.send = ->
      req = makeRequest $scope.quiz.answer
      qService.setResult Question.create { json: [ req ] }
      $location.path '/result'

    makeRequest = (data) ->
      answers = {}
      angular.forEach data, (v, k) ->
        if typeof(v) == 'object'
          answers[k] = { value: Object.keys(v) }
        else
          answers[k] = { value: [v] }
      return answers
]

@app.controller 'ResultCtrl', [
  '$scope'
  '$resource'
  'qService'
  ($scope, $resource, qService) ->
    $scope.title = 'Result'
    $scope.result = qService.getResult()
]
