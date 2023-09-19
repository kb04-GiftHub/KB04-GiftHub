package mulcam.kb04.gifthub.GiftHub.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.DonationDto;
import mulcam.kb04.gifthub.GiftHub.dto.DonationOrgDto;
import mulcam.kb04.gifthub.GiftHub.entity.Customer;
import mulcam.kb04.gifthub.GiftHub.entity.Donation;
import mulcam.kb04.gifthub.GiftHub.entity.DonationOrg;
import mulcam.kb04.gifthub.GiftHub.repository.CustomerRepository;
import mulcam.kb04.gifthub.GiftHub.repository.DonationOrgRepository;
import mulcam.kb04.gifthub.GiftHub.repository.DonationRepository;
import mulcam.kb04.gifthub.GiftHub.service.DonationService;

@Service
public class DonationServiceImpl implements DonationService {
	
	@Autowired
	CustomerRepository customerRepository;
	
	@Autowired
	DonationRepository donationRepository;
	
	@Autowired
	DonationOrgRepository orgRepository;

	@Override
	public List<Donation> getDonationByCustomerId(CustomerDto customerDto) {
		Customer customer = Customer.dtoToEntity(customerDto);
		return donationRepository.findByCustomerIdOrderByDonationDateDesc(customer);
	}

	@Override
	public CustomerDto findByCustomerId(String id) {
		Customer customer = customerRepository.findByCustomerId(id);
		CustomerDto customerDto = CustomerDto.entityToDto(customer);
		return customerDto;
	}

	@Override
	@Transactional
	public CustomerDto updateCustomerPoint(String customerId, int pointToUse) {
		Customer customer = customerRepository.findByCustomerId(customerId);
		customer.setPoint(customer.getPoint() - pointToUse);
		CustomerDto customerDto = CustomerDto.entityToDto(customer);
		return customerDto;
	}

	@Override
	@Transactional
	public DonationOrgDto updateOrgTotal(int orgNo, int pointToUse) {
		DonationOrg donationOrg = orgRepository.findByOrgNo(orgNo);
		donationOrg.setOrgTotal(donationOrg.getOrgTotal() + pointToUse);
		return DonationOrgDto.entityToDto(donationOrg);
	}

	@Override
	public DonationOrgDto findByOrgNo(int no) {
		DonationOrg donationOrg = orgRepository.findByOrgNo(no);
		return DonationOrgDto.entityToDto(donationOrg);
	}

	@Override
	public void updateList(DonationDto donationDto) {
		Donation donation = Donation.dtoToEntity(donationDto);
		donationRepository.save(donation);
	}

}
