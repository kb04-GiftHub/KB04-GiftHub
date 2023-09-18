package mulcam.kb04.gifthub.GiftHub.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mulcam.kb04.gifthub.GiftHub.entity.Customer;
import mulcam.kb04.gifthub.GiftHub.repository.CustomerRepository;
import mulcam.kb04.gifthub.GiftHub.service.CustomerService;

@Service
public class CustomerSericeImpl implements CustomerService {

	@Autowired
	private CustomerRepository customerRepository;

	@Override
	public Customer getCustomerById(String customerId) {
		return customerRepository.findById(customerId)
				.orElseThrow(() -> new IllegalArgumentException("Invalid customer Id:" + customerId));
	}

	@Override
	@Transactional
	public void updateCustomerPoint(String customerId, int pointToUse) {
		Customer customer = getCustomerById(customerId);
		customer.setPoint(customer.getPoint() - pointToUse);
	}

}
