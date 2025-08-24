sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'capapplication/test/integration/FirstJourney',
		'capapplication/test/integration/pages/PurchaseOrderSetList',
		'capapplication/test/integration/pages/PurchaseOrderSetObjectPage',
		'capapplication/test/integration/pages/POItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, PurchaseOrderSetList, PurchaseOrderSetObjectPage, POItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('capapplication') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePurchaseOrderSetList: PurchaseOrderSetList,
					onThePurchaseOrderSetObjectPage: PurchaseOrderSetObjectPage,
					onThePOItemsObjectPage: POItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);