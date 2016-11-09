#ifndef TEST_RECEIVER_H
#define TEST_RECEIVER_H

#include <AM.h>

enum {
  LOG_SERIAL_START_ATTEMPTS,
  LOG_RADIO_START_ATTEMPTS,
  LOG_RADIO_1_SEND,
  LOG_RADIO_2_SEND,
  LOG_RADIO_1_SEND_ERROR,
  LOG_RADIO_2_SEND_ERROR,
  LOG_RADIO_1_SEND_DONE,
  LOG_RADIO_2_SEND_DONE,
  LOG_RADIO_1_SEND_DONE_ERROR,
  LOG_RADIO_2_SEND_DONE_ERROR,
  LOG_RADIO_1_RECEIVED,
  LOG_RADIO_2_RECEIVED,
  LOG_RADIO_1_TOTAL,
  LOG_RADIO_2_TOTAL,
  LOG_RADIO_1_RECEIVED_TOTAL,
  LOG_RADIO_2_RECEIVED_TOTAL,
};

typedef nx_struct receiver_msg {
  nx_am_addr_t source;
  nx_am_addr_t destination;
  nx_uint16_t seqno;
} receiver_msg_t;

#endif
