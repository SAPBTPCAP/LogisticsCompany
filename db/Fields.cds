namespace LogisticsCompany;

entity  Vehicles{
  key regNumber       : String(20)@title : '{i18n>Carregnumber}';
      model           : String(50) @title:'{i18n>CarModel}';
      inServiceSince  : Date @title : '{i18n>Car inServiceSince}';
      odometer        : Decimal(10,2) @title : '{i18n>Car odometer}';
      totalHoursSpent : Decimal(10,2) @title : '{i18n>TotalTime}';
 }
    

entity  WorkOrders{
     key ID        : UUID;
      openedOn     : DateTime;
      closedOn     : DateTime;
      priority     : String(10);
      status       : String(20);
      issueSummary : String(255);
}

entity  WorkLogs{

  key workOrder : String(20);
      logDate   : Date;
      hours     : Decimal(5,2);
      mechanic  : String(50);
      note      : LargeString;
}
