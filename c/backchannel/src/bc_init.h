#ifndef __BC_INIT__

#include "bc_os_headers.h"

#include "bc_tracker.h"

#include "bc_heap_tracker.h"
#include "bc_ioctl_tracker.h"
#include "bc_function_tracker.h"
#include "bc_cmd_tracker.h"
#include "bc_stream_tracker.h"
#include "bc_trackers_reg.h"

void bc_init(void);
void bc_deinit(void);

#endif /* __BC_INIT__ */