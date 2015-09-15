@app.factory 'Question', ($resource) ->
  $resource '/api/v1/questions', {},
    'create':
      method: 'POST'
      isArray: true
    'index':
      method: 'GET'
      isArray: true
