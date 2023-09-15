package mulcam.kb04.gifthub.GiftHub.service;

import mulcam.kb04.gifthub.GiftHub.entity.Customer;

public interface CustomerService {
	Customer getCustomerById(String customerId);

	void updateCustomerPoint(String customerId, int pointToUse);
}
