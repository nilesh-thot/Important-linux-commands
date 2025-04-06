// 2. Write a C program that:
// a. Create a new directory named test_dir with permissions 755.
// b. Change the current working directory to test_dir.
// c. Create a file named inside.txt in the new directory.
// d. Write some text into inside.txt.
// e. Rename inside.txt to renamed.txt.
// f. Navigate back to the parent directory and remove test_dir (after deleting its content).
#include <string.h>
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>//for exit EXIT_FAILURE
#include <sys/stat.h> //for mkdir
#include <unistd.h> //for symlink(),unlink(),rename(),rmdir()


int main(){
    int return_value=mkdir("test_dir",755);
    if (return_value<0){
        perror("Error in creating directory");
        exit(EXIT_FAILURE);
    }
    return_value=chdir("test_dir");
    int fd=open("inside.txt",O_RDWR|O_CREAT|O_TRUNC,644);
    if (fd<0){
        perror("Error in creating file");
        exit(EXIT_FAILURE);
    }
    char* text="Hello,world I am writing this into file";
    ssize_t msg_len=strlen(text);
    if (write("inside.txt",text,msg_len)!=msg_len){
        perror("Erro in writing to the file");
        close(fd);
        exit(EXIT_FAILURE);
    }
    close(fd);
    if (rename("inside.txt","renamed.txt")<0){
        perror("Error in renaming the file");
        close(fd);
        exit(EXIT_FAILURE);
    }
    
    if (chdir("..")<0){
        perror("Error in changing directory");
        exit(EXIT_FAILURE);
    }
    if (remove("test_dir/renamed.txt")<0){
        perror("Error in removing the file");
        exit(EXIT_FAILURE);
    }

    if (rmdir("test_dir")<0){
        perror("Error in removing the directory");
        exit(EXIT_FAILURE);
    }

    
    // chdir("")

    return 0;
}