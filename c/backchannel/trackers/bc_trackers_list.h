ADD_TRACKER(HEAP_TRACKER_ID, HEAP_TRACKER_NAME, HEAP_TRACKER_SIZE, BC_HEAP_STREAM_COUNT, bc_init_heap_tracker, bc_deinit_heap_tracker)
ADD_TRACKER(CMD_TRACKER_ID, CMD_TRACKER_NAME, CMD_TRACKER_SIZE, 0, bc_init_cmd_tracker, bc_deinit_cmd_tracker)
ADD_TRACKER(STREAM_TRACKER_ID, STREAM_TRACKER_NAME, STREAM_TRACKER_SIZE, 0, bc_init_stream_tracker, bc_deinit_stream_tracker)
