package mulcam.kb04.gifthub.GiftHub.serviceimpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import mulcam.kb04.gifthub.GiftHub.dto.PromotionDto;
import mulcam.kb04.gifthub.GiftHub.entity.Promotion;
import mulcam.kb04.gifthub.GiftHub.entity.Store;
import mulcam.kb04.gifthub.GiftHub.repository.PromotionRepository;
import mulcam.kb04.gifthub.GiftHub.service.PromotionService;

@Component
public class PromotionServiceImpl implements PromotionService {
	@Autowired
	private PromotionRepository promotionRepository;
	
	@Override
	public PromotionDto findByPromotionNo(int promotionNo) {
		Promotion promotion = promotionRepository.findByPromotionNo(promotionNo);
		PromotionDto promotionDto = PromotionDto.entityToDto(promotion);
		return promotionDto;
	}
	
	@Override
	public List<PromotionDto> findByStoreId(String storeId) {
		Store store = new Store();
		store.setStoreId(storeId);
		List<Promotion> proList = promotionRepository.findByStoreId(store);
		List<PromotionDto> dtoList = new ArrayList<PromotionDto>();
		PromotionDto dto = new PromotionDto();
		for(Promotion pro : proList) {
			dto=PromotionDto.entityToDto(pro);
			dtoList.add(dto);
		}
		return dtoList;
	}

	@Override
	public void deleteBypromotionNo(int promotionNo) {
		promotionRepository.deleteById(promotionNo);
	}
	//update	
	@Override
	public PromotionDto save(PromotionDto promotionDto) {
		Promotion pro=promotionRepository.save(Promotion.dtoToEntity(promotionDto));
		promotionDto = PromotionDto.entityToDto(pro);
		return promotionDto;
	}

//	@Override
//	public PromotionDto insertPromotion(PromotionDto promotionDto) {
//		Promotion promotion = Promotion.dtoToEntity(promotionDto);
//		promotionRepository.insertPromotion(promotion);
//		promotionDto = PromotionDto.entityToDto(promotion);
//		return promotionDto;
//	}
	
    @Override
    public PromotionDto insertPromotion(PromotionDto promotionDto) {
        Promotion promotion = Promotion.dtoToEntity(promotionDto);
        promotion = promotionRepository.save(promotion);
        return PromotionDto.entityToDto(promotion);
    }


	}