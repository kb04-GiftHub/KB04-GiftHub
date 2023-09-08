package mulcam.kb04.gifthub.GiftHub.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import mulcam.kb04.gifthub.GiftHub.dto.ExchangeDto;
import mulcam.kb04.gifthub.GiftHub.entity.Exchange;

@Repository
public interface ExchangeRepository extends JpaRepository<Exchange, Integer> {
	@Query("SELECT s.storeName, e.exchangeBank, e.exchangeAccount, e.exchangeMoney, e.exchangeDate FROM Store s JOIN Exchange e ON s.storeId = e.storeId WHERE s.storeId = :storeId")
	List<ExchangeDto> findExchangeDetailsByStoreId(@Param("storeId") String storeId);
}
