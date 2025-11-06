sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.cap8.projectlc',
            componentId: 'VehiclesSetObjectPage',
            contextPath: '/VehiclesSet'
        },
        CustomPageDefinitions
    );
});