#@app.factory 'Question', ($resource) ->
#  $resource '/api/v1/questions/:id', { id: '@id' },
#    'create': method: 'POST'
#    'index':
#      method: 'GET'
#      isArray: true
