sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/equip/demo/employeeequipment/test/integration/FirstJourney',
		'com/equip/demo/employeeequipment/test/integration/pages/MyTasksList',
		'com/equip/demo/employeeequipment/test/integration/pages/MyTasksObjectPage'
    ],
    function(JourneyRunner, opaJourney, MyTasksList, MyTasksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/equip/demo/employeeequipment') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheMyTasksList: MyTasksList,
					onTheMyTasksObjectPage: MyTasksObjectPage
                }
            },
            opaJourney.run
        );
    }
);