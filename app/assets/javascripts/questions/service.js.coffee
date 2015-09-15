@app.service 'qService', ->
  result = null

  {
    setResult: (res) ->
      result = res
    getResult: ->
      result
  }
