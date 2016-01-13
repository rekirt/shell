#!/bin/bash
# 虽然$#表示参数个数，但是${$#}并不能取到最后一个参数
# 要想取到最后一个参数必须用
echo the last parameter was ${$#}
echo the last parameter was ${!#}
