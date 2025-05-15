sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.equip.demo.employeeequipment',
            componentId: 'MyTasksObjectPage',
            contextPath: '/MyTasks'
        },
        CustomPageDefinitions
    );
});