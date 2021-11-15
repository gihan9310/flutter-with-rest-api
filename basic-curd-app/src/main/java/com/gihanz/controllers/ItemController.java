package com.gihanz.controllers;

import com.gihanz.documents.Item;
import com.gihanz.services.ItemManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/items")
@CrossOrigin
public class ItemController {

    @Autowired
    private ItemManageService itemManageService ;

    @PostMapping("/save")
    public Item save(@RequestBody Item item){
      return itemManageService.saveItem(item);
    }

    @PutMapping("/update")
    public Item update(@RequestBody Item item){
        return itemManageService.updateItem(item);
    }
    @DeleteMapping("/delete/{itemCode}")
    public String delete(@PathVariable("itemCode") String itemCode){
        return itemManageService.deleteByItemCode(itemCode);
    }
    @GetMapping("/findByCode/{itemCode}")
    public Item findByItemCode(@PathVariable("itemCode") String itemCode){
        return itemManageService.findByCode(itemCode);
    }
    @GetMapping("/findAll")
    public List<Item> findAll(){
        return itemManageService.findAll();
    }

    @GetMapping("/countAll")
    public Integer countAllItem(){
        return itemManageService.countAll();
    }
}
