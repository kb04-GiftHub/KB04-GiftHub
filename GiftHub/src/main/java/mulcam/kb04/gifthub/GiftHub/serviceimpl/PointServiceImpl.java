package mulcam.kb04.gifthub.GiftHub.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.ExchangeDto;
import mulcam.kb04.gifthub.GiftHub.dto.PointChargeDto;
import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;
import mulcam.kb04.gifthub.GiftHub.entity.Customer;
import mulcam.kb04.gifthub.GiftHub.entity.Exchange;
import mulcam.kb04.gifthub.GiftHub.entity.PointCharge;
import mulcam.kb04.gifthub.GiftHub.entity.Store;
import mulcam.kb04.gifthub.GiftHub.repository.CustomerRepository;
import mulcam.kb04.gifthub.GiftHub.repository.ExchangeRepository;
import mulcam.kb04.gifthub.GiftHub.repository.PointChargeRepository;
import mulcam.kb04.gifthub.GiftHub.repository.StoreRepository;
import mulcam.kb04.gifthub.GiftHub.service.PointService;

@Component
public class PointServiceImpl implements PointService {
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private PointChargeRepository pointChargeRepository;
	
	@Autowired
	private StoreRepository storeRepository;
	
	@Autowired
	private ExchangeRepository exchangeRepository;

	// 회원 - 포인트 충전
	@Override
	public CustomerDto findByCustomerId(String id) {
		Customer customer = customerRepository.findByCustomerId(id);
		CustomerDto customerDto = CustomerDto.entityToDto(customer);
		return customerDto;
	}

	@Override
	public void save(PointChargeDto chargeDto) {
		PointCharge pointCharge = PointCharge.dtoToEntity(chargeDto);
		pointChargeRepository.save(pointCharge);
	}

	@Override
	public void pointSave(CustomerDto customerDto) {
		Customer customer = Customer.dtoToEntity(customerDto);
		customerRepository.save(customer);
	}
	
    @Override
	public Page<PointChargeDto> findByCustomerIdTPage(String id, Pageable pageable) {
        Customer customer = customerRepository.findByCustomerId(id);
        Page<PointCharge> chargePage = pointChargeRepository.findByCustomerIdOrderByChargeDateDesc(customer, pageable);
        return chargePage.map(PointChargeDto::entityToDto);
    }

    @Override
    public int countByCustomerId(String id) {
        Customer customer = customerRepository.findByCustomerId(id);
        return pointChargeRepository.countByCustomerId(customer);
    }

	// 가맹점 - 포인트 환전
	@Override
	public StoreDto findByStoreId(String id) {
		Store store = storeRepository.findByStoreId(id);
		StoreDto storeDto = StoreDto.entityToDto(store);
		return storeDto;
	}

	@Override
	public void save(ExchangeDto exchangeDto) {
		Exchange exchange = Exchange.dtoToEntity(exchangeDto);
		exchangeRepository.save(exchange);
	}

	@Override
	public void storePointSave(StoreDto storeDto) {
		Store store = Store.dtoToEntity(storeDto);
		storeRepository.save(store);
	}

}
