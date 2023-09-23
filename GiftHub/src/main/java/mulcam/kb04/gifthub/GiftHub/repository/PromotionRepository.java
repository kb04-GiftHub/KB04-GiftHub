package mulcam.kb04.gifthub.GiftHub.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import mulcam.kb04.gifthub.GiftHub.entity.Promotion;
import mulcam.kb04.gifthub.GiftHub.entity.Store;

@Repository
public interface PromotionRepository extends JpaRepository<Promotion, Integer> {
	//가맹점주
	Promotion findByPromotionNo(int promotionNo);
	List<Promotion> findByStoreId(Store storeId);
	//사용자-promotionType의 필터를 걸기 위해 
	List<Promotion> findByPromotionType(int promotionType);
	
	@Query(value = "SELECT p.promotionNO, p.promotionTitle, p.promotionContent, p.promotionImage, p.promotionDate, p.promotionType, s.storeName, s.storeAdd2 FROM Promotion p JOIN Store s ON p.storeId = s.storeId WHERE p.promotionNo = :promotionNo ", nativeQuery=true)
	Object findPromotionAndStore(int promotionNo);
	
}
