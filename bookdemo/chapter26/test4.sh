#!/bin/bash
#
#删除系统账户
#1 获取要删除用户账户的正确名称,
#2 强制终止正在系统上运行的属于该账户的进程
#3 确认系统上属于该账户的所有文件
#4 删除系统账户

#获取输入结果
function get_answer {
  unset ANSWER
  ASK_COUNT=0
  while [ -z "$ANSWER" ] ; do  #用户没有输入结果时,等待用户输入
    ASK_COUNT=$[ $ASK_COUNT + 1 ]
    case $ASK_COUNT in
      2)
        echo 
	echo "还有2次机会"
        echo 
      ;;
      3)
        echo 
	echo "还有1次机会"
	echo 
      ;;
      4)
        echo 
	echo "没有任何操作"
	echo "退出脚本"
	echo

	exit
      ;;
    esac
    
    echo 
    if [ -n "$LINE1" ] ; then
      echo -e $LINE1" \c"
    fi
    # 60s的等待时间
    read -t 60 ANSWER

  done
unset LINE1

}

#处理输入结果
function process_answer {
  case $ANSWER in 
  y|Y|YES|yes|Yes|yEs|yeS|YEs|yES )
    #继续执行后续代码   
  ;; 
  *)
    #退出脚本
    echo 
    echo $EXIT_LINE1
    echo
    
    exit
  ;;
  esac
#清除变量
unset EXIT_LINE1

}


###############################################
# 获取将要删除的账户名称
echo "#####################################################"
echo "删除系统用户脚本                                     "
echo "                                                     "
echo "author:  `uname -n`                                  "
echo "date:  `date +%Y-%m-%d      `                        "
echo "#####################################################"


LINE1="请输入要删除用户的名称"
get_answer

USER_ACCOUNT=$ANSWER

LINE1="你确定要删除 $USER_ACCOUT 账户吗? [y/n]"
get_answer

EXIT_LINE1=" 撤销了对 $USER_ACCOUNT 账户的删除操作 "
process_answer

#################
# 删除账户是否存在
#
USER_ACCOUNT_RECORD=$(cat /etc/passwd | grep -w $USER_ACCOUNT)

if [ $? -eq 1 ] ; then
  echo 
  echo " $USER_ACCOUNT 账户不存在"
  echo "退出脚本"
  echo

  exit

fi

echo 
echo "查找到一条记录"
echo "$USER_ACCOUNT_RECORD"
echo 
LINE1="确定要要删除该账户吗? [y/n]"
get_answer

EXIT_LINE1="取消删除 $USER_ACCOUNT, 退出脚本"
process_answer

#################
#查看属于该账户的进程
#
echo "$USER_ACCOUNT 的进程:"
echo 
ps -u $USER_ACCOUNT

case $? in 
  1)
    echo "当前账户没有正在运行的进程"
    echo
  ;;
  0)
    unset ANSWER
    LINE1="是否结束下列进程? [y/n]"
    get_answer
    case $ANSWER in 
      y|Y|YES|yes|Yes|yEs|yeS|YEs|yES)
        echo
        trap "rm $USER_ACCOUNT_Running_Process.rpt" SIGTERM SIGINT SIGQUIT
        ps -u $USER_ACCOUNT > $USER_ACCOUNT_Running_Process.rpt
        exec < $USER_ACCOUNT_Running_Process.rpt
        read USER_PROCESS_REC
        read USER_PROCESS_REC
        while [ $? -eq 0 ] ; do
          USER_PID=$(echo $USER_PROCESS_REC | cut -d " " -f1)
          kill -9 $USER_PID
          echo "结束进程 $USER_PID"
          read USER_PROCESS_REC
        done
        echo 
        rm $USER_ACCOUNT_Running_Process.rpt
      ;;
      *)
        echo
        echo "用户选择退出结束进程"
        echo 
      ;;
    esac
  ;;
esac
#################
#查找删除账户的所有文件
#
echo "查找该账户所有文件"
REPORT_DATE=`date +%Y%m%d`
REPORT_FILE=$USER_ACCOUNT"_Files_"$REPORT_DATE".rpt"
find /home/ -user $USER_ACCOUNT > $REPORT_FILE 2>/dev/null

echo 
echo "报告生成完毕"
echo "报告名称: $REPORT_FILE"
echo "报告位置:		`pwd`"


#################
#删除账户
#
LINE1="你确定要将$USER_ACCOUNT从系统中删除吗?[y/s]"
get_answer
EXIT_LINE1="撤消了对$USER_ACCOUNT账户的删除操作"
process_asswer
userdel $USER_ACCOUNT
echo 
echo "账户 $USER_ACCOUNT已经被移除"
echo







