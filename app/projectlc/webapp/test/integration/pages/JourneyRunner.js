sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/cap8/projectlc/test/integration/pages/VehiclesSetList",
	"com/cap8/projectlc/test/integration/pages/VehiclesSetObjectPage"
], function (JourneyRunner, VehiclesSetList, VehiclesSetObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/cap8/projectlc') + '/test/flp.html#app-preview',
        pages: {
			onTheVehiclesSetList: VehiclesSetList,
			onTheVehiclesSetObjectPage: VehiclesSetObjectPage
        },
        async: true
    });

    return runner;
});

