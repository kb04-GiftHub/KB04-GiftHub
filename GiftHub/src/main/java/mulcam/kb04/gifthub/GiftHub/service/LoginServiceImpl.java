package mulcam.kb04.gifthub.GiftHub.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;
import mulcam.kb04.gifthub.GiftHub.entity.Customer;
import mulcam.kb04.gifthub.GiftHub.entity.Store;
import mulcam.kb04.gifthub.GiftHub.repository.CustomerRepository;
import mulcam.kb04.gifthub.GiftHub.repository.StoreRepository;

@Component
public class LoginServiceImpl implements LoginService {

	@Autowired
	private StoreRepository storeRepository;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Override
	public StoreDto findByStoreId(String id) {
		Store store = storeRepository.findByStoreId(id);
		StoreDto storeDto = StoreDto.entityToDto(store);
		return storeDto;
	}

	@Override
	public int countByStoreId(String id) {
		int cnt = storeRepository.countByStoreId(id);
		return cnt;
	}

	@Override
	public CustomerDto findByCustomerId(String id) {
		Customer customer = customerRepository.findByCustomerId(id);
		CustomerDto customerDto = CustomerDto.entityToDto(customer);
		return customerDto;
	}

	@Override
	public int countByCustomerId(String id) {
		int cnt = customerRepository.countByCustomerId(id);
		return cnt;
	}

	

}
