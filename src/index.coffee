
@extend = ->
  for i in [1..arguments.length]
    for key of arguments[i]
      if arguments[i].hasOwnProperty key
        arguments[0][key] = arguments[i][key]
  arguments[0]
