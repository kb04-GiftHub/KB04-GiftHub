package mulcam.kb04.gifthub.GiftHub.serviceimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mulcam.kb04.gifthub.GiftHub.dto.GiftDto;
import mulcam.kb04.gifthub.GiftHub.dto.GiftUsedDto;
import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;
import mulcam.kb04.gifthub.GiftHub.entity.Gift;
import mulcam.kb04.gifthub.GiftHub.entity.GiftUsed;
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
	
//	@Override public List<GiftUsedDto> listByStoreId(String storeId) { 
//		Store store = storeRepository.findByStoreId(storeId); 
//		System.out.println(storeId);
//		System.out.println(store); 
//		List<Object[]> glist = giftUsedRepository.findByStoreId(store); 
//		List<GiftUsedDto> gudList = new ArrayList<GiftUsedDto>(); 
//		for(GiftUsed gu : glist) { 
//			GiftUsedDto dto = GiftUsedDto.entityToDto(gu); gudList.add(dto); } 
//		return gudList; 
//	}
	 
	
	@Override
	public List<Object[]> listByStoreId(String storeId) {
		Store store = storeRepository.findByStoreId(storeId);
		if(store == null) {
			return null;
		}
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
		if(gift  == null) {
			return null;
		}
		GiftDto dto = GiftDto.entityToDto(gift);
		return dto;
	}

	@Override
	public GiftDto updateStatus(GiftDto giftDto) {
		Gift gift = Gift.dtoToEntity(giftDto);
		gift = giftRepository.save(gift);
		giftDto = GiftDto.entityToDto(gift);
		return giftDto;
	}

	@Override
	public StoreDto updatePoint(StoreDto storeDto) {
		Store store = Store.dtoToEntity(storeDto);
		store=storeRepository.save(store);
		storeDto=StoreDto.entityToDto(store);
		return storeDto;
	}

	@Override
	
	public StoreDto findByStoreId(String storeId) {
		Store store = storeRepository.findByStoreId(storeId);
		StoreDto sdto = StoreDto.entityToDto(store);
		return sdto;
	}

	@Override
	public GiftUsedDto saveGiftUsed(GiftUsedDto guDto) {
		GiftUsed gu = GiftUsed.dtoToEntity(guDto);
		gu = giftUsedRepository.save(gu);
		guDto=GiftUsedDto.entityToDto(gu);
		return guDto;
	}

	@Override
	public int totalCountGiftUsed(String storeId) {
		int count = giftUsedRepository.countByStoreId(storeId);
		return count;
	}

}
