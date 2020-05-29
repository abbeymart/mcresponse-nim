#
#              mconnect solutions
#        (c) Copyright 2020 Abi Akindele (mconnect.biz)
#
#    See the file "LICENSE.md", included in this
#    distribution, for details about the copyright / license.
# 
#             Response Message Package
#

## This the entry point to the mcresponse package 
## 
## 

import mcresponse/resMessage
import mcresponse/resMessages

export resMessage, resMessages

proc add*(x, y: int): int =
  ## Adds two files together.
  return x + y
