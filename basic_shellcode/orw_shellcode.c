#include <stdio.h>
#include <stdlib.h>

int main(void) {

        FILE    *fp;
        char    buf[0x30];

        if (fp = fopen("/tmp/flag", "r")) {
                fgets(buf, sizeof(buf), fp);
                printf("%s\n", buf);

                fclose(fp);
        }

        return 0;

}
