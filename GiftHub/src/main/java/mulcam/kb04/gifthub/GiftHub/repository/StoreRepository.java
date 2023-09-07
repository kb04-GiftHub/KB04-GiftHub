package mulcam.kb04.gifthub.GiftHub.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import mulcam.kb04.gifthub.GiftHub.entity.Store;

@Repository
public interface StoreRepository extends JpaRepository<Store, String> {

	Store findByStoreId(String id);
	
}
