package com.gihanz.config;

import com.gihanz.documents.NumberGeneration;
import com.gihanz.repositories.ItemRepository;
import com.gihanz.repositories.NumberGenerationRepository;
import com.gihanz.utils.NumberGenerationKeys;
import org.springframework.stereotype.Component;

@Component
public class DBConfig {

/*
    Master Data set in Mongo db
 */

    DBConfig(NumberGenerationRepository numberGenerationRepository){

        if(numberGenerationRepository.findBySearchKey(NumberGenerationKeys.ORDER_UNIQUE_KEY)==null){
            NumberGeneration orderNumber = new NumberGeneration();
            orderNumber.setNextNumber(1l);
            orderNumber.setPrefix("ORDER-00");
            orderNumber.setSearchKey(NumberGenerationKeys.ORDER_UNIQUE_KEY);
            orderNumber.setSuffix("ORDER-00");
            numberGenerationRepository.save(orderNumber);
        }

        if(numberGenerationRepository.findBySearchKey(NumberGenerationKeys.ITEM_CODE)==null){
            NumberGeneration orderNumber = new NumberGeneration();
            orderNumber.setNextNumber(1l);
            orderNumber.setPrefix("IOO-00:");
            orderNumber.setSearchKey(NumberGenerationKeys.ITEM_CODE);
            orderNumber.setSuffix("IOO-00:");
            numberGenerationRepository.save(orderNumber);
        }

    }
}
