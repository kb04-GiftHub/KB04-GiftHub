package mulcam.kb04.gifthub.GiftHub.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.PointChargeDto;
import mulcam.kb04.gifthub.GiftHub.entity.Customer;
import mulcam.kb04.gifthub.GiftHub.entity.PointCharge;
import mulcam.kb04.gifthub.GiftHub.repository.CustomerRepository;
import mulcam.kb04.gifthub.GiftHub.repository.PointChargeRepository;
import mulcam.kb04.gifthub.GiftHub.service.PointChargeService;

@Component
public class PointChargeServiceImpl implements PointChargeService {
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private PointChargeRepository pointChargeRepository;

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
	
}
