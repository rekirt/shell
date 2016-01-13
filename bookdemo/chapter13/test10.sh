#!/bin/bash
# ${$#}并不能取到最后一个参数
params=$#
echo the last parameter is $params
echo the last parameter is ${!#}

#当该命令有参数时，${!#}返回最后一个参数，当该命令没有参数时返回命令的名称

