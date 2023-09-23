package mulcam.kb04.gifthub.GiftHub.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import mulcam.kb04.gifthub.GiftHub.dto.ExchangeDto;
import mulcam.kb04.gifthub.GiftHub.entity.Exchange;
import mulcam.kb04.gifthub.GiftHub.entity.Store;

@Repository
public interface ExchangeRepository extends JpaRepository<Exchange, Integer> {
	@Query("SELECT new mulcam.kb04.gifthub.GiftHub.dto.ExchangeDto(e.exchangeNo, s.storeName, e.exchangeBank, e.exchangeAccount, e.exchangeMoney, e.exchangeDate, e.storeId) FROM Store s JOIN Exchange e ON s.storeId = e.storeId WHERE s.storeId = :storeId ORDER BY e.exchangeDate asc")
	List<ExchangeDto> findExchangeDetailsByStoreId(@Param("storeId") String storeId);

//	@Query("SELECT FUNCTION('MONTH', e.exchangeDate) as month, SUM(e.exchangeMoney) as totalExchangeMoney FROM Exchange e GROUP BY FUNCTION('MONTH', e.exchangeDate)")
//	List<Object[]> sumExchangeMoneyByMonth();
	
	@Query("SELECT FUNCTION('MONTH', e.exchangeDate) as month, SUM(e.exchangeMoney) as totalExchangeMoney FROM Exchange e WHERE e.storeId = :storeId GROUP BY FUNCTION('MONTH', e.exchangeDate)")
	List<Object[]> sumExchangeMoneyByMonth(@Param("storeId") Store storeId);

}
