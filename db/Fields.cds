namespace LogisticsCompany;
using { managed } from '@sap/cds/common';

@assert.unique: {

 regNumber:[regNumber]
}

entity  Vehicles:managed{
  key regNumber       : String(20)@title : '{i18n>regnumber}' @assert.format : '^[A-Z]{2}\d{1,2}[A-Z]{0,2}\d{4}$';
      model           : localized String(50)   @title:'{i18n>model}' @mandatory;
      inServiceSince  : Date @title : '{i18n>inServiceSince}';
      odometer        : Decimal(10,2) @title : '{i18n>odometer}' @assert.range: [0, 2000000];
      totalHoursSpent : Decimal(10,2) @title : '{i18n>totalHoursSpent}'@assert.range:[0,3000];
     // WorkLogs:Association to many WorkLogs on WorkLogs.Vehicles =$self;
       WorkLogs:Composition of many  WorkLogs on WorkLogs.Vehicles =$self;

 }
    

entity  WorkOrders{
     key ID        :UUID @mandatory;
      openedOn     :localized DateTime @title : '{i18n>Orders OpenedOn}' @mandatory;
      closedOn     : DateTime;
      priority     : String(10);
      status       : String(20);
      issueSummary : String(255);
    //Vehicles:Association to WorkOrders;

}

entity  WorkLogs{

  key workOrder :String(20) @mandatory;
      logDate   : localized  Date @mandatory;
      hours     : Decimal(5,2);
      mechanic  : String(50);
      note      : LargeString;
        Vehicles :Association to Vehicles;
        WorkOrders:Association to WorkOrders;

}
