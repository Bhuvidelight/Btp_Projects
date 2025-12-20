sap.ui.define([
    "sap/m/Dialog",
    "sap/m/Input",
    "sap/m/Button",
    "sap/m/MessageToast"
], function (Dialog, Input, Button, MessageToast) {
    'use strict';

    return {
        TotalSum: async function (oContext) {

            const oModel = oContext.getModel();

            let input = new Input({
                placeholder: "Enter Customer ID (cId)"
            });

            let dialog = new Dialog({
                title: "Get Total Amount Spent",
                content: [input],
                beginButton: new Button({
                    text: "Submit",
                    press: async () => {

                        let cid = input.getValue();

                        try {
                            const result = await oModel.callFunction("/TotalSum", {
                                method: "POST",
                                urlParameters: { cId: cid }
                            });

                            MessageToast.show("Customer spent total: " + result);

                        } catch (err) {
                            MessageToast.show("Error: " + err.message);
                        }

                        dialog.close();
                    }
                }),
                endButton: new Button({
                    text: "Cancel",
                    press: () => dialog.close()
                })
            });

            dialog.open();
        }
    };
});
