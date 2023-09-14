package mulcam.kb04.gifthub.GiftHub.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mulcam.kb04.gifthub.GiftHub.dto.GiftDto;
import mulcam.kb04.gifthub.GiftHub.entity.Gift;
import mulcam.kb04.gifthub.GiftHub.entity.Store;
import mulcam.kb04.gifthub.GiftHub.repository.GiftRepository;
import mulcam.kb04.gifthub.GiftHub.repository.GiftUsedRepository;
import mulcam.kb04.gifthub.GiftHub.repository.StoreRepository;
import mulcam.kb04.gifthub.GiftHub.service.GifticonService;

@Component
public class GifticonServiceImpl implements GifticonService {
	
	@Autowired
	GiftUsedRepository giftUsedRepository;
	
	@Autowired
	GiftRepository giftRepository;
	
	@Autowired
	StoreRepository storeRepository;
	
	/*
	 * @Override public List<GiftUsedDto> listByStoreId(String storeId) { Store
	 * store = storeRepository.findByStoreId(storeId); System.out.println(storeId);
	 * System.out.println(store); List<Object[]> glist =
	 * giftUsedRepository.findByStoreId(store); List<GiftUsedDto> gudList = new
	 * ArrayList<GiftUsedDto>(); for(GiftUsed gu : glist) { GiftUsedDto dto =
	 * GiftUsedDto.entityToDto(gu); gudList.add(dto); } return gudList; }
	 */
	
	@Override
	public List<Object[]> listByStoreId(String storeId) {
		Store store = storeRepository.findByStoreId(storeId);
		System.out.println(storeId);
		System.out.println(store);
		List<Object[]> glist = giftUsedRepository.findByStoreId(store);
		return glist;
	}

	@Override
	public int getTotalItemsByStoreId(String storeId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	
	public GiftDto findGiftBygiftNo(long giftNo) {
		Gift gift = giftRepository.getByGiftNo(giftNo);
		GiftDto dto = GiftDto.entityToDto(gift);
		return dto;
	}

}
