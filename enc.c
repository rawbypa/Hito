#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <arpa/inet.h>
                          //0xdeadbeef

uint32_t table_key = 0xdeadbeef;
uint32_t table_key2 = 0x85dab8bf;
uint32_t table_key3 = 0xdeedeebf;
uint32_t table_key4 = 0xdeabbeaf;
uint32_t table_key5 = 0xdbbd45bf;
uint32_t table_key6 = 0x246584ef;
uint32_t table_key7 = 0x85bfe8bf;
uint32_t table_key8 = 0xd68395bf;
uint32_t table_key9 = 0xdbaaaaaf;
uint32_t table_key10 = 0xdaabeef;


void *x(void *, int);

int main(int argc, char **args)
{
    void *data;
    int len, i;

    if (argc != 3)
    {
        printf("Usage: %s <string | ip | uint32 | uint16 | uint8 | bool> <data>\n", args[0]);
        return 0;
    }

    if (strcmp(args[1], "string") == 0)
    {
        data = args[2];
        len = strlen(args[2]) + 1;
    }
    else if (strcmp(args[1], "ip") == 0)
    {
        data = calloc(1, sizeof (uint32_t));
        *((uint32_t *)data) = inet_addr(args[2]);
        len = sizeof (uint32_t);
    }
    else if (strcmp(args[1], "uint32") == 0)
    {
        data = calloc(1, sizeof (uint32_t));
        *((uint32_t *)data) = htonl((uint32_t)atoi(args[2]));
        len = sizeof (uint32_t);
    }
    else if (strcmp(args[1], "uint16") == 0)
    {
        data = calloc(1, sizeof (uint16_t));
        *((uint16_t *)data) = htons((uint16_t)atoi(args[2]));
        len = sizeof (uint16_t);
    }
    else if (strcmp(args[1], "uint8") == 0)
    {
        data = calloc(1, sizeof (uint8_t));
        *((uint8_t *)data) = atoi(args[2]);
        len = sizeof (uint8_t);
    }
    else if (strcmp(args[1], "bool") == 0)
    {
        data = calloc(1, sizeof (char));
        if (strcmp(args[2], "false") == 0)
            ((char *)data)[0] = 0;
        else if (strcmp(args[2], "true") == 0)
            ((char *)data)[0] = 1;
        else
        {
            printf("Unknown value `%s` for datatype bool!\n", args[2]);
            return -1;
        }
        len = sizeof (char);
    }
    else
    {
        printf("Unknown data type `%s`!\n", args[1]);
        return -1;
    }

    // Yes we are leaking memory, but the program is so
    // short lived that it doesn't really matter...
    printf("XOR'ing %d bytes of data...\n", len);
    data = x(data, len);
    for (i = 0; i < len; i++)
        printf("\\x%02X", ((unsigned char *)data)[i]);
    printf("\n");
}

void *x(void *_buf, int len)
{
    unsigned char *buf = (char *)_buf, *out = malloc(len);
    int i;
    uint8_t k1 = table_key & 0xff,
            k2 = (table_key >> 8) & 0xff,
            k3 = (table_key >> 16) & 0xff,
            k4 = (table_key >> 24) & 0xff,
            k5 = table_key2 & 0xff,
            k6 = (table_key2 >> 8) & 0xff,
            k7 = (table_key2 >> 16) & 0xff,
            k8 = (table_key2 >> 24) & 0xff,
            k9 = table_key3 & 0xff,
            k10 = (table_key3 >> 8) & 0xff,
            k11 = (table_key3 >> 16) & 0xff,
            k12 = (table_key3 >> 24) & 0xff,
            k13 = table_key4 & 0xff,
            k14 = (table_key4 >> 8) & 0xff,
            k15 = (table_key4 >> 16) & 0xff,
            k16 = (table_key4 >> 24) & 0xff,
            k17 = table_key5 & 0xff,
            k18 = (table_key5 >> 8) & 0xff,
            k19 = (table_key5 >> 16) & 0xff,
            k20 = (table_key5 >> 24) & 0xff,
            k21 = table_key6 & 0xff,
            k22 = (table_key6 >> 8) & 0xff,
            k23 = (table_key6 >> 16) & 0xff,
            k24 = (table_key6 >> 24) & 0xff,
            k25 = table_key7 & 0xff,
            k26 = (table_key7 >> 8) & 0xff,
            k27 = (table_key7 >> 16) & 0xff,
            k28 = (table_key7 >> 24) & 0xff,
            k29 = table_key8 & 0xff,
            k30 = (table_key8 >> 8) & 0xff,
            k31 = (table_key8 >> 16) & 0xff,
            k32 = (table_key8 >> 24) & 0xff,
            k33 = table_key9 & 0xff,
            k34 = (table_key9 >> 8) & 0xff,
            k35 = (table_key9 >> 16) & 0xff,
            k36 = (table_key9 >> 24) & 0xff,
            k37 = table_key10 & 0xff,
            k38 = (table_key10 >> 8) & 0xff,
            k39 = (table_key10 >> 16) & 0xff,
            k40 = (table_key10 >> 24) & 0xff;

    for (i = 0; i < len; i++)
    {
        char tmp = buf[i] ^ k1;

        tmp ^= k2;
        tmp ^= k3;
        tmp ^= k4;
        tmp ^= k5;
        tmp ^= k6;
        tmp ^= k7;
        tmp ^= k8;
        tmp ^= k9;
        tmp ^= k10;
        tmp ^= k11;
        tmp ^= k12;
        tmp ^= k13;
        tmp ^= k14;
        tmp ^= k15;
        tmp ^= k16;
        tmp ^= k17;
        tmp ^= k18;
        tmp ^= k19;
        tmp ^= k20;
        tmp ^= k21;
        tmp ^= k22;
        tmp ^= k23;
        tmp ^= k24;
        tmp ^= k25;
        tmp ^= k26;
        tmp ^= k27;
        tmp ^= k28;
        tmp ^= k29;
        tmp ^= k30;
        tmp ^= k31;
        tmp ^= k32;
        tmp ^= k33;
        tmp ^= k34;
        tmp ^= k35;
        tmp ^= k36;
        tmp ^= k37;
        tmp ^= k38;
        tmp ^= k39;
        tmp ^= k40;



        out[i] = tmp;
    }

    return out;
}
