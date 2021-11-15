package com.gihanz.services;

import com.gihanz.documents.Item;
import com.gihanz.repositories.ItemRepository;
import com.gihanz.utils.NumberGenerationKeys;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ItemManageService {

    @Autowired
    private NumberGenService numberGenService;
    @Autowired
    private ItemRepository  itemRepository ;


    public Item saveItem(Item item){

        try {
//            Thread.sleep(2000);
            item .setItemCode(numberGenService.getNextCode(NumberGenerationKeys.ITEM_CODE));
            return itemRepository.save(item);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Transactional
    public Item updateItem(Item item){

        try {
            return itemRepository.save(item);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Transactional
    public String deleteByItemCode(String itemCode){
        try {
             itemRepository.deleteById(itemCode);
            return itemCode;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public Item findByCode(String itemCode){
        try {
          return   itemRepository.findByItemCode(itemCode);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }


    public List<Item> findAll(){
        try {

            return itemRepository.findAllByIdIsNotNullOrderByIdDesc();
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public Integer countAll(){
        try {
            return itemRepository.countAllByIdIsNotNull();
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
