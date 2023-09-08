package mulcam.kb04.gifthub.GiftHub.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mulcam.kb04.gifthub.GiftHub.dto.ExchangeDto;
import mulcam.kb04.gifthub.GiftHub.repository.ExchangeRepository;
import mulcam.kb04.gifthub.GiftHub.service.ExchangeService;

@Service
public class ExchangeServiceImpl implements ExchangeService {

	@Autowired
	private ExchangeRepository exchangeRepository;
	
	@Override
	public List<ExchangeDto> findExchangeDetailsByStoreId(String storeId) {
		return exchangeRepository.findExchangeDetailsByStoreId(storeId);
	}

}
