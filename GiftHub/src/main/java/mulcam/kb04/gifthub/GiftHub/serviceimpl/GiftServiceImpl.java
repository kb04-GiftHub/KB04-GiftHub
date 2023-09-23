package mulcam.kb04.gifthub.GiftHub.serviceimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.GiftDto;
import mulcam.kb04.gifthub.GiftHub.entity.Customer;
import mulcam.kb04.gifthub.GiftHub.entity.Gift;
import mulcam.kb04.gifthub.GiftHub.repository.CustomerRepository;
import mulcam.kb04.gifthub.GiftHub.repository.GiftRepository;
import mulcam.kb04.gifthub.GiftHub.service.GiftService;

@Component
public class GiftServiceImpl implements GiftService{

	@Autowired
	private GiftRepository giftRepository;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Override
	public CustomerDto findByCustomerId(String id) {
//		Gift gift = giftRepository.findById(id);
//		GiftDto giftDto = GiftDto.entityToDto(gift);
//		return giftDto;
		
		Customer customer = customerRepository.findByCustomerId(id);
		CustomerDto customerDto = CustomerDto.entityToDto(customer);
		
		return customerDto;
		
	}
	
	@Override
	public List<Object[]> findByCustomerIdToList(String id) {
		Customer customer = new Customer();
		customer.setCustomerId(id);
		
		List<Object[]> list = giftRepository.findByCustomerIdToList(customer);
		
		
		return list;
	}

}
