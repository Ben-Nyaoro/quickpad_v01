import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ["approve", "reject"];

	connect() {
		console.log("Approval controller connected");
	}

	approveAccountingEntry() {
		const modalController = this.application.getControllerForElementAndIdentifier(
			this.approveTarget,
			"modal"
		);
		modalController.open();
	}
	rejectAccountingEntry() {
		const modalController = this.application.getControllerForElementAndIdentifier(
			this.rejectTarget,
			"modal"
		);
		modalController.openReject();
	}
}
