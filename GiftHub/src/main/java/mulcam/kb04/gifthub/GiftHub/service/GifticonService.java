package mulcam.kb04.gifthub.GiftHub.service;

import java.util.List;

import org.springframework.stereotype.Service;

import mulcam.kb04.gifthub.GiftHub.dto.GiftDto;
import mulcam.kb04.gifthub.GiftHub.dto.GiftUsedDto;
import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;

@Service
public interface GifticonService {
	
	public List<Object[]> listByStoreId(String storeId);
//	public List<GiftUsedDto> listByStoreId(String storeId, int page, int itemsPerPage);
//  List<Object[]> listByStoreIdAndPage(String storeId, int page, int itemsPerPage);
    int getTotalItemsByStoreId(String storeId);
    
	public GiftDto findGiftBygiftNo(long giftNo);
	public GiftDto updateStatus(GiftDto giftDto);
	
	public StoreDto updatePoint(StoreDto storeDto);
	public StoreDto findByStoreId(String storeId);
	public GiftUsedDto saveGiftUsed(GiftUsedDto guDto);
	public int totalCountGiftUsed(String storeId);
	
	
}
