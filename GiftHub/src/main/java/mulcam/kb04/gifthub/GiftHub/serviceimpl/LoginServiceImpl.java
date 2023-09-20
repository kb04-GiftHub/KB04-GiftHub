package mulcam.kb04.gifthub.GiftHub.serviceimpl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;
import mulcam.kb04.gifthub.GiftHub.entity.Customer;
import mulcam.kb04.gifthub.GiftHub.entity.Gift;
import mulcam.kb04.gifthub.GiftHub.entity.Store;
import mulcam.kb04.gifthub.GiftHub.repository.CustomerRepository;
import mulcam.kb04.gifthub.GiftHub.repository.GiftRepository;
import mulcam.kb04.gifthub.GiftHub.repository.StoreRepository;
import mulcam.kb04.gifthub.GiftHub.service.LoginService;

@Component
public class LoginServiceImpl implements LoginService {

	@Autowired
	private StoreRepository storeRepository;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private GiftRepository giftRepository;
	
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

	@Override
	@Transactional
	public void updateStauts(String id) {
		Customer customer = new Customer();
		customer.setCustomerId(id);
		List<Gift> list = giftRepository.findByCustomerId(customer);
		
		Calendar calendar = Calendar.getInstance();
	    Date currentDate = calendar.getTime();
		
		for(Gift gift : list) {
			if(gift.getGiftExp().getTime() < currentDate.getTime()) {
				gift.setGiftStatus(3);
			}
		}
	}

}
