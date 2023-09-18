package mulcam.kb04.gifthub.GiftHub.service;

import java.util.List;

import mulcam.kb04.gifthub.GiftHub.entity.Customer;
import mulcam.kb04.gifthub.GiftHub.entity.Donation;

public interface DonationService {
	public List<Donation> getDonationByCustomerId(Customer customer);
}
