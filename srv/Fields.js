const cds = require('@sap/cds')

module.exports = class LogisticsCompanyService extends cds.ApplicationService { init() {

  const { VehiclesSet, WorkOrders, WorkLogs } = cds.entities('LogisticsCompanyService')

   

  this.before (['CREATE', 'UPDATE'], VehiclesSet, async (req) => {
    console.log('Before CREATE/UPDATE VehiclesSet', req.data)
    const { regNumber} = req.data;
    if (!regNumber?.trim()) {
    return req.error(400, 'regNumber must be provided and non-empty.');
  }
  });

  
  this.after ('READ', VehiclesSet, async (vehiclesSet, req) => {
    console.log('After READ VehiclesSet', vehiclesSet)
  })
  this.before (['CREATE', 'UPDATE'], WorkOrders, async (req) => {
    console.log('Before CREATE/UPDATE WorkOrders', req.data)

    const { openedOn, closedOn,status } = req.data;

  if (closedOn && openedOn && new Date(closedOn) < new Date(openedOn)) {
    return req.error(400, 'closedOn cannot be earlier than openedOn.');
  }
   if (status === 'Closed' && !closedOn) {
    return req.error(400, 'If status is Closed, closedOn must be provided.');
  }
  })
  this.after ('READ', WorkOrders, async (workOrders, req) => {
    console.log('After READ WorkOrders', workOrders)
  })

//reopenWorkOrder
  this.on('reopenWorkOrder', async (req) => {
    const { WorkOrdersID } = req.data;
    let Test = new Date()

    await UPDATE(WorkOrders)
      .set({ status: 'InProgress', closedOn:Test })
      .where({ WorkOrdersID });

    return SELECT.one.from(WorkOrders).where({ WorkOrdersID });
  });

//closeworkorder
  this.on('closeWorkOrder',async(req) =>
    {
      
      if(!req.data.ID){
        return req.error('ID is required')
      }
     const WorkOrders = await SELECT.one.from(WorkOrders).where({ID:req.data.ID});
    if (!WorkOrders)
       return req.error(404, `WorkOrder with ID not found`);

  
    const today = new Date();
    const updatedData = {
      status: 'Closed',
      closedOn: today,
    };

    
    await UPDATE(WorkOrders).set(updatedData)
      .where({ID:req.data.ID});

    const updatedWorkOrder = await SELECT.one.from(WorkOrders).where({ ID:req.data.ID});
    return updatedWorkOrder;
  });



  


 this.before(['CREATE', 'UPDATE'], WorkLogs, async (req) => {
  console.log('Before CREATE/UPDATE WorkLogs', req.data);

  const {hours,mechanic} = req.data; 
  

  if (hours === undefined || hours === null) {
        return req.error(400, 'hours must be provided');
      }
      if (isNaN(hours)) {
        return req.error(400, 'hours must be numeric');
      }
      if (hours <= 0 || hours > 16) {
        return req.error(400, 'hours must be > 0 and ≤ 16');
      }

   if (!req.data.logDate) {
    return req.error(400, 'Log Date must be provided.');
  }

  //if (!mechanic?.trim())
    // return req.error(400, 'mechanic must be non-empty.');
  }
);

  this.after ('READ', WorkLogs, async (workLogs, req) => {
    console.log('After READ WorkLogs', workLogs)
  })


  return super.init()
}}
