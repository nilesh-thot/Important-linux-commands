rm -r backup_dir backup_copy
sleep 5
# Create the directory
mkdir backup_dir
cd backup_dir

# Create the file with some content
echo "This is the original file content." > backup_file.txt

# Verify creation
ls -l backup_dir
# Create the hard link INSIDE backup_dir
# ln target link_name
ln backup_file.txt hardlink_to_backup_file

# Create the soft link INSIDE backup_dir
# We'll create a link relative to the parent directory from where we run ln
# This type of relative path is likely to break upon copying the directory
# ln -s target link_name
ln -s backup_file.txt softlink_to_backup_file

sleep 60
# Alternative relative path (from within backup_dir):
# (cd backup_dir && ln -s backup_file.txt softlink_to_backup_file_rel)
# For this demo, the first soft link method clearly shows the breakage upon copy.

# Verify links - Use 'ls -li' to see inodes and link details
echo "--- Contents of backup_dir (original) ---"
ls -li backup_dir

# Use 'cp -a' to preserve links as links
cp -a backup_dir backup_copy

# Verify copy
ls -l backup_copy

echo "--- Contents of backup_copy (copied) ---"
ls -li backup_copy
sleep 30
# 1. Check the hard link in the copy
echo "--- Checking hard link in backup_copy ---"
# Check inode numbers - backup_file.txt and hardlink_to_backup_file
# should have the SAME inode number within backup_copy (different from original dir)
ls -li backup_copy/backup_file.txt backup_copy/hardlink_to_backup_file
# Try to read the content via the hard link
echo "Content via hard link:"
cat backup_copy/hardlink_to_backup_file

# 2. Check the soft link in the copy
echo "--- Checking soft link in backup_copy ---"
# List the link - it should show the original target path
ls -l backup_copy/softlink_to_backup_file
# Try to read the content via the soft link - this should fail
echo "Attempting to read via soft link:"
cat backup_copy/softlink_to_backup_file # Expect 'No such file or directory' error
# Programmatic check for broken link (test -e returns non-zero if path doesn't exist)
test -e backup_copy/softlink_to_backup_file
if [ $? -ne 0 ]; then
  echo "Soft link backup_copy/softlink_to_backup_file is BROKEN (as expected)."
else
  echo "Soft link backup_copy/softlink_to_backup_file is somehow working (unexpected)."
fi