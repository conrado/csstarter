# <%= slug %>
# =========
#
# **<%= slug %>** was generated from generator-csstarter. Here is a sample function.
#
# ## *extend*
#
# extends an object with the properties of others
#
# **given** arguments with objects  
# **then**  add all properties from second through to last objects to first
#           object  
# **and**   return first object

@extend = ->
  for i in [1..arguments.length]
    for key of arguments[i]
      if arguments[i].hasOwnProperty key
        arguments[0][key] = arguments[i][key]
  arguments[0]
