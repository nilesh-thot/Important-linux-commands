// 1. Write a C program that:
// a. Open (or create) a file named assignment6.txt using the system call.
// b. Write the string "Hello, System Programming with C!" to the file.
// c. Move the file pointer to the beginning of the file.
// d. Read the entire content into a buffer.
// e. Print the content to the standard output.
// f. Truncate the file to 10 bytes.
// g. Compute and print the new file size.
// h. Re-read the file (after repositioning to the beginning) and print the truncated content.
// i. Close the file.

/********************************Answer******************************************************* */
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
int main() {
    const char* filename="assignment6.txt";
    int fd=open(filename,O_RDWR,644);//file descriptor
    if (fd==-1){
        perror("Open");
        exit(EXIT_FAILURE);
    }
    const char* message="Hello, System Programming with C!";
    ssize_t msg_len=strlen(message);
    if (write(fd,message,msg_len)!=msg_len){
        perror("Error in writing to the file");
        close(fd);
        exit(EXIT_FAILURE);
    }
    if (lseek(fd,0,SEEK_SET)==-1){
        perror("Error in moving the file pointer to the beginning ");
        close(fd);
        exit(EXIT_FAILURE);
    }
    char buffer[100];
    ssize_t bytes_read=read(fd,buffer,sizeof(buffer)-1);
    if (bytes_read<0){
        perror("Error in reading the file");
        close(fd);
        exit(EXIT_FAILURE);
    }
    buffer[bytes_read]='\0';
    printf("The content read from the file is :\n%s",buffer);
    
    if(ftruncate(fd,10)<0){
        perror("Error in truncating the file");
        close(fd);
        exit(EXIT_FAILURE);
    }

    ssize_t new_size=lseek(fd,0,SEEK_END);
    if (new_size<0){
        perror("Error in moving the file pointer");
        close(fd);
        exit(EXIT_FAILURE);
    }
    printf("File size after truncation is %ld bytes\n",new_size);

    if (lseek(fd,0,SEEK_SET)<0){
        perror("Error in moving the file pointer to the beginning");
        close(fd);
        exit(EXIT_FAILURE);
    }

    ssize_t bytes_read2=read(fd,buffer,sizeof(buffer)-1);
    if (bytes_read2<0){
        perror("Error in reading the file");
        close(fd);
        exit(EXIT_FAILURE);
    }
    buffer[bytes_read2]='\0';
    printf("The content read from the file after truncation is :\n%s",buffer);
    if (close(fd)<0){
        perror("Error in closing the file");
        exit(EXIT_FAILURE);
    }
    
    return 0;
}
