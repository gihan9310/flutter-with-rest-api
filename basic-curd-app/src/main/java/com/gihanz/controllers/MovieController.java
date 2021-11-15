package com.gihanz.controllers;

import com.gihanz.documents.Movie;
import com.gihanz.services.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/movie")
public class MovieController {

    @Autowired
    private MovieService movieService;
//    >sdsad
    @PostMapping(value = "save")
    public Movie save(@RequestBody Movie m){
      return   movieService.saveMovie(m);
    }
    @PutMapping(value = "/update")
    public Movie upadte(@RequestBody Movie m){
        return   movieService.updateMovie(m);
    }
    @DeleteMapping(value = "/delete/{id}")
    public String findAll(@PathVariable("id") String id){
        return movieService.deleteMovie(id);
    }

    @GetMapping(value = "/findAll")
    public List<Movie> findAll(){
        return movieService.findAllMovies();
    }

    @GetMapping(value = "/findById/{id}")
    public Movie findById(@PathVariable("id") String id){
        return movieService.findMovieById(id);
    }

    @GetMapping(value = "/findById/{id}/{rating}")
    public Movie findByIdAndRating(@PathVariable("id") String id,@PathVariable("rating") String rating){
        return movieService.findMovieByIdAndRating(id,rating);
    }
}
