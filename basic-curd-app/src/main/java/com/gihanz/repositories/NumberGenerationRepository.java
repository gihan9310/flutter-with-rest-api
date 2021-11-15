package com.gihanz.repositories;

import com.gihanz.documents.NumberGeneration;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NumberGenerationRepository extends MongoRepository<NumberGeneration, String> {

    NumberGeneration findBySearchKey(String searchKey);
}
