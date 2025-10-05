#!/bin/sh

path_sh=$(nv get path_sh)
. $path_sh/global.sh

echo "Info: tc_tbf $1 $2 start"
echo "Info: tc_tbf $1 $2 start" >> $test_log

# 获取配置
UPLINK=$(nv get tc_uplink)
DOWNLINK=$(nv get tc_downlink)
def_cid=$(nv get default_cid)
tc_enable=$(nv get tc_enable)

# 检查 tc_enable 状态
if [ "$tc_enable" = "0" ]; then
    echo "tc_enable=0"
    echo "tc_enable=0" >> $test_log
    exit 0
fi

# 保留网络队列设置，但不限制速度
need_jilian=$(nv get need_jilian)
lanEnable=$(nv get LanEnable)

if [ "$need_jilian" = "1" ]; then
    if [ "$lanEnable" = "1" ]; then
        IN=$(nv get lan_name)
    elif [ "$lanEnable" = "0" ]; then
        IN=$(nv get "ps_ext"$def_cid)
    fi
elif [ "$need_jilian" = "0" ]; then
    IN=$(nv get lan_name)
fi

OUT4=$defwan_rel
OUT6=$defwan6_rel

if [ "$lanEnable" = "1" ]; then
    GATEWAY=$(nv get lan_ipaddr)
fi

echo "IN=$IN, OUT4=$OUT4, OUT6=$OUT6, GATEWAY=$GATEWAY, DOWNLINK=$DOWNLINK, UPLINK=$UPLINK"
echo "IN=$IN, OUT4=$OUT4, OUT6=$OUT6, GATEWAY=$GATEWAY, DOWNLINK=$DOWNLINK, UPLINK=$UPLINK" >> $test_log

# 清理历史规则（保留基本队列）
tc qdisc del dev $IN root
if [ "$OUT4" != "" ]; then
    tc qdisc del dev $OUT4 root
fi
if [ "$OUT6" != "" ] && [ "$OUT6" != "$OUT4" ]; then
    echo "clear tc for $OUT6"
    tc qdisc del dev $OUT6 root
fi

# 配置基本队列
ifconfig $IN txqueuelen 1000
if [ "$OUT4" != "" ]; then
    ifconfig $OUT4 txqueuelen 1000
fi
if [ "$OUT6" != "" ] && [ "$OUT6" != "$OUT4" ]; then
    ifconfig $OUT6 txqueuelen 1000
fi

# 处理 down 参数
if [ "$1" = "down" ] || [ "$1" = "DOWN" ]; then
    echo "traffic control down"
    echo "traffic control down" >> $test_log
    exit 0
fi
