// sap.ui.define([
//     "sap/m/MessageToast"
// ], function(MessageToast) {
//     'use strict';

//     return {
//         /**
//          * Generated event handler.
//          *
//          * @param oEvent the event object provided by the event provider.
//          */
//         onPress: function(oEvent) {
//             MessageToast.show("Custom handler invoked.");
//         }
//     };
// });


sap.ui.define([
    "sap/m/MessageToast",
    "sap/m/MessageBox"
], function (MessageToast, MessageBox) {
    'use strict';

    return {
        /**
         * Generated event handler.
         *
         * @param oEvent the event object provided by the event provider.
         */
        onApprovePress: async function (oEvent) {
            debugger
            const oSource = oEvent.getSource();

            const oContext = oSource.getBindingContext();

            if (!oContext) {
                MessageBox.error("No Issue context found");
                return;
            }

            const sIssueId = oContext.getProperty("IssueID");
            const sorderId = oContext.getProperty("OrderID");

            if (!sIssueId && !sorderId) {
                MessageBox.error("Invalid Issue id or order id");
                return;
            }

            let response = await $.ajax({
                url: `/odata/v4/my-service2/Issues?$filter=IssueID eq '${sIssueId}'`,
                method: "GET"
            });
            console.log(response);

            const instanceId = response.value[0].InstanceId;


            if (!instanceId) {
                MessageBox.error("instance id is null ");
                return;
            }

            console.log("Issue ID:", sIssueId, sorderId);

            let oModel = sap.ui.core.Element.getElementById("approver::IssuesObjectPage--fe::Form::GeneratedFacet1::Content").getModel();
            let oFunc = oModel.bindContext(`/ApproverComment(...)`);
            oFunc.setParameter("IssueID", sIssueId);
            oFunc.setParameter("status", "Approved");


            await oFunc.execute();
            const result = oFunc.getBoundContext().getObject();

            let sComment = sap.ui.core.Element.getElementById("approver::IssuesObjectPage--fe::CustomSubSection::ApproverComments--commentsFragment-CommentTextArea");
            let commentValue = sComment.getValue();


            if (!commentValue) {
                MessageBox.error("Comment cannot be empty");
                return;
            }

            const cUrl = `/odata/v4/my-service2/IssueComments`;


            $.ajax({
                url: cUrl,
                method: "POST",
                contentType: "application/json",
                data: JSON.stringify({
                    comment: commentValue,
                    IssueID: sIssueId,
                    role: "Approver"
                }),
                success: function (oResponse) {
                    console.log("Comment created under order:", oResponse);
                }
            });

            sComment.setValue("");
            sap.m.MessageBox.success("Approved successfully");

            // } catch (error) {
            //     console.error("Error updating comment:", error);
            // }
        },
        onRejectPress: async function (oEvent) {
            debugger
            const oSource = oEvent.getSource();

            const oContext = oSource.getBindingContext();

            if (!oContext) {
                MessageBox.error("No Issue context found");
                return;
            }

            const sIssueId = oContext.getProperty("IssueID");
            const sorderId = oContext.getProperty("OrderID");

            if (!sIssueId && !sorderId) {
                MessageBox.error("Invalid Issue id or order id");
                return;
            }



            console.log("Issue ID:", sIssueId, sorderId);

            let oModel = sap.ui.core.Element.getElementById("approver::IssuesObjectPage--fe::Form::GeneratedFacet1::Content").getModel();
            let oFunc = oModel.bindContext(`/ApproverComment(...)`);
            oFunc.setParameter("IssueID", sIssueId);
            oFunc.setParameter("status", "Rejected");


            await oFunc.execute();
            const result = oFunc.getBoundContext().getObject();

            sap.m.MessageBox.error("Approval rejected");

          
        },
                onLoadComments: async function (oEvent) {
            debugger
    const oSource = oEvent.getSource();
    const oContext = oSource.getBindingContext();
  
    if (!oContext) {
        MessageToast.show("No Issue context found");
        return;
    }

    const sIssueId = oContext.getProperty("IssueID");

    if (!sIssueId) {
        MessageToast.show("Invalid Issue ID");
        return;
    }

    console.log("Issue ID:", sIssueId);

    let aComments = [];

    try {
        const sFilter = `IssueID eq '${encodeURIComponent(sIssueId)}'`;
const sUrl = `/odata/v4/my-service1/IssueComments?$filter=${sFilter}&$orderby=createdAt desc`;

        const oResponse = await $.ajax({
            method: "GET",
            url: sUrl,
            dataType: "json"
        });

        aComments = oResponse.value || [];
        console.log("Loaded comments:", aComments);
    } catch (err) {
        MessageToast.show("Failed to load comments");
        console.error("Error loading comments:", err);
        return;
    }

    if (aComments.length === 0) {
     MessageToast.show("No comments");
    return
}

    // Preserve controller reference
    const that = this;

    // Create dialog only once
    if (!this._commentsDialog) {
        this._commentsVBox = new sap.m.VBox({
            width: "100%"
        }).addStyleClass("sapUiSmallMargin");

       const oScrollContainer = new sap.m.ScrollContainer({
    height: "300px",  // fixed height
    vertical: true,
    horizontal: false,
    content: [this._commentsVBox]
});

this._commentsDialog = new sap.m.Dialog({
    title: "Comments",
    contentWidth: "450px",
    contentHeight: "350px", 
    content: oScrollContainer,
    endButton: new sap.m.Button({
        text: "Close",
        press: function () {
            that._commentsDialog.close();
        }
    })
});

       
        const oView = oSource.getParent() && oSource.getParent().getParent() 
                    || sap.ui.getCore().byId("__xmlview0") 
                    || this.getOwnerComponent()?.getRootControl(); 

        // Better and most reliable way: traverse up from the button
        let oCurrent = oSource;
        let oFoundView = null;
        while (oCurrent && !oFoundView) {
            if (oCurrent.getMetadata().getName() === "sap.ui.core.mvc.View") {
                oFoundView = oCurrent;
                break;
            }
            oCurrent = oCurrent.getParent();
        }

        if (oFoundView) {
            oFoundView.addDependent(this._commentsDialog);
        } else {
            console.warn("View not found for addDependent – dialog may leak");
           
        }
    }

    // Clear previous content
    this._commentsVBox.removeAllItems();

    if (aComments.length === 0) {
        this._commentsVBox.addItem(
            new sap.m.Text({ text: "No comments yet." }).addStyleClass("sapUiSmallMargin")
        );
    } else {
        aComments.forEach(function (oComment) {

    
    const oCommentPanel = new sap.m.Panel({
    expandable: false,     
    width: "100%",           
    
}).addStyleClass("sapUiSmallMarginBottom");

    // Layout inside panel
    const oHBox = new sap.m.HBox({
        alignItems: "Start"
    });

    // Avatar
    oHBox.addItem(
        new sap.m.Avatar({
            icon: "sap-icon://person-placeholder",
            displaySize: "S"
        }).addStyleClass("sapUiTinyMarginEnd")
    );

    // Text container
    const oTextVBox = new sap.m.VBox();

    // Created By

      oTextVBox.addItem(
    new sap.m.Text({
        text: oComment.createdBy +"  "+oComment.role || "",  
        wrapping: true
    })
);

    oTextVBox.addItem(
    new sap.m.Text({
        text: oComment.comment || "",  
        wrapping: true
    })
);

    // Date
    oTextVBox.addItem(
        new sap.m.Text({
            text: oComment.createdAt
                ? new Date(oComment.createdAt).toLocaleString()
                : ""
        }).addStyleClass("sapUiTinyMarginBottom")
    );

    // Description
    oTextVBox.addItem(
        new sap.m.Text({
            text: oComment.description || "",
            wrapping: true
        })
    );

    oHBox.addItem(oTextVBox);

    // Add HBox to Panel
    oCommentPanel.addContent(oHBox);

    // Add Panel to main VBox
    this._commentsVBox.addItem(oCommentPanel);

}.bind(this));

    }

    // Open dialog
    this._commentsDialog.open();
}
       
    };

    
});