package mulcam.kb04.gifthub.GiftHub.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.ExchangeDto;
import mulcam.kb04.gifthub.GiftHub.dto.PointChargeDto;
import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;

@Service
public interface PointService {
	public CustomerDto findByCustomerId(String id);
	public void save(PointChargeDto chargeDto);
	public void pointSave(CustomerDto customerDto);
	public Page<PointChargeDto> findByCustomerIdTPage(String id, Pageable pageable);
	public int countByCustomerId(String id);
	
	public StoreDto findByStoreId(String id);
	public void save(ExchangeDto exchangeDto);
	public void storePointSave(StoreDto storeDto);
}