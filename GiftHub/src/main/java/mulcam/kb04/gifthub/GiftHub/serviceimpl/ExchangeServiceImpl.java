package mulcam.kb04.gifthub.GiftHub.serviceimpl;

import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mulcam.kb04.gifthub.GiftHub.dto.ExchangeDto;
import mulcam.kb04.gifthub.GiftHub.entity.Store;
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

	@Override
	public Map<Integer, Long> getCountByMonth(Store storeId) {
		List<Object[]> counts = exchangeRepository.sumExchangeMoneyByMonth(storeId);

		Map<Integer, Long> countMap = IntStream.rangeClosed(1, 12).boxed()
				.collect(Collectors.toMap(Function.identity(), v -> 0L));

		for (Object[] count : counts) {
			countMap.put((Integer) count[0], (Long) count[1]);
		}
		return countMap;
	}

}
