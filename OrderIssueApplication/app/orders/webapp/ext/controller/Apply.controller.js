sap.ui.define(['sap/ui/core/mvc/ControllerExtension', 'sap/m/MessageToast', 'sap/m/MessageBox'],
    function (ControllerExtension, MessageToast, MessageBox) {
        'use strict';

        return ControllerExtension.extend('orders.ext.controller.Apply', {

            override: {
                onInit: function () {
                    this._bApplyAttached = false;

				const oView = this.getView();  
				oView.addEventDelegate({
					onAfterRendering: function () {
						debugger;

						if (this._bApplyAttached) {
							return;
						}

						let oApplyButton = sap.ui.core.Element.getElementById("orders::IssuesObjectPage--fe::FooterBar::StandardAction::Apply");


						if (oApplyButton) {
							oApplyButton.attachPress(async function () {
								debugger; 
								this._bApplyAttached = true;
								console.log("Apply button clicked");
								let issueid = sap.ui.core.Element.getElementById("orders::IssuesObjectPage--fe::FormContainer::IssuesInfo::FormElement::DataField::IssueID::Field-display");

								if (issueid) {
									issueid = issueid.getText();
								}
								console.log("--->" + issueid);

								let comment = sap.ui.core.Element.getElementById("orders::IssuesObjectPage--fe::CustomSubSection::Comments--commentsFragment-CommentTextArea")

								if (comment) {

									comment = comment.getValue()
									sap.m.MessageBox.show("Comment added to drafts");
								}

								let oModel = sap.ui.core.Element.getElementById("orders::IssuesObjectPage--fe::FormContainer::IssuesInfo::FormElement::DataField::IssueID::Field-display").getModel();
								let oFunc = oModel.bindContext(`/commentsDraft(...)`);
								oFunc.setParameter("IssueID", issueid)
								oFunc.setParameter("description", comment)
								await oFunc.execute();
								const result = oFunc.getBoundContext().getObject();
								
								console.log("---->." + result)

							}.bind(this));
						} else {
							console.warn("Apply button missing.");
						}
					}
				});
			},

		}
	});
});