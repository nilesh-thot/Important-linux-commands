// (2) Write a C language script that: [15]
// a. Creates a child process using a simple program (e.g., printing "Child process running").
// b. The parent process waits for 5 seconds and then terminates the child process.
// c. Prints a message confirming the termination of the child process.

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>//for wait_pid
#include <signal.h>
int main(){
    pid_t pid;
    pid=fork();
    if (pid==0){
        while(1){
            printf("Child process running\n");
            sleep(1);
        }

    }
    else if (pid > 0){
        sleep(5);
        printf("Killing the child process\n");
        kill(pid,SIGKILL);
        int status;
        waitpid(pid,&status,0);
        printf("Child process terminated with status %d\n",status);
    }
    else {
        printf("Failed to create child process\n");
        return 1;
    }

    
    return 0;
}
