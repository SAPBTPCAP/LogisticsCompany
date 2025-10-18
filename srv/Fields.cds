using {LogisticsCompany } from '../db/Fields';

service LogisticsCompanyService {
   
   entity VehiclesSet as projection on LogisticsCompany.Vehicles;
   entity WorkOrders as projection on LogisticsCompany.WorkOrders;
   entity WorkLogs as projection on LogisticsCompany.WorkLogs;
    

}
