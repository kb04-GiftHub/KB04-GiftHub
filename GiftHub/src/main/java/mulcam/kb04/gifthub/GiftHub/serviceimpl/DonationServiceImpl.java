package mulcam.kb04.gifthub.GiftHub.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mulcam.kb04.gifthub.GiftHub.entity.Customer;
import mulcam.kb04.gifthub.GiftHub.entity.Donation;
import mulcam.kb04.gifthub.GiftHub.repository.DonationRepository;
import mulcam.kb04.gifthub.GiftHub.service.DonationService;

@Service
public class DonationServiceImpl implements DonationService {
	@Autowired
	DonationRepository donationRepository;

	@Override
	public List<Donation> getDonationByCustomerId(Customer customer) {
		return donationRepository.findByCustomerId(customer);
	}

}
