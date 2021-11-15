package com.gihanz.repositories;

import com.gihanz.documents.Movie;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

public interface MovieRepository extends MongoRepository<Movie, String> {

    @Query(value ="{id:?0}")
    Movie findMovieById(String id);

    @Query(value ="{id:?0,rating:?1}")
    Movie findMovieByIdAndRating(String id,String rating);


}
