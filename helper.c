#include "libasm_test.h"

void print_ok(void)
{
	printf("OK: %s\n", test_name);
	fflush(stdout);
}

void print_signaled_ko(const char *code)
{
	printf("KO: [SEGFAULT]: %s: with: %s\n", test_name, code);
	fflush(stdout);
}
