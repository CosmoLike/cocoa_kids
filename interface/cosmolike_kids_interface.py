def __bootstrap__():
   global __bootstrap__, __loader__, __file__
   import sys, pkg_resources, imp
   #FLAG
   __file__ = pkg_resources.resource_filename(__name__,'cosmolike_kids_interface.so')
   __loader__ = None; del __bootstrap__, __loader__
   imp.load_dynamic(__name__,__file__)
__bootstrap__()

#also changed name--wasn't sure if the interface is something that can be left as-is or not
