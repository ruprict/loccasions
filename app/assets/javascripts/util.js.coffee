window.UTIL =
  exec: ( controller, action )->
    ns =  App
    action or= "init"

    if ( controller != "" && ns[controller] && typeof ns[controller][action] == "function" )
      ns[controller][action]()

  init: ->
    body = document.body
    controller = body.getAttribute( "data-controller" )
    action = body.getAttribute( "data-action" )

    UTIL.exec( "common" )
    UTIL.exec( controller )
    UTIL.exec( controller, action )
  parseFormAttributes: (form, objType) ->
    objRegex = new RegExp("^" + objType)
    _.inject(
      form.serializeArray(),
      (memo, pair) ->
        key = pair.name
        return memo unless objRegex.test(key)
        val = pair.value
        if key.indexOf('[') > 0
          parentKey = key.substr(0, key.indexOf('['))
          childKey = key.split('[')[1].split(']')[0]
          if typeof memo[parentKey] == "undefined"
            memo[parentKey] = {}
          
          memo[parentKey][childKey] = val
        else
          memo[key] = val
        
        return memo
    ,{})
  
$(UTIL.init)

