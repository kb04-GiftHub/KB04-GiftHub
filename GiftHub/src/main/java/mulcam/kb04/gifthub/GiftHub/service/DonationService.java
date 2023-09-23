package mulcam.kb04.gifthub.GiftHub.service;

import java.util.List;

import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.DonationDto;
import mulcam.kb04.gifthub.GiftHub.dto.DonationOrgDto;
import mulcam.kb04.gifthub.GiftHub.entity.Donation;

public interface DonationService {
	public CustomerDto findByCustomerId(String id);
	public DonationOrgDto findByOrgNo(int no);
	public CustomerDto updateCustomerPoint(String customerId, int pointToUse);
	public DonationOrgDto updateOrgTotal(int orgNo, int pointToUse);
	public void updateList(DonationDto donationDto);
	
	public List<Donation> getDonationByCustomerId(CustomerDto customerDto);
}
