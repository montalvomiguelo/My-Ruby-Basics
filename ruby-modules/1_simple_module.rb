# Modules follow same rules as classes and use camel case for naming
# keyword module and ends with end keyword
module SimpleModule
  # Constant syntax: uppercase, will never change
  VERSION = 1.0
end

# In order to acces stuff inside the module we use :: Constant resolution operator
puts SimpleModule::VERSION
