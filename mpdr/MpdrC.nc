#include "Mpdr.h"

configuration MpdrC {
  provides {
    interface StdControl;
    interface MpdrRouting;
    interface AMSend;
    interface Receive;
    interface Packet;
    interface MpdrStats;
  }
}

implementation {
  components MpdrP;
  StdControl = MpdrP;
  MpdrRouting = MpdrP;
  AMSend = MpdrP;
  Receive = MpdrP;
  Packet = MpdrP;
  MpdrStats = MpdrP;
}
