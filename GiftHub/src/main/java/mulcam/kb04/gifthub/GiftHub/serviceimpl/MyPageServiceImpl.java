package mulcam.kb04.gifthub.GiftHub.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.JjimDto;
import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;
import mulcam.kb04.gifthub.GiftHub.entity.Customer;
import mulcam.kb04.gifthub.GiftHub.entity.Jjim;
import mulcam.kb04.gifthub.GiftHub.entity.Store;
import mulcam.kb04.gifthub.GiftHub.repository.CustomerRepository;
import mulcam.kb04.gifthub.GiftHub.repository.GiftRepository;
import mulcam.kb04.gifthub.GiftHub.repository.JjimRepository;
import mulcam.kb04.gifthub.GiftHub.repository.StoreRepository;
import mulcam.kb04.gifthub.GiftHub.service.MyPageService;

@Component
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private StoreRepository storeRepository;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private GiftRepository giftRepository;
	
	@Autowired
	private JjimRepository jjimRepository;

	@Override
	public StoreDto findByStoreId(String id) {
		Store store = storeRepository.findByStoreId(id);
		StoreDto storeDto = StoreDto.entityToDto(store);
		return storeDto;
	}

	@Override
	public void save(StoreDto storeDto) {
		Store store = Store.dtoToEntity(storeDto);
		storeRepository.save(store);
	}

	@Override
	public CustomerDto findByCustomerId(String id) {
		Customer customer = customerRepository.findByCustomerId(id);
		CustomerDto customerDto = CustomerDto.entityToDto(customer);
		return customerDto;
	}

	@Override
	public void MemberSave(CustomerDto customerDto) {
		Customer customer = Customer.dtoToEntity(customerDto);
		customerRepository.save(customer);
	}

	@Override
	public List<Object[]> findByCustomerIdToList(String id) {
		Customer customer = new Customer();
		customer.setCustomerId(id);
		
		List<Object[]> list = giftRepository.findByCustomerIdToList(customer);
		return list;
	}
	
	@Override
	public Object findByGiftNo(long no) {
		Object object = giftRepository.findByGiftNo(no);
		return object;
	}
	
	@Override
	public List<Object[]> findByCustomerIdToJjimList(String id) {
		Customer customer = new Customer();
		customer.setCustomerId(id);
		
		List<Object[]> list = jjimRepository.findByCustomerIdToList(customer);
		return list;
	}

	@Override
	public JjimDto save(JjimDto jjimDto) {
		Jjim jjim = Jjim.dtoToEntity(jjimDto);
		jjimRepository.save(jjim);
		
		JjimDto dto = JjimDto.entityToDto(jjim);
		return dto;
	}
}
