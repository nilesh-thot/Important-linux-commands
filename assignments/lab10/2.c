// (3) Write a C program that: [20]
// a. The parent process generates a range of numbers (e.g., 1 to 20).
// b. The parent calculates the sum of all odd numbers in the range and sends the range to the child
// process using a pipe.
// c. The child process calculates the sum of all even numbers in the range and sends the result back to the
// parent process.
// d. The parent prints both sums (odd and even).

#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

int main(){
    int pipefd1[2],pipefd2[2];
    pipe(pipefd1);
    pipe(pipefd2);
    int range[20];
    int sumodd=0,sumeven=0;
    for (int i=0;i<20;i++){
        range[i]=i+1;
    }
    pid_t pid =fork();
    if (pid==0){
        int range_child[20],childsumeven=0;
        close(pipefd1[1]);
        read(pipefd1[0],range_child,sizeof(range_child));
        close(pipefd1[0]);
        for (int i=0;i<20;i++){
            if (range_child[i]%2==0){
                childsumeven+=range_child[i];
            }
        }
        close(pipefd2[0]);
        write(pipefd2[1],&childsumeven,sizeof(childsumeven));
        close(pipefd2[1]);
        
    }
    else if (pid>0){
        close(pipefd1[0]);//Closing the read end
        for (int i=0;i<20;i++){
            if (range[i]%2!=0){
                sumodd+=range[i];
            }
        }
        write(pipefd1[1],range,sizeof(range));
        close(pipefd1[1]);
        int status;
        waitpid(pid,&status,0);
        close(pipefd2[1]);
        read(pipefd2[0],&sumeven,sizeof(sumeven));
        close(pipefd2[0]);
        printf("Sum of odd numbers is %d\n",sumodd);
        printf("Sum of even numbers is %d\n",sumeven);
        printf("Sum of total numbers is %d\n",sumeven+sumodd);
    }
    else{
        printf("Failed to fork\n");
        return 1;
    }

}