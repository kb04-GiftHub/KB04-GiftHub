package mulcam.kb04.gifthub.GiftHub.service;

import java.util.List;
import java.util.Map;

import mulcam.kb04.gifthub.GiftHub.dto.ExchangeDto;

public interface ExchangeService {
	List<ExchangeDto> findExchangeDetailsByStoreId(String storeId);

	Map<Integer, Long> getCountByMonth();
}
