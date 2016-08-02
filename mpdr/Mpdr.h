#ifndef MPDR_H
#define MPDR_H

#define MAX_MPDR_TABLE_SIZE 10
#define MAX_MPDR_HOPS 5
#define INVALID_ADDR AM_BROADCAST_ADDR

typedef struct mpdr_routing_item {
  am_addr_t source;
  am_addr_t destination;
  am_addr_t next_hop;
} mpdr_routing_item_t;

typedef struct mpdr_routing_table {
  uint8_t size;
  mpdr_routing_item_t items[MAX_MPDR_TABLE_SIZE];
} mpdr_routing_table_t;

typedef nx_struct mpdr_msg_hdr {
  nx_am_addr_t source;
  nx_am_addr_t destination;
  nx_am_addr_t next_hop;
} mpdr_msg_hdr_t;

typedef nx_struct mpdr_msg {
  nx_am_addr_t source;
  nx_am_addr_t destination;
  nx_am_addr_t next_hop;
  nx_uint16_t data;
} mpdr_msg_t;

typedef nx_struct mpdr_routing_msg {
  nx_am_addr_t source;
  nx_am_addr_t destination;
  nx_am_addr_t next_hop;
  nx_am_addr_t last_hop;
  nx_uint8_t path_id;
  nx_uint8_t size;
  nx_am_addr_t items[MAX_MPDR_HOPS];
} mpdr_routing_msg_t;

#endif