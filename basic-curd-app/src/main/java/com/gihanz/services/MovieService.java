package com.gihanz.services;

import com.gihanz.documents.Movie;
import com.gihanz.repositories.MovieRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MovieService {

    @Autowired
    private MovieRepository movieRepository;

    public Movie saveMovie(Movie movie){

        try {
           return movieRepository.save(movie);
        }catch (Exception e){
           e.printStackTrace();
           return null;
        }
    }

    public Movie updateMovie(Movie movie){

        try {
            return movieRepository.save(movie);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public String deleteMovie(String id){

        try {
             movieRepository.delete(movieRepository.findMovieById(id));
             return  id;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public List<Movie> findAllMovies(){

        try {
           return movieRepository.findAll();
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public Movie findMovieById(String id){

        try {
            return movieRepository.findMovieById(id);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public Movie findMovieByIdAndRating(String id, String rating){

        try {
            return movieRepository.findMovieByIdAndRating(id,rating);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

}
