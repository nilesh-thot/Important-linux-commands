#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(void) {
    const char *filename = "demo.txt";
    int fd;

    // Open the file for read and write.
    // If it doesn't exist, create it. If it exists, truncate it.
    fd = open(filename, O_RDWR | O_CREAT | O_TRUNC, 0644);
    if (fd < 0) {
        perror("open");
        exit(EXIT_FAIL  URE);
    }

    // Message to write into the file.
    const char *message = "Hello, Linux System Calls!";
    ssize_t msg_len = strlen(message);

    // Write the message to the file.
    if (write(fd, message, msg_len) != msg_len) {
        perror("write");
        close(fd);
        exit(EXIT_FAILURE);
    }

    // Move the file pointer back to the beginning.
    if (lseek(fd, 0, SEEK_SET) < 0) {
        perror("lseek");
        close(fd);
        exit(EXIT_FAILURE);
    }

    // Buffer to store the message read from the file.
    char buffer[100];
    ssize_t bytes_read = read(fd, buffer, sizeof(buffer) - 1);
    if (bytes_read < 0) {
        perror("read");
        close(fd);
        exit(EXIT_FAILURE);
    }

    // Null-terminate the string to safely print it.
    buffer[bytes_read] = '\0';

    // Print the message read from the file.
    printf("Read from file: %s\n", buffer);

    // Close the file.
    if (close(fd) < 0) {
        perror("close");
        exit(EXIT_FAILURE);
    }

    return 0;
}


