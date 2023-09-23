package mulcam.kb04.gifthub.GiftHub.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import mulcam.kb04.gifthub.GiftHub.entity.Customer;
import mulcam.kb04.gifthub.GiftHub.entity.Donation;

@Repository
public interface DonationRepository extends JpaRepository<Donation, Integer> {
	List<Donation> findByCustomerIdOrderByDonationDateDesc(Customer customer);
}
