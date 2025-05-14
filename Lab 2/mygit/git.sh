rm -rf Lab2_OPI 

git clone https://nghiaphamhb:<token>@github.com/nghiaphamhb/Lab2_OPI.git

echo ">>> The repository has cloned. "

cd Lab2_OPI

git config --global user.name red
git config --global user.email red@gmail.com
echo ">>> Red user was created."

echo  "==== r0 - USER: RED ===="
unzip -o ../commit/commit0.zip 
git add .
git commit -m "r0"
git fetch
git push

echo "==== r1 - USER: BLUE ===="

echo ">>> Blue user was created."
git checkout -b br4
unzip -o ../commit/commit1.zip 
git add .
git commit --author="blue <blue@gmail.com>" -m "r1"
git fetch
git push origin br4

echo  "==== r2 - USER: RED ===="

git checkout main 
unzip -o ../commit/commit2.zip 
git add .
git commit -m "r2"
git fetch
git push

echo  "==== r3 - USER: BLUE ===="

git checkout -b br2
unzip -o ../commit/commit3.zip 
git add .
git commit --author="blue <blue@gmail.com>" -m "r3"
git fetch
git push origin br2

echo  "==== r4 - USER: RED ===="

git checkout main 
unzip -o ../commit/commit4.zip 
git add .
git commit -m "r4"
git fetch
git push

echo  "==== r5 - USER: BLUE ===="

git checkout -b br1
unzip -o ../commit/commit5.zip 
git add .
git commit --author="blue <blue@gmail.com>" -m "r5"
git fetch
git push origin br1

echo  "==== r6 - USER: RED ===="

git checkout main
unzip -o ../commit/commit6.zip 
git add .
git commit -m "r6"
git fetch
git push

echo  "==== r7 - USER: BLUE ===="

git checkout br2
unzip -o ../commit/commit7.zip 
git add .
git commit --author="blue <blue@gmail.com>" -m "r7"
git fetch
git push origin br2

echo  "==== r8 - USER: RED ===="

git checkout main 
unzip -o ../commit/commit8.zip 
git add .
git commit -m "r8"
git fetch
git push

echo  "==== r9 - USER: BLUE ===="

git checkout br2
unzip -o ../commit/commit9.zip 
git add .
git commit --author="blue <blue@gmail.com>" -m "r9"
git fetch
git push origin br2

echo  "==== r10 - USER: BLUE ===="
git checkout br4
unzip -o ../commit/commit10.zip 
git add .
git commit --author="blue <blue@gmail.com>" -m "r10"
git fetch
git push origin br4

echo  "==== r11 - USER: RED ===="

git checkout main
unzip -o ../commit/commit11.zip 
git add .
git commit -m "r11"
git fetch
git push

echo  "==== r12 - USER: RED ===="
git checkout -b br3
unzip -o ../commit/commit12.zip 
git add .
git commit -m "r12"
git fetch
git push origin br3

echo  "==== r13 - USER: BLUE ===="

git checkout br4
unzip -o ../commit/commit13.zip 
git add .
git commit --author="blue <blue@gmail.com>" -m "r13"
git fetch
git push origin br4

echo  "==== r14 - USER: RED ===="

git checkout main
unzip -o ../commit/commit14.zip 
git add .
git commit -m "r14"
git fetch
git push

echo  "==== r15 - USER: RED ===="
unzip -o ../commit/commit15.zip 
git add .
git commit -m "r15"
git fetch
git push

echo  "==== r16 - USER: BLUE ===="

git checkout br2
unzip -o ../commit/commit16.zip 
git add .
git commit --author="blue <blue@gmail.com>" -m "r16"
git fetch
git push origin br2

echo  "==== r17 - USER: RED ===="

git checkout br3
git fetch 
git merge origin/br2 --allow-unrelated-histories

unzip -o ../commit/commit17.zip 
git add .
git commit -m "r17"
git fetch
git push origin br3

echo  "==== r18 - USER: BLUE ===="

git checkout br1
unzip -o ../commit/commit18.zip 
git add .
git commit --author="blue <blue@gmail.com>" -m "r18"
git fetch
git push origin br1

echo  "==== r19 - USER: BLUE ===="
unzip -o ../commit/commit19.zip 
git add .
git commit --author="blue <blue@gmail.com>" -m "r19"
git fetch
git push origin br1

echo  "==== r20 - USER: BLUE ===="
git checkout br4
git fetch
git merge origin/br1 --allow-unrelated-histories

unzip -o ../commit/commit20.zip 
git add .
git commit --author="blue <blue@gmail.com>" -m "r20"
git fetch
git push origin br4

echo  "==== r21 - USER: RED ===="

git checkout br3
git fetch
git merge origin/br4 --allow-unrelated-histories

unzip -o ../commit/commit21.zip 
git add .
git commit -m "r21"
git fetch
git push origin br3

echo  "==== r22 - USER: RED ===="
git checkout main
git fetch
git merge origin/br3 --allow-unrelated-histories

unzip -o ../commit/commit22.zip 
git add .
git commit -m "r22"
git fetch
git push

echo "----------GRAPH---------------"
# gitk --all
read -p "  [Enter to close]   "
