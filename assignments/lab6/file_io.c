#include <fcntl.h>      // For open, O_RDWR, O_CREAT, O_TRUNC, etc.
#include <unistd.h>     // For close, write, read, lseek, ftruncate, etc.
#include <stdio.h>      // For perror, printf
#include <string.h>     // For strlen
#include <stdlib.h>     // For exit

int main(void) {
    const char *filename = "assignment6.txt";
    int fd; // File descriptor

    /*
     * int open(const char *path, int oflag, ... );
     * Here, we open the file for reading and writing (O_RDWR),
     * create it if it doesn't exist (O_CREAT), and truncate it (O_TRUNC).
     */
    fd = open(filename, O_RDWR, 644);
    if (fd < 0) {
        perror("open");
        exit(EXIT_FAILURE);
    }

    // Write a message to the file.
    const char *message = "Hello, Linux System Calls!";
    ssize_t msg_len = strlen(message);
    if (write(fd, message, msg_len) != msg_len) {
        perror("write");
        close(fd);
        exit(EXIT_FAILURE);
    }

    // Use lseek to move the file pointer to the beginning.
    // off_t lseek(int fildes, off_t offset, int whence);
    if (lseek(fd, 0, SEEK_SET) < 0) {
        perror("lseek");
        close(fd);
        exit(EXIT_FAILURE);
    }

    // Read the file's content back into a buffer.
    char buffer[100];
    ssize_t bytes_read = read(fd, buffer, sizeof(buffer) - 1);
    if (bytes_read < 0) {
        perror("read");
        close(fd);
        exit(EXIT_FAILURE);
    }
    buffer[bytes_read] = '\0'; // Null-terminate the string.
    printf("Read from file: %s\n", buffer);

    // Truncate the file to 10 bytes using ftruncate.
    if (ftruncate(fd, 10) < 0) {
        perror("ftruncate");
        close(fd);
        exit(EXIT_FAILURE);
    }

    // Verify truncation by moving pointer to the end and checking file size.
    off_t new_size = lseek(fd, 0, SEEK_END);
    if (new_size < 0) {
        perror("lseek to SEEK_END");
        close(fd);
        exit(EXIT_FAILURE);
    }
    printf("File size after truncation: %ld bytes\n", new_size);

    // Close the file.
    if (close(fd) < 0) {
        perror("close");
        exit(EXIT_FAILURE);
    }

    
    return 0;
}
