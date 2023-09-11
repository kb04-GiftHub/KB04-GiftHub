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
public class RegisterServiceImpl implements RegisterService {

	@Autowired
	private StoreRepository storeRepository;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	// 가맹점
	@Override
	public void save(StoreDto storeDto) {
		Store store = Store.dtoToEntity(storeDto);
		storeRepository.save(store);
	}

	@Override
	public int countByStoreId(String id) {
		int cnt = storeRepository.countByStoreId(id);
		return cnt;
	}

	// 회원
	@Override
	public void memberSave(CustomerDto customerDto) {
		Customer customer = Customer.dtoToEntity(customerDto);
		customerRepository.save(customer);
	}

	@Override
	public int memberCountByStoreId(String id) {
		int cnt = customerRepository.countByCustomerId(id);
		return cnt;
	}

}
