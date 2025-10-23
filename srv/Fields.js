const cds = require('@sap/cds')

module.exports = class LogisticsCompanyService extends cds.ApplicationService { init() {

  const { VehiclesSet, WorkOrders, WorkLogs } = cds.entities('LogisticsCompanyService')

  this.before (['CREATE', 'UPDATE'], VehiclesSet, async (req) => {
      console.log('Before CREATE/UPDATE VehiclesSet', req.data)
  })
  this.after ('READ', VehiclesSet, async (vehiclesSet, req) => {
    console.log('After READ VehiclesSet', vehiclesSet)
  })
  this.before (['CREATE', 'UPDATE'], WorkOrders, async (req) => {
    console.log('Before CREATE/UPDATE WorkOrders', req.data)
  })
  this.after ('READ', WorkOrders, async (workOrders, req) => {
    console.log('After READ WorkOrders', workOrders)
  })
  this.before (['CREATE', 'UPDATE'], WorkLogs, async (req) => {
    console.log('Before CREATE/UPDATE WorkLogs', req.data)
  })
  this.after ('READ', WorkLogs, async (workLogs, req) => {
    console.log('After READ WorkLogs', workLogs)
  })


  return super.init()
}}
