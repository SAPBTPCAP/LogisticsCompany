namespace LogisticsCompany;
using { managed } from '@sap/cds/common';

@assert.unique: {
 regNumber:[regNumber]
}

entity  Vehicles:managed{
      key vehicleID:UUID;
      regNumber       : String(20)@title : '{i18n>regnumber}' @assert.format : '^[A-Z]{2}\d{1,2}[A-Z]{0,2}\d{4}$';
      model           : localized String(50)   @title:'{i18n>model}' @mandatory;
      inServiceSince  : Date @title : '{i18n>inServiceSince}';
      odometer        : Decimal(10,2) @title : '{i18n>odometer}' @assert.range: [0, 2000000];
      totalHoursSpent : Decimal(10,2) @title : '{i18n>totalHoursSpent}'@assert.range:[0,3000];
      WorkOrders:composition of many WorkOrders on WorkOrders.vehicle = $self; // Composition: One Vehicle → Many Work Orders

 }
    
type WorkOrdersStatus : String(20) enum{
  InProgress = 'Inprogress';
  open = 'Open';
  onhold = 'On Hold';
  completed = 'Completed';
  canceled = 'Canceled';
}
entity  WorkOrders{
  
     key WorkOrdersID        :UUID @mandatory;
      openedOn     :localized DateTime @title : '{i18n>Orders OpenedOn}' @mandatory;
      closedOn     : DateTime;
      priority     : String(10);
      status       : localized WorkOrdersStatus  @title : '{i18n>Status}'  default #onhold;
      issueSummary : String(255);
    vehicle : Association to Vehicles; // Association: to parent Vehicle
    WorkLogs: composition of many WorkLogs on WorkLogs.workOrders = $self;  
  // Composition: One Work Order → Many Work Logs

}

entity  WorkLogs{
       key WorkLogsID  : UUID  @mandatory;
       workOrder :String(20);
      logDate   : localized  Date @mandatory;
      hours     : Decimal(5,2);
      mechanic  : String(50);
      note      : LargeString;
      workOrders : Association to WorkOrders;// Association: to parent Work Order

}
