package mulcam.kb04.gifthub.GiftHub.service;

import java.util.List;

import org.springframework.stereotype.Service;

import mulcam.kb04.gifthub.GiftHub.dto.GiftUsedDto;
import mulcam.kb04.gifthub.GiftHub.dto.ProductDto;

@Service
public interface GifticonService {
	
	public List<Object[]> listByStoreId(String storeId);
//  List<GiftUsedDto> listByStoreIdAndPage(String storeId, int page, int itemsPerPage);
//    List<Object[]> listByStoreIdAndPage(String storeId, int page, int itemsPerPage);
    int getTotalItemsByStoreId(String storeId);
	
	
}
