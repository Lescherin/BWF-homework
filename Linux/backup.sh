#!/bin/bash

# 定义全局变量
BACKUP_SUFFIX=$(date +%Y%m%d_%H%M%S)
OLD_BACKUPS_DAYS=7

#定义函数:输出脚本帮助信息
#$1 源文件/目录
#$2 备份目录
function show_help(){
    echo "使用方法： $0 [源文件/目录] [备份目录]"
    echo "示例：$0 /home/lesch/data /home/lesch/backup"
    echo "功能：备份指定文件或目录到指定备份目录，支持压缩、自动创建备份目录、删除7天前旧备份"
    exit 1
}

# 定义函数：执行备份操作
#$1 源文件/目录
#$2 备份目录
function do_backup() {
    local source_path=$1
    local backup_dir=$2

    #1.获取源文件/目录的基本名称 （用于备份文件名）
    local src_name= $(basename "source_path")
    local backup_file = "${backup_dir}/${src_name}_$(BACKUP_SUFFIX)"


     #2.执行压缩备份
    echo "开始备份：${source_path} 到 ${backup_file}"
    if tar -czvf "${backup_file}" "${source_path}"   > /dev/null 2>&1
    then
        echo "备份成功：${backup_file}"
    else
        echo "备份失败,请检查源文件/目录是否存在$source_path"
        rm -f "${backup_file}"
        return 1
    fi
}

#定义函数：删除旧备份
function delet_old_backup(){
    local backup_dir=$1
    local src_name= $(basename "$2")

    echo "开始删除${OLD_BACKUPS_DAYS}天前的旧备份"
    find "${backup_dir}/${src_name}" -type f -name "*_${OLD_BACKUPS_DAYS}*" -exec rm -f {} \;
    #$? 删除命令执行结果
    echo "删除命令执行结果：$?"
    #判断删除是否成功
    if [ $? -eq 0 ]
    then
        echo "删除${OLD_BACKUPS_DAYS}天前的旧备份成功"
        return 0
    else
        echo "删除${OLD_BACKUPS_DAYS}天前的旧备份失败"
        return 1
    fi

}

# 主逻辑开始
# 1. 验证参数个数（必须传入2个参数）
if [[ $# -ne 2 ]]
then
    echo "参数个数错误,必须传入2个参数"
    show_help
fi

# 2. 赋值参数变量
CUR_SRC_PATH=$1
CUR_BACKUP_DIR=$2

# 3. 验证源文件/目录是否存在
#-e 表示文件或目录存在
if ! [[ -e "${CUR_SRC_PATH}" ]]
then
    echo "源文件/目录不存在！${CUR_SRC_PATH}未创建 请检查路径是否正确"
    exit 1
fi

# 4. 验证并创建备份目录
#-d 表示目录存在
if ! [[ -d "${CUR_BACKUP_DIR}" ]]
then
    echo "备份目录不存在！${CUR_BACKUP_DIR}未创建，正在创建。。。"
    if mkdir -p  "$CUR_BACKUP_DIR"
    then
        echo "备份目录创建成功！"
    else
        echo "错误：备份目录：${CUR_BACKUP_DIR} 创建失败 请检查权限"
        exit 1
    fi
fi


# 5. 执行备份操作
if ! do_backup "${CUR_SRC_PATH}" "${CUR_BACKUP_DIR}"
then
    exit 1
fi


# 6. 删除旧备份
# 调用删除旧备份函数
delet_old_backup "${CUR_BACKUP_DIR}" "${CUR_SRC_PATH}"


# 7. 脚本执行完成
echo "备份脚本执行完成"
exit 0
