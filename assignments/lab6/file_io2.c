#include <stdio.h>      // For printf(), fprintf(), perror()
#include <stdlib.h>     // For exit(), EXIT_FAILURE
#include <unistd.h>     // For link(), symlink(), unlink(), rename(), rmdir()
#include <sys/stat.h>   // For mkdir()

int main(int argc, char *argv[]) {
    int ret; // Variable to store return values from system calls

    /* --- Directory Operations --- */
    // Create a directory named "demo_dir" with permissions 0755.
    ret = mkdir("new_dir3", 755);
    if (ret < 0) {
        perror("mkdir");
        exit(EXIT_FAILURE);
    }
    printf("Directory 'demo_dir' created.\n");

    // Rename directory to "demo_dir_renamed" (like mv command).
    ret = rename("new_dir3", "demo_dir_renamed");
    if (ret < 0) {
        perror("rename directory");
        exit(EXIT_FAILURE);
    }
    printf("Directory renamed to 'demo_dir_renamed'.\n");

    // Remove the renamed directory. rmdir only works if the directory is empty.
    ret = rmdir("demo_dir_renamed");
    if (ret < 0) {
        perror("rmdir");
        exit(EXIT_FAILURE);
    }
    printf("Directory 'demo_dir_renamed' removed.\n");

    /* --- Link Operations --- */
    // For demonstration, a target file must be provided.
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <target_file>\n", argv[0]);
        exit(EXIT_FAILURE);
    }
    char *target = argv[1];

    // Create a hard link to the target file. (Similar to ln command.)
    ret = link(target, "hardlink_demo");
    if (ret < 0) {
        perror("link");
        exit(EXIT_FAILURE);
    }
    printf("Hard link 'hardlink_demo' created for %s.\n", target);

    // Create a symbolic link to the target file. (Similar to ln -s command.)
    ret = symlink(target, "symlink_demo");
    if (ret < 0) {
        perror("symlink");
        exit(EXIT_FAILURE);
    }
    printf("Symbolic link 'symlink_demo' created for %s.\n", target);

    // Rename the symbolic link to "symlink_demo_renamed" (like mv command).
    ret = rename("symlink_demo", "symlink_demo_renamed");
    if (ret < 0) {
        perror("rename symlink");
        exit(EXIT_FAILURE);
    }
    printf("Symbolic link renamed to 'symlink_demo_renamed'.\n");

    // Remove the hard link (like rm command, but doesn't remove the file's content).
    ret = unlink("hardlink_demo");
    if (ret < 0) {
        perror("unlink hard link");
        exit(EXIT_FAILURE);
    }
    printf("Hard link 'hardlink_demo' removed.\n");

    // Remove the symbolic link.
    ret = unlink("symlink_demo_renamed");
    if (ret < 0) {
        perror("unlink symlink");
        exit(EXIT_FAILURE);
    }
    printf("Symbolic link 'symlink_demo_renamed' removed.\n");

    return 0;
}
