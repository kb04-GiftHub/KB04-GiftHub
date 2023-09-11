package mulcam.kb04.gifthub.GiftHub.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import mulcam.kb04.gifthub.GiftHub.entity.Promotion;
import mulcam.kb04.gifthub.GiftHub.entity.Store;

@Repository
public interface PromotionRepository extends JpaRepository<Promotion, Integer> {
	Promotion findByPromotionNo(Integer promotionNo);
	List<Promotion> findByStoreId(Store storeId);
//	@Modifying
//	@Query("INSERT INTO Promotion(promotionNo, promotionTitle, promotionContent, promotionDate, promotionType, promotionImage, storeId) VALUES(:pro.promotionNo, :pro.promotionTitle, "
//			+ ":pro.promotionContent, SYSDATE, :pro.promotionType, :pro.promotionImage, :pro.storeId)")
//	void insertPromotion(@Param("pro") Promotion promotion);
}
