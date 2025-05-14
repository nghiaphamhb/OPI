#!/bin/bash

# Đường dẫn tới file WAR đã build
WAR_PATH="D:/Desktop/IMPORTANT_STUDY/OPI/Lab 3/target/WEB-LAB3-1.0.war"

# Đường dẫn đến working copy đã checkout
DEST_DIR="D:/Desktop/IMPORTANT_STUDY/OPI/Lab 3/mysvn/main"

# Copy file WAR vào working copy
cp "$WAR_PATH" "$DEST_DIR/WEB-LAB3-1.0.war"

# Di chuyển vào working copy
cd "$DEST_DIR"

# Thêm file vào SVN (nếu chưa được theo dõi)
svn add WEB-LAB3-1.0.war --force

# Kiểm tra có message truyền từ dòng lệnh không
if [ -z "$1" ]; then
    echo -n "Enter commit message: "
    read msg
else
    msg="$1"
fi

# Commit vào repository
svn commit -m "$msg"
