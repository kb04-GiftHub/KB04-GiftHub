package mulcam.kb04.gifthub.GiftHub.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import mulcam.kb04.gifthub.GiftHub.entity.Donation;

public interface DonationRepository extends JpaRepository<Donation, Integer> {

}
