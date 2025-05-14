#!/bin/bash

CUR_PATH="D:/Desktop/IMPORTANT_STUDY/OPI/Lab 3/mysvn"
REPO_PATH="file:///$CUR_PATH/repository"
TRUNK_PATH="$REPO_PATH/trunk"

# Xóa repository và working copy cũ (nếu có)
rm -rf "$CUR_PATH/repository"
rm -rf "$CUR_PATH/main"

# Tạo repository mới
svnadmin create "$CUR_PATH/repository"

# Tạo thư mục trunk trong repository
svn mkdir "$TRUNK_PATH" -m "create trunk"

# Checkout thư mục trunk vào thư mục local 'main'
svn checkout "$TRUNK_PATH" "$CUR_PATH/main"
