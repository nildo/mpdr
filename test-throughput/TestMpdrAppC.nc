#include "TestMpdr.h"

configuration TestMpdrAppC {}

implementation {
  components MainC, TestMpdrC as App;
  App.Boot -> MainC;

  components new TimerMilliC() as InitTimerC;
  App.InitTimer -> InitTimerC;
  components new TimerMilliC() as SendTimerC;
  App.SendTimer -> SendTimerC;
  components new TimerMilliC() as StopTimerC;
  App.StopTimer -> StopTimerC;
  components new TimerMilliC() as FinishTimerC;
  App.FinishTimer -> FinishTimerC;

  components SerialLoggerC;
  App.SerialControl -> SerialLoggerC;
  App.SerialLogger -> SerialLoggerC;

  components RF231ActiveMessageC;
  components RF212ActiveMessageC;
  components DualRadioControlC;
  DualRadioControlC.Radio1Control -> RF231ActiveMessageC;
  DualRadioControlC.Radio2Control -> RF212ActiveMessageC;
  App.RadiosControl -> DualRadioControlC;

  components MpdrC;
  App.MpdrControl -> MpdrC;
  App.MpdrRouting -> MpdrC;
  App.MpdrSend -> MpdrC;
  App.MpdrReceive -> MpdrC;
  App.MpdrPacket -> MpdrC;

}
