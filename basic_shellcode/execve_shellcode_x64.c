#define _GNU_SOURCE
#include <stdio.h>
#include <unistd.h>

int main(void) {

        // execve functio is designed for non-NULL function, but it's not important for here
        // because the goal of this program is just run /bin/sh in linux
        execve("/bin/sh", NULL, NULL);

        return 0;

}
