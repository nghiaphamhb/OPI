CUR_PATH="home/studs/s374806/mysvn"
REPO_PATH="file:///$CUR_PATH/repository"

COMM_PATH="../commit"

TRUNK_PATH="$REPO_PATH/trunk"
BRANCHES_PATH="$REPO_PATH/branches"

BRANCH_1_PATH="$BRANCHES_PATH/br1"
BRANCH_2_PATH="$BRANCHES_PATH/br2"
BRANCH_3_PATH="$BRANCHES_PATH/br3"
BRANCH_4_PATH="$BRANCHES_PATH/br4"

rm -rf repository
rm -rf main

svnadmin create repository
mkdir main
svn mkdir "$TRUNK_PATH" -m "create trunk"
svn checkout "$TRUNK_PATH/" main
cd main

# R0 
unzip -o "$COMM_PATH/commit0.zip"
svn add *
svn commit -m r0 --username=red

# R1
svn mkdir "$BRANCHES_PATH" -m "create branches"
svn copy "$TRUNK_PATH" "$BRANCH_4_PATH" -m "create branch 4"
svn switch "$BRANCH_4_PATH"
svn up
svn rm *
unzip -o "$COMM_PATH/commit1.zip"
svn add *
svn commit -m r1 --username=blue

# R2
svn switch "$TRUNK_PATH"
svn up
svn rm *
unzip -o "$COMM_PATH/commit2.zip"
svn add *
svn commit -m r2 --username=red

# R3
svn copy "$TRUNK_PATH" "$BRANCH_2_PATH" -m "create branch 2"
svn switch "$BRANCH_2_PATH"
svn up
svn rm *
unzip -o "$COMM_PATH/commit3.zip"
svn add *
svn commit -m r3 --username=blue

# R4
svn switch "$TRUNK_PATH"
svn up
svn rm *
unzip -o "$COMM_PATH/commit4.zip"
svn add *
svn commit -m r4 --username=red

# R5
svn copy "$TRUNK_PATH" "$BRANCH_1_PATH" -m "create branch 1"
svn switch "$BRANCH_1_PATH"
svn up
svn rm *
unzip -o "$COMM_PATH/commit5.zip"
svn add *
svn commit -m r5 --username=blue

# R6
svn switch "$TRUNK_PATH"
svn up
svn rm *
unzip -o "$COMM_PATH/commit6.zip"
svn add *
svn commit -m r6 --username=red

# R7
svn switch "$BRANCH_2_PATH"
svn up
svn rm *
unzip -o "$COMM_PATH/commit7.zip"
svn add *
svn commit -m r7 --username=blue

# R8
svn switch "$TRUNK_PATH"
svn up
svn rm *
unzip -o "$COMM_PATH/commit8.zip"
svn add *
svn commit -m r8 --username=red

# R9
svn switch "$BRANCH_2_PATH"
svn up
svn rm *
unzip -o "$COMM_PATH/commit9.zip"
svn add *
svn commit -m r9 --username=blue

# R10
svn switch "$BRANCH_4_PATH"
svn up
svn rm *
unzip -o "$COMM_PATH/commit10.zip"
svn add *
svn commit -m r10 --username=blue

# R11
svn switch "$TRUNK_PATH" 
svn up
svn rm *
unzip -o "$COMM_PATH/commit11.zip"
svn add *
svn commit -m r11 --username=red

# R12
svn copy "$TRUNK_PATH" "$BRANCH_3_PATH" -m "create branch 3"
svn switch "$BRANCH_3_PATH"
svn up
svn rm *
unzip -o "$COMM_PATH/commit11.zip"
svn add *
svn commit -m r12 --username=red

# R13
svn switch "$BRANCH_4_PATH"
svn up
svn rm *
unzip -o "$COMM_PATH/commit13.zip"
svn add *
svn commit -m r13 --username=blue

# R14
svn switch "$TRUNK_PATH"
svn up
svn rm *
unzip -o "$COMM_PATH/commit14.zip"
svn add *
svn commit -m r14 --username=red

# R15
svn rm *
unzip -o "$COMM_PATH/commit15.zip"
svn add *
svn commit -m r15 --username=red

# R16
svn switch "$BRANCH_2_PATH"
svn up
svn rm *
unzip -o "$COMM_PATH/commit16.zip"
svn add *
svn commit -m r16 --username=blue

# R17
svn switch "$BRANCH_3_PATH"
svn up
svn merge "$BRANCH_2_PATH" "$BRANCH_3_PATH"
# --- resolve conflict ---
svn mergeinfo "$BRANCH_2_PATH" "$BRANCH_3_PATH"
svn revert *
unzip -o "$COMM_PATH/commit17.zip"
svn add *
svn commit -m r17 --username=red

# R18
svn switch "$BRANCH_1_PATH"
svn up
svn rm *
unzip -o "$COMM_PATH/commit18.zip"
svn add *
svn commit -m r18 --username=blue

# R19
svn rm *
unzip -o "$COMM_PATH/commit19.zip"
svn add *
svn commit -m r19 --username=blue

# R20
svn switch "$BRANCH_4_PATH"
svn up
svn merge "$BRANCH_1_PATH" "$BRANCH_4_PATH"
# --- resolve conflict ---
svn mergeinfo "$BRANCH_1_PATH" "$BRANCH_4_PATH"
svn revert *
unzip -o "$COMM_PATH/commit20.zip"
svn add *
svn commit -m r20 --username=blue

# R21
svn switch "$BRANCH_3_PATH"
svn up
svn merge "$BRANCH_4_PATH" "$BRANCH_3_PATH"
# --- resolve conflict ---
svn mergeinfo "$BRANCH_4_PATH" "$BRANCH_3_PATH"
svn revert *
unzip -o "$COMM_PATH/commit21.zip"
svn add *
svn commit -m r21 --username=red

# R22 
svn switch "$TRUNK_PATH"
svn up
svn merge "$BRANCH_3_PATH" "$TRUNK_PATH"
# --- resolve conflict ---
svn mergeinfo "$BRANCH_3_PATH" "$TRUNK_PATH"
svn revert *
unzip -o "$COMM_PATH/commit22.zip"
svn add *
svn commit -m r22 --username=red

# ---------------------------
read -p "  [Enter to close]   "