sap.ui.define([
    "sap/m/MessageToast",
    "sap/m/MessageBox"
], function(MessageToast, MessageBox) {  
    'use strict';

    return {
       onClickApproval: function (oContext, aSelectedContexts) {
            MessageBox.confirm("Do you want to send for the Approver?", {
                emphasizedAction: MessageBox.Action.YES,
                actions: [MessageBox.Action.YES, MessageBox.Action.NO],

                onClose: async function (oAction) {
                    debugger
                    if (oAction !== MessageBox.Action.YES) {
                        return;
                    }

                    try {
                        
                        const oModel = sap.ui.core.Element
                            .getElementById("orders::OrdersObjectPage--fe::StandardAction::Edit")
                            .getModel();

                        
                        const sOrderId = sap.ui.core.Element
                            .getElementById(
                                "orders::OrdersObjectPage--fe::FormContainer::GeneratedFacet1::FormElement::DataField::OrderID::Field-display"
                            )
                            .getText();

                        if (!sOrderId) {
                            MessageBox.error("Order ID not found");
                            return;
                        }

                        const IssueID = sap.ui.core.Element.getElementById("orders::OrdersObjectPage--fe::table::OrderstoIssues::LineItem::Issues-innerTable").getItems()[0].getBindingContext().getObject().IssueID
                        const oFunction = oModel.bindContext("/sendForApproval(...)");
                        oFunction.setParameter("OrderId", sOrderId);
                        oFunction.setParameter("IssueID",IssueID)

                        await oFunction.execute();

                        MessageBox.show("Sent for approval ");

                    } catch (err) {
                        console.error(err);
                        MessageBox.error("Failed to send for approval");
                    }
                }
            });
        }
    };
});
