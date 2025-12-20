sap.ui.define(['sap/ui/core/mvc/ControllerExtension'], function (ControllerExtension) {
	'use strict';

	return ControllerExtension.extend('admin.ext.controller.Controller', {
		// this section allows to extend lifecycle hooks or hooks provided by Fiori elements
		onBeforeSave: function () {
      const oView = this.getView();
      const oCtx = oView.getBindingContext();
      const oData = oCtx.getObject();

      const email = oData.email;
      const phone = oData.phone;

      // EMAIL validation
      if (email && !/^[a-z0-9]+@gmail\.com$/.test(email)) {
        MessageBox.error(
          "Email must be lowercase alphanumeric and end with @gmail.com"
        );
        return false; // ❗ stop save
      }

      // PHONE validation
      if (phone && !/^[6-9][0-9]{9}$/.test(phone)) {
        MessageBox.error(
          "Phone number must be a valid 10-digit Indian number"
        );
        return false; // ❗ stop save
      }

      return true;
    }
	});
});
