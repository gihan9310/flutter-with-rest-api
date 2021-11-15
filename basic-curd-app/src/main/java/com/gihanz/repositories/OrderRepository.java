package com.gihanz.repositories;

import com.gihanz.documents.Order;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends MongoRepository<Order, String> {

    Integer countAllByIdIsNotNull();

}
