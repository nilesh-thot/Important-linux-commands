# 3. Creating and Managing Multiple Hard Links
# Task:
# a. Create a file data.txt with some content.
# b. Create two hard links (link1.txt and link2.txt) for data.txt.
# c. Modify link2.txt and check if changes are reflected in data.txt and link1.txt
# rm data.txt link1.txt link2.txt
# echo "I wrote some content" > data.txt
# ln data.txt link1.txt
# ln data.txt link2.txt
# echo "\nI am adding some content" >> link1.txt
# diff link1.txt data.txt #link2.txt

# 4. Complex Soft Link Management with Directory Handling
# Task:
# a. Create a directory test_dir and a file dirfile.txt inside it.
# b. Create a soft link (symlink_dir) to test_dir.
# c. List the contents of symlink_dir and verify it points to test_dir.
# d. Delete test_dir and check the status of symlink_dir.
# e. Remove the broken symlink
# rm -r test_dir sym_link_dir
mkdir test_dir
cd test_dir;touch dirfile.txt
cd ..;
ln -s test_dir symlink_dir
sleep 5
rm -r test_dir
ls -li symlink_dir
sleep 5
rm -f symlink_dir