package mulcam.kb04.gifthub.GiftHub.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import mulcam.kb04.gifthub.GiftHub.entity.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {

}
