sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {

        TextChange: function () {
    const newText = prompt("Enter text to change:");

    if (newText !== null) {
        sap.ui.core.Element
            .getElementById("ecommercemanagement::CustomersObjectPage--fe::CustomAction::1234")
            .setText(newText);
    }
} 

    };
});
