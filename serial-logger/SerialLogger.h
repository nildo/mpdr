#ifndef SERIAL_LOGGER_H
#define SERIAL_LOGGER_H

#define SERIAL_TIMER_PERIOD_MILLI 250

enum {
  LOG_NUM_PATHS,
  LOG_ROOT_ACTION,
  LOG_RESEND_PATHS,
  LOG_RECEIVED_COUNT,
  LOG_TOTAL_COUNT,
  LOG_TOTAL_SENT,
  LOG_ERROR_MPDR_SEND,
  LOG_MPDR_SEND_DONE,
  LOG_ERROR_MPDR_SEND_DONE,
  LOG_MPDR_RECEIVE,
  LOG_MPDR_PATHS_READY,
  LOG_RECEIVED_RADIO_1_SOURCE,
  LOG_RECEIVED_RADIO_2_SOURCE,
};

typedef nx_struct serial_log_message {
  nx_uint32_t timestamp;
  nx_uint16_t nodeid;
  nx_uint16_t evt;
  nx_uint16_t data;
} serial_log_message_t;

#endif