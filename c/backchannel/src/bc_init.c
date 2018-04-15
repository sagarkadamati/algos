#include "bc_init.h"

void
	__attribute__((constructor))
	bc_init(void)
{
	bc_init_heap_tracker();
	bc_init_ioctl_tracker();
	bc_init_function_tracer();
}

void
	__attribute__((destructor))
	bc_deinit(void)
{
}