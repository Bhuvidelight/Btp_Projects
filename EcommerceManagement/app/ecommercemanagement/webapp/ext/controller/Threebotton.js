sap.ui.define([
    "sap/m/MessageToast"
], function (MessageToast) {
    "use strict";

    return {

        ThreebuttonA: function () {
            MessageToast.show("You clicked on A button");
        },
        Threebuttonb: function() {
            MessageToast.show("You clicked on B button");
        },
        Threebuttonc: function() {
            MessageToast.show("You clicked on C button");
        }

    };
});
