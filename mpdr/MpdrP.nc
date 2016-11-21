
configuration MpdrP {
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
  components new MpdrForwardingEngineP() as Forwarder;
  StdControl = Forwarder;
  AMSend = Forwarder;
  Receive = Forwarder;
  Packet = Forwarder;
  MpdrStats = Forwarder;

  components new MpdrRoutingEngineP() as Router;
  StdControl = Router;
  MpdrRouting = Router;

  components RF231ActiveMessageC;
  components RF212ActiveMessageC;

  Forwarder.Routing -> Router;
  Forwarder.Radio1Send -> RF231ActiveMessageC.AMSend[22];
  Forwarder.Radio2Send -> RF212ActiveMessageC.AMSend[22];
  Forwarder.Radio1Receive -> RF231ActiveMessageC.Receive[22];
  Forwarder.Radio2Receive -> RF212ActiveMessageC.Receive[22];
  Forwarder.Radio1Packet -> RF231ActiveMessageC;
  Forwarder.Radio2Packet -> RF212ActiveMessageC;
  Forwarder.Radio1Ack -> RF231ActiveMessageC;
  Forwarder.Radio2Ack -> RF212ActiveMessageC;

  components new PoolC(message_t, 90);
  components new QueueC(message_t*, 100) as Radio1Queue;
  components new QueueC(message_t*, 100) as Radio2Queue;

  Forwarder.MessagePool -> PoolC;
  Forwarder.Radio1Queue -> Radio1Queue;
  Forwarder.Radio2Queue -> Radio2Queue;

  Router.RoutingSend1 -> RF231ActiveMessageC.AMSend[23];
  Router.RoutingSend2 -> RF212ActiveMessageC.AMSend[23];
  Router.RoutingAck -> RF231ActiveMessageC;
  Router.RoutingReceive1 -> RF231ActiveMessageC.Receive[23];
  Router.RoutingReceive2 -> RF212ActiveMessageC.Receive[23];
  Router.RadioChannel1 -> RF231ActiveMessageC;
  Router.RadioChannel2 -> RF212ActiveMessageC;

  components SerialLoggerC;
  Router.SerialLogger -> SerialLoggerC;
  Forwarder.SerialLogger-> SerialLoggerC;
}
